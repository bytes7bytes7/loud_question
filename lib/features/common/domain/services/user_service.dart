import 'package:injectable/injectable.dart';
import '../../../../repositories/interfaces/interfaces.dart';
import '../entities/user/user.dart';
import '../providers/user_provider.dart';
import '../value_objects/user_id/user_id.dart';

@singleton
class UserService {
  const UserService({
    required UserRepository userRepository,
    required UserProvider userProvider,
  })  : _userRepository = userRepository,
        _userProvider = userProvider;

  final UserRepository _userRepository;
  final UserProvider _userProvider;

  Future<User?> get({
    required UserID id,
    bool cached = true,
  }) async {
    if (cached) {
      final saved = await _userRepository.get(id: id);

      if (saved != null) {
        return saved;
      }
    }

    try {
      final loaded = await _userProvider.getUser(id.str);

      return loaded.value.fold(
        (l) {
          throw Exception('Can not get user');
        },
        (r) async {
          await _userRepository.update(user: r.user);
          return r.user;
        },
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> update({required User user}) async {
    return _userRepository.update(user: user);
  }
}
