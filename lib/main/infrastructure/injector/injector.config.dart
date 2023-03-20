// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:freezed_annotation/freezed_annotation.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:loud_question/features/auth/application/application.dart'
    as _i64;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i71;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i73;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i72;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i74;
import 'package:loud_question/features/auth/auth.dart' as _i66;
import 'package:loud_question/features/common/common.dart' as _i45;
import 'package:loud_question/features/common/domain/domain.dart' as _i37;
import 'package:loud_question/features/common/domain/dto/log_in_response/log_in_response.dart'
    as _i21;
import 'package:loud_question/features/common/domain/dto/log_out_response/log_out_response.dart'
    as _i27;
import 'package:loud_question/features/common/domain/dto/register_response/register_response.dart'
    as _i23;
import 'package:loud_question/features/common/domain/dto/verify_token_response/verify_token_response.dart'
    as _i25;
import 'package:loud_question/features/common/domain/providers/auth_exception_provider.dart'
    as _i50;
import 'package:loud_question/features/common/domain/providers/auth_provider.dart'
    as _i49;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i29;
import 'package:loud_question/features/common/domain/providers/user_provider.dart'
    as _i42;
import 'package:loud_question/features/common/domain/services/auth_service.dart'
    as _i48;
import 'package:loud_question/features/common/domain/services/token_service.dart'
    as _i35;
import 'package:loud_question/features/common/domain/services/user_service.dart'
    as _i41;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i46;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i47;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i30;
import 'package:loud_question/features/common/infrastructure/domain_providers/user_provider/user_provider.dart'
    as _i38;
import 'package:loud_question/features/common/infrastructure/json_converters/log_in_response_json_coverter.dart'
    as _i22;
import 'package:loud_question/features/common/infrastructure/json_converters/log_out_response_json_converter.dart'
    as _i28;
import 'package:loud_question/features/common/infrastructure/json_converters/register_response_json_converter.dart'
    as _i24;
import 'package:loud_question/features/common/infrastructure/json_converters/verify_token_response_json_converter.dart'
    as _i26;
import 'package:loud_question/features/home/application/application.dart'
    as _i6;
import 'package:loud_question/features/home/application/blocs/home/home_bloc.dart'
    as _i68;
import 'package:loud_question/features/home/application/coordinators/home_coordinator.dart'
    as _i69;
import 'package:loud_question/features/home/domain/dto/create_lobby_response/create_lobby_response.dart'
    as _i9;
import 'package:loud_question/features/home/domain/dto/get_lobbies_response/get_lobbies_response.dart'
    as _i19;
import 'package:loud_question/features/home/domain/dto/join_lobby_response/join_lobby_response.dart'
    as _i11;
import 'package:loud_question/features/home/domain/providers/home_provider.dart'
    as _i57;
import 'package:loud_question/features/home/domain/services/home_service.dart'
    as _i59;
import 'package:loud_question/features/home/infrastructure/domain_providers/home_provider/home_provider.dart'
    as _i58;
import 'package:loud_question/features/home/infrastructure/json_converters/create_lobby_response_json_converter.dart'
    as _i10;
import 'package:loud_question/features/home/infrastructure/json_converters/get_lobbies_response_json_converter.dart'
    as _i20;
import 'package:loud_question/features/home/infrastructure/json_converters/join_lobby_response_json_converter.dart'
    as _i12;
import 'package:loud_question/features/lobby/application/blocs/lobby/lobby_bloc.dart'
    as _i70;
import 'package:loud_question/features/lobby/domain/domain.dart' as _i51;
import 'package:loud_question/features/lobby/domain/dto/get_game_state_response/get_game_state_response.dart'
    as _i17;
import 'package:loud_question/features/lobby/domain/dto/get_lobby_response/get_lobby_response.dart'
    as _i15;
import 'package:loud_question/features/lobby/domain/providers/game_provider.dart'
    as _i56;
import 'package:loud_question/features/lobby/domain/providers/lobby_provider.dart'
    as _i63;
import 'package:loud_question/features/lobby/domain/services/game_service.dart'
    as _i55;
import 'package:loud_question/features/lobby/domain/services/lobby_service.dart'
    as _i62;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/game_provider/game_provider.dart'
    as _i52;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/lobby_provider/lobby_provider.dart'
    as _i60;
import 'package:loud_question/features/lobby/infrastructure/json_converters/get_game_state_response_json_converter.dart'
    as _i18;
import 'package:loud_question/features/lobby/infrastructure/json_converters/get_lobby_response_json_converter.dart'
    as _i16;
import 'package:loud_question/main/infrastructure/coordinators/home_coordinator.dart'
    as _i7;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i65;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i67;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i14;
import 'package:loud_question/repositories/implementations/account_repository.dart'
    as _i44;
import 'package:loud_question/repositories/implementations/game_repository.dart'
    as _i54;
import 'package:loud_question/repositories/implementations/lobby_repository.dart'
    as _i61;
import 'package:loud_question/repositories/implementations/token_repository.dart'
    as _i34;
import 'package:loud_question/repositories/implementations/user_repository.dart'
    as _i40;
import 'package:loud_question/repositories/interfaces/account_repository.dart'
    as _i43;
import 'package:loud_question/repositories/interfaces/game_repository.dart'
    as _i53;
import 'package:loud_question/repositories/interfaces/interfaces.dart' as _i36;
import 'package:loud_question/repositories/interfaces/token_repository.dart'
    as _i33;
import 'package:loud_question/repositories/interfaces/user_repository.dart'
    as _i39;
import 'package:loud_question/utils/server_settings.dart' as _i31;
import 'package:problem_details/problem_details.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i32;

import '../../../env/env_module.dart' as _i75;
import '../router/router.dart' as _i76;
import '../third_party/dio_module.dart' as _i77;
import '../third_party/shared_preferences_module.dart' as _i78;

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
  gh.singleton<_i3.Dio>(dioModule.dio);
  gh.singleton<_i4.GlobalKey<_i4.NavigatorState>>(routerModule.rootKey);
  gh.singleton<_i5.GoRouter>(
      routerModule.router(gh<_i4.GlobalKey<_i4.NavigatorState>>()));
  gh.singleton<_i6.HomeCoordinator>(
      _i7.ProdHomeCoordinator(goRouter: gh<_i5.GoRouter>()));
  gh.singleton<
          _i8.JsonConverter<_i9.CreateLobbyResponse, Map<String, Object?>>>(
      _i10.CreateLobbyResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i11.JoinLobbyResponse, Map<String, Object?>>>(
      _i12.JoinLobbyResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i13.ProblemDetails, Map<String, Object?>>>(
      _i14.ProblemDetailsJsonConverter());
  gh.singleton<_i8.JsonConverter<_i15.GetLobbyResponse, Map<String, Object?>>>(
      _i16.GetLobbyResponseJsonConverter());
  gh.singleton<
          _i8.JsonConverter<_i17.GetGameStateResponse, Map<String, Object?>>>(
      _i18.GetGameStateResponseJsonConverter());
  gh.singleton<
          _i8.JsonConverter<_i19.GetLobbiesResponse, Map<String, Object?>>>(
      _i20.GetLobbiesResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i21.LogInResponse, Map<String, Object?>>>(
      _i22.LogInResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i23.RegisterResponse, Map<String, Object?>>>(
      _i24.RegisterResponseJsonConverter());
  gh.singleton<
          _i8.JsonConverter<_i25.VerifyTokenResponse, Map<String, Object?>>>(
      _i26.VerifyTokenResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i27.LogOutResponse, Map<String, Object?>>>(
      _i28.LogOutResponseJsonConverter());
  await gh.singletonAsync<_i29.ServerExceptionProvider>(
    () => _i30.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i31.ServerSettings>(envModule.serverSettings);
  await gh.factoryAsync<_i32.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i33.TokenRepository>(
      _i34.ProdTokenRepository(prefs: gh<_i32.SharedPreferences>()));
  await gh.singletonAsync<_i35.TokenService>(
    () {
      final i = _i35.TokenService(
        dio: gh<_i3.Dio>(),
        tokenRepository: gh<_i36.TokenRepository>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i37.UserProvider>(_i38.ProdUserProvider(
    gh<_i3.Dio>(),
    gh<_i31.ServerSettings>(),
  ));
  gh.singleton<_i39.UserRepository>(
      _i40.ProdUserRepository(prefs: gh<_i32.SharedPreferences>()));
  gh.singleton<_i41.UserService>(_i41.UserService(
    userRepository: gh<_i36.UserRepository>(),
    userProvider: gh<_i42.UserProvider>(),
  ));
  gh.singleton<_i43.AccountRepository>(
      _i44.ProdAccountRepository(prefs: gh<_i32.SharedPreferences>()));
  gh.singleton<_i45.AuthExceptionProvider>(
      _i46.ProdAuthExceptionProvider(gh<_i45.ServerExceptionProvider>()));
  gh.singleton<_i37.AuthProvider>(_i47.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i31.ServerSettings>(),
  ));
  await gh.singletonAsync<_i48.AuthService>(
    () {
      final i = _i48.AuthService(
        authProvider: gh<_i49.AuthProvider>(),
        authExceptionProvider: gh<_i50.AuthExceptionProvider>(),
        accountRepository: gh<_i43.AccountRepository>(),
        tokenService: gh<_i35.TokenService>(),
        userService: gh<_i41.UserService>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i51.GameProvider>(_i52.ProdGameProvider(
    gh<_i3.Dio>(),
    gh<_i31.ServerSettings>(),
  ));
  gh.singleton<_i53.GameRepository>(
      _i54.ProdGameRepository(prefs: gh<_i32.SharedPreferences>()));
  gh.singleton<_i55.GameService>(_i55.GameService(
    gameRepository: gh<_i53.GameRepository>(),
    gameProvider: gh<_i56.GameProvider>(),
  ));
  gh.singleton<_i57.HomeProvider>(_i58.ProdHomeProvider(
    gh<_i3.Dio>(),
    gh<_i31.ServerSettings>(),
  ));
  gh.singleton<_i59.HomeService>(
      _i59.HomeService(homeProvider: gh<_i57.HomeProvider>()));
  gh.singleton<_i51.LobbyProvider>(_i60.ProdLobbyProvider(
    gh<_i3.Dio>(),
    gh<_i31.ServerSettings>(),
  ));
  gh.singleton<_i36.LobbyRepository>(
      _i61.ProdLobbyRepository(prefs: gh<_i32.SharedPreferences>()));
  gh.singleton<_i62.LobbyService>(_i62.LobbyService(
    lobbyRepository: gh<_i36.LobbyRepository>(),
    lobbyProvider: gh<_i63.LobbyProvider>(),
  ));
  gh.singleton<_i64.LogInCoordinator>(
    _i65.ProdLogInCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i48.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i66.RegisterCoordinator>(
    _i67.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i48.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i68.HomeBloc>(() => _i68.HomeBloc(
        authService: gh<_i37.AuthService>(),
        homeService: gh<_i59.HomeService>(),
        userService: gh<_i37.UserService>(),
        coordinator: gh<_i69.HomeCoordinator>(),
      ));
  gh.factory<_i70.LobbyBloc>(() => _i70.LobbyBloc(
        lobbyService: gh<_i62.LobbyService>(),
        userService: gh<_i37.UserService>(),
        gameService: gh<_i55.GameService>(),
      ));
  gh.factory<_i71.LogInBloc>(() => _i71.LogInBloc(
        logInCoordinator: gh<_i72.LogInCoordinator>(),
        authService: gh<_i48.AuthService>(),
      ));
  gh.factory<_i73.RegisterBloc>(() => _i73.RegisterBloc(
        registerCoordinator: gh<_i74.RegisterCoordinator>(),
        authService: gh<_i45.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i75.EnvModule {}

class _$RouterModule extends _i76.RouterModule {}

class _$DioModule extends _i77.DioModule {}

class _$SharedPreferencesModule extends _i78.SharedPreferencesModule {}
