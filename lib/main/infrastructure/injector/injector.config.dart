// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:freezed_annotation/freezed_annotation.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:loud_question/features/auth/application/application.dart'
    as _i72;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i80;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i82;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i81;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i83;
import 'package:loud_question/features/auth/auth.dart' as _i74;
import 'package:loud_question/features/common/common.dart' as _i51;
import 'package:loud_question/features/common/domain/domain.dart' as _i43;
import 'package:loud_question/features/common/domain/dto/get_user_response/get_user_response.dart'
    as _i29;
import 'package:loud_question/features/common/domain/dto/log_in_response/log_in_response.dart'
    as _i27;
import 'package:loud_question/features/common/domain/dto/log_out_response/log_out_response.dart'
    as _i23;
import 'package:loud_question/features/common/domain/dto/register_response/register_response.dart'
    as _i13;
import 'package:loud_question/features/common/domain/dto/verify_token_response/verify_token_response.dart'
    as _i11;
import 'package:loud_question/features/common/domain/providers/auth_exception_provider.dart'
    as _i56;
import 'package:loud_question/features/common/domain/providers/auth_provider.dart'
    as _i55;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i35;
import 'package:loud_question/features/common/domain/providers/user_provider.dart'
    as _i48;
import 'package:loud_question/features/common/domain/services/auth_service.dart'
    as _i54;
import 'package:loud_question/features/common/domain/services/token_service.dart'
    as _i41;
import 'package:loud_question/features/common/domain/services/user_service.dart'
    as _i47;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i52;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i53;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i36;
import 'package:loud_question/features/common/infrastructure/domain_providers/user_provider/user_provider.dart'
    as _i44;
import 'package:loud_question/features/common/infrastructure/json_converters/get_user_response_json_converter.dart'
    as _i30;
import 'package:loud_question/features/common/infrastructure/json_converters/log_in_response_json_converter.dart'
    as _i28;
import 'package:loud_question/features/common/infrastructure/json_converters/log_out_response_json_converter.dart'
    as _i24;
import 'package:loud_question/features/common/infrastructure/json_converters/register_response_json_converter.dart'
    as _i14;
import 'package:loud_question/features/common/infrastructure/json_converters/verify_token_response_json_converter.dart'
    as _i12;
import 'package:loud_question/features/home/application/application.dart'
    as _i8;
import 'package:loud_question/features/home/application/blocs/home/home_bloc.dart'
    as _i76;
import 'package:loud_question/features/home/application/coordinators/home_coordinator.dart'
    as _i77;
import 'package:loud_question/features/home/domain/dto/create_lobby_response/create_lobby_response.dart'
    as _i15;
import 'package:loud_question/features/home/domain/dto/get_lobbies_response/get_lobbies_response.dart'
    as _i17;
import 'package:loud_question/features/home/domain/dto/join_lobby_response/join_lobby_response.dart'
    as _i19;
import 'package:loud_question/features/home/domain/providers/home_provider.dart'
    as _i63;
import 'package:loud_question/features/home/domain/services/home_service.dart'
    as _i65;
import 'package:loud_question/features/home/infrastructure/domain_providers/home_provider/home_provider.dart'
    as _i64;
import 'package:loud_question/features/home/infrastructure/json_converters/create_lobby_response_json_converter.dart'
    as _i16;
import 'package:loud_question/features/home/infrastructure/json_converters/get_lobbies_response_json_converter.dart'
    as _i18;
import 'package:loud_question/features/home/infrastructure/json_converters/join_lobby_response_json_converter.dart'
    as _i20;
import 'package:loud_question/features/lobby/application/application.dart'
    as _i3;
import 'package:loud_question/features/lobby/application/blocs/lobby/lobby_bloc.dart'
    as _i78;
import 'package:loud_question/features/lobby/application/providers/date_time_provider.dart'
    as _i79;
import 'package:loud_question/features/lobby/domain/domain.dart' as _i57;
import 'package:loud_question/features/lobby/domain/dto/game_state_response/game_state_response.dart'
    as _i33;
import 'package:loud_question/features/lobby/domain/dto/get_lobby_response/get_lobby_response.dart'
    as _i25;
import 'package:loud_question/features/lobby/domain/dto/set_leader_request/set_leader_request.dart'
    as _i31;
import 'package:loud_question/features/lobby/domain/providers/game_provider.dart'
    as _i62;
import 'package:loud_question/features/lobby/domain/providers/listen_game_state_provider.dart'
    as _i66;
import 'package:loud_question/features/lobby/domain/providers/lobby_provider.dart'
    as _i71;
import 'package:loud_question/features/lobby/domain/services/game_service.dart'
    as _i61;
import 'package:loud_question/features/lobby/domain/services/lobby_service.dart'
    as _i70;
import 'package:loud_question/features/lobby/infrastructure/app_providers/date_time_provider.dart'
    as _i4;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/game_provider/game_provider.dart'
    as _i58;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/listen_game_state_provider.dart'
    as _i67;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/lobby_provider/lobby_provider.dart'
    as _i68;
import 'package:loud_question/features/lobby/infrastructure/json_converters/game_state_response_json_converter.dart'
    as _i34;
import 'package:loud_question/features/lobby/infrastructure/json_converters/get_lobby_response_json_converter.dart'
    as _i26;
import 'package:loud_question/features/lobby/infrastructure/json_converters/set_leader_request_json_converter.dart'
    as _i32;
import 'package:loud_question/main/infrastructure/coordinators/home_coordinator.dart'
    as _i9;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i73;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i75;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i22;
import 'package:loud_question/repositories/implementations/account_repository.dart'
    as _i50;
import 'package:loud_question/repositories/implementations/game_repository.dart'
    as _i60;
import 'package:loud_question/repositories/implementations/lobby_repository.dart'
    as _i69;
import 'package:loud_question/repositories/implementations/token_repository.dart'
    as _i40;
import 'package:loud_question/repositories/implementations/user_repository.dart'
    as _i46;
import 'package:loud_question/repositories/interfaces/account_repository.dart'
    as _i49;
import 'package:loud_question/repositories/interfaces/game_repository.dart'
    as _i59;
import 'package:loud_question/repositories/interfaces/interfaces.dart' as _i42;
import 'package:loud_question/repositories/interfaces/token_repository.dart'
    as _i39;
import 'package:loud_question/repositories/interfaces/user_repository.dart'
    as _i45;
import 'package:loud_question/utils/server_settings.dart' as _i37;
import 'package:problem_details/problem_details.dart' as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i38;

import '../../../env/env_module.dart' as _i84;
import '../router/router.dart' as _i85;
import '../third_party/dio_module.dart' as _i86;
import '../third_party/shared_preferences_module.dart' as _i87;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioModule = _$DioModule();
  final routerModule = _$RouterModule();
  final envModule = _$EnvModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.singleton<_i3.DateTimeProvider>(_i4.ProdDateTimeProvider());
  gh.singleton<_i5.Dio>(dioModule.dio);
  gh.singleton<_i6.GlobalKey<_i6.NavigatorState>>(routerModule.rootKey);
  gh.singleton<_i7.GoRouter>(
      routerModule.router(gh<_i6.GlobalKey<_i6.NavigatorState>>()));
  gh.singleton<_i8.HomeCoordinator>(
      _i9.ProdHomeCoordinator(goRouter: gh<_i7.GoRouter>()));
  gh.singleton<
          _i10.JsonConverter<_i11.VerifyTokenResponse, Map<String, Object?>>>(
      _i12.VerifyTokenResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i13.RegisterResponse, Map<String, Object?>>>(
      _i14.RegisterResponseJsonConverter());
  gh.singleton<
          _i10.JsonConverter<_i15.CreateLobbyResponse, Map<String, Object?>>>(
      _i16.CreateLobbyResponseJsonConverter());
  gh.singleton<
          _i10.JsonConverter<_i17.GetLobbiesResponse, Map<String, Object?>>>(
      _i18.GetLobbiesResponseJsonConverter());
  gh.singleton<
          _i10.JsonConverter<_i19.JoinLobbyResponse, Map<String, Object?>>>(
      _i20.JoinLobbyResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i21.ProblemDetails, Map<String, Object?>>>(
      _i22.ProblemDetailsJsonConverter());
  gh.singleton<_i10.JsonConverter<_i23.LogOutResponse, Map<String, Object?>>>(
      _i24.LogOutResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i25.GetLobbyResponse, Map<String, Object?>>>(
      _i26.GetLobbyResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i27.LogInResponse, Map<String, Object?>>>(
      _i28.LogInResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i29.GetUserResponse, Map<String, Object?>>>(
      _i30.GetUserResponseJsonConverter());
  gh.singleton<_i10.JsonConverter<_i31.SetLeaderRequest, Map<String, Object?>>>(
      _i32.SetLeaderRequestJsonConverter());
  gh.singleton<
          _i10.JsonConverter<_i33.GameStateResponse, Map<String, Object?>>>(
      _i34.GameStateResponseJsonConverter());
  await gh.singletonAsync<_i35.ServerExceptionProvider>(
    () => _i36.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i37.ServerSettings>(envModule.serverSettings);
  await gh.factoryAsync<_i38.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i39.TokenRepository>(
      _i40.ProdTokenRepository(prefs: gh<_i38.SharedPreferences>()));
  await gh.singletonAsync<_i41.TokenService>(
    () {
      final i = _i41.TokenService(
        dio: gh<_i5.Dio>(),
        tokenRepository: gh<_i42.TokenRepository>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i43.UserProvider>(_i44.ProdUserProvider(
    gh<_i5.Dio>(),
    gh<_i37.ServerSettings>(),
  ));
  gh.singleton<_i45.UserRepository>(
      _i46.ProdUserRepository(prefs: gh<_i38.SharedPreferences>()));
  gh.singleton<_i47.UserService>(_i47.UserService(
    userRepository: gh<_i42.UserRepository>(),
    userProvider: gh<_i48.UserProvider>(),
  ));
  gh.singleton<_i49.AccountRepository>(
      _i50.ProdAccountRepository(prefs: gh<_i38.SharedPreferences>()));
  gh.singleton<_i51.AuthExceptionProvider>(
      _i52.ProdAuthExceptionProvider(gh<_i51.ServerExceptionProvider>()));
  gh.singleton<_i43.AuthProvider>(_i53.ProdAuthProvider(
    gh<_i5.Dio>(),
    gh<_i37.ServerSettings>(),
  ));
  await gh.singletonAsync<_i54.AuthService>(
    () {
      final i = _i54.AuthService(
        authProvider: gh<_i55.AuthProvider>(),
        authExceptionProvider: gh<_i56.AuthExceptionProvider>(),
        accountRepository: gh<_i49.AccountRepository>(),
        tokenService: gh<_i41.TokenService>(),
        userService: gh<_i47.UserService>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i57.GameProvider>(_i58.ProdGameProvider(
    gh<_i5.Dio>(),
    gh<_i37.ServerSettings>(),
  ));
  gh.singleton<_i59.GameRepository>(
      _i60.ProdGameRepository(prefs: gh<_i38.SharedPreferences>()));
  gh.singleton<_i61.GameService>(_i61.GameService(
    gameRepository: gh<_i59.GameRepository>(),
    gameProvider: gh<_i62.GameProvider>(),
  ));
  gh.singleton<_i63.HomeProvider>(_i64.ProdHomeProvider(
    gh<_i5.Dio>(),
    gh<_i37.ServerSettings>(),
  ));
  gh.singleton<_i65.HomeService>(
      _i65.HomeService(homeProvider: gh<_i63.HomeProvider>()));
  gh.factory<_i66.ListenGameStateProvider>(() =>
      _i67.ProdListenGameStateProvider(gameProvider: gh<_i62.GameProvider>()));
  gh.singleton<_i57.LobbyProvider>(_i68.ProdLobbyProvider(
    gh<_i5.Dio>(),
    gh<_i37.ServerSettings>(),
  ));
  gh.singleton<_i42.LobbyRepository>(
      _i69.ProdLobbyRepository(prefs: gh<_i38.SharedPreferences>()));
  gh.singleton<_i70.LobbyService>(_i70.LobbyService(
    lobbyRepository: gh<_i42.LobbyRepository>(),
    lobbyProvider: gh<_i71.LobbyProvider>(),
  ));
  gh.singleton<_i72.LogInCoordinator>(
    _i73.ProdLogInCoordinator(
      goRouter: gh<_i7.GoRouter>(),
      authService: gh<_i54.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i74.RegisterCoordinator>(
    _i75.ProdRegisterCoordinator(
      goRouter: gh<_i7.GoRouter>(),
      authService: gh<_i54.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i76.HomeBloc>(() => _i76.HomeBloc(
        authService: gh<_i43.AuthService>(),
        homeService: gh<_i65.HomeService>(),
        userService: gh<_i43.UserService>(),
        coordinator: gh<_i77.HomeCoordinator>(),
      ));
  gh.factory<_i78.LobbyBloc>(() => _i78.LobbyBloc(
        lobbyService: gh<_i57.LobbyService>(),
        userService: gh<_i43.UserService>(),
        gameService: gh<_i57.GameService>(),
        accountRepository: gh<_i49.AccountRepository>(),
        dateTimeProvider: gh<_i79.DateTimeProvider>(),
        listenGameStateProvider: gh<_i57.ListenGameStateProvider>(),
      ));
  gh.factory<_i80.LogInBloc>(() => _i80.LogInBloc(
        logInCoordinator: gh<_i81.LogInCoordinator>(),
        authService: gh<_i54.AuthService>(),
      ));
  gh.factory<_i82.RegisterBloc>(() => _i82.RegisterBloc(
        registerCoordinator: gh<_i83.RegisterCoordinator>(),
        authService: gh<_i51.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i84.EnvModule {}

class _$RouterModule extends _i85.RouterModule {}

class _$DioModule extends _i86.DioModule {}

class _$SharedPreferencesModule extends _i87.SharedPreferencesModule {}
