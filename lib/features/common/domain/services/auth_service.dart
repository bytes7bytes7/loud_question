import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../repositories/interfaces/account_repository.dart';
import '../../../../utils/json_either_wrapper.dart';
import '../dto/dto.dart';
import '../entities/entities.dart';
import '../exceptions/exceptions.dart';
import '../providers/auth_exception_provider.dart';
import '../providers/auth_provider.dart';
import 'token_service.dart';
import 'user_service.dart';

@singleton
class AuthService {
  AuthService({
    required AuthProvider authProvider,
    required AuthExceptionProvider authExceptionProvider,
    required AccountRepository accountRepository,
    required TokenService tokenService,
    required UserService userService,
  })  : _authProvider = authProvider,
        _authExceptionProvider = authExceptionProvider,
        _accountRepository = accountRepository,
        _tokenService = tokenService,
        _userService = userService;

  final AuthProvider _authProvider;
  final AuthExceptionProvider _authExceptionProvider;
  final AccountRepository _accountRepository;
  final TokenService _tokenService;
  final UserService _userService;
  final _userController = BehaviorSubject<User?>();

  Stream<User?> get onUserChanged => _userController.stream;

  Stream<bool> get onLoggedInChanged =>
      _userController.stream.map((e) => e != null);

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final token = await _tokenService.getToken();

    if (token != null) {
      try {
        await _verifyToken();
      } catch (e) {
        //
      }
    }
  }

  @disposeMethod
  void dispose() {
    _userController.close();
  }

  Future<void> register({
    required String name,
    required String password,
  }) async {
    final request = RegisterRequest(name: name, password: password);

    late JsonEitherWrapper<ProblemDetails, RegisterResponse> response;
    try {
      response = await _authProvider.register(request);
    } catch (e) {
      throw const ServerError();
    }

    await response.value.fold(
      (l) async {
        _userController.add(null);
        await _accountRepository.removeMyID();
        await _tokenService.removeToken();

        if (l.title == _authExceptionProvider.nameIsAlreadyInUse) {
          throw const NameIsAlreadyInUse();
        } else {
          throw Exception();
        }
      },
      (r) async {
        _userController.add(r.user);
        await _accountRepository.saveMyID(id: r.user.id);
        await _tokenService.saveToken(token: r.token);
        await _userService.update(user: r.user);
      },
    );
  }

  Future<void> logIn({
    required String name,
    required String password,
  }) async {
    final request = LogInRequest(name: name, password: password);

    late JsonEitherWrapper<ProblemDetails, LogInResponse> response;
    try {
      response = await _authProvider.logIn(request);
    } catch (e) {
      throw const ServerError();
    }

    await response.value.fold(
      (l) async {
        _userController.add(null);
        await _accountRepository.removeMyID();
        await _tokenService.removeToken();

        if (l.title == _authExceptionProvider.invalidCredentials) {
          throw const InvalidCredentials();
        } else {
          throw Exception();
        }
      },
      (r) async {
        _userController.add(r.user);
        await _accountRepository.saveMyID(id: r.user.id);
        await _tokenService.saveToken(token: r.token);
        await _userService.update(user: r.user);
      },
    );
  }

  Future<void> logOut() async {
    const request = LogOutRequest();

    late JsonEitherWrapper<ProblemDetails, LogOutResponse> response;
    try {
      response = await _authProvider.logOut(request);
    } catch (e) {
      throw const ServerError();
    }

    await response.value.fold(
      (l) async {
        _userController.add(null);
        await _accountRepository.removeMyID();
        await _tokenService.removeToken();
      },
      (r) async {
        _userController.add(null);
        await _accountRepository.removeMyID();
        await _tokenService.removeToken();
      },
    );
  }

  Future<void> _verifyToken() async {
    late JsonEitherWrapper<ProblemDetails, VerifyTokenResponse> response;
    try {
      response = await _authProvider.verifyToken();
    } catch (e) {
      throw const ServerError();
    }

    await response.value.fold(
      (l) async {
        await _tokenService.removeToken();
      },
      (r) async {
        final myID = await _accountRepository.getMyID();

        if (myID == null) {
          _userController.add(null);
          return;
        }

        try {
          final me = await _userService.get(id: myID);
          _userController.add(me);
        } catch (e) {
          _userController.add(null);
        }
      },
    );
  }
}
