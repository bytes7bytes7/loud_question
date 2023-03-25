// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:freezed_annotation/freezed_annotation.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i8;
import 'package:injectable/injectable.dart' as _i2;
import 'package:just_audio/just_audio.dart' as _i3;
import 'package:loud_question/features/auth/application/application.dart'
    as _i77;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i87;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i89;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i88;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i90;
import 'package:loud_question/features/auth/auth.dart' as _i79;
import 'package:loud_question/features/common/common.dart' as _i56;
import 'package:loud_question/features/common/domain/domain.dart' as _i48;
import 'package:loud_question/features/common/domain/dto/get_user_response/get_user_response.dart'
    as _i30;
import 'package:loud_question/features/common/domain/dto/log_in_response/log_in_response.dart'
    as _i28;
import 'package:loud_question/features/common/domain/dto/log_out_response/log_out_response.dart'
    as _i26;
import 'package:loud_question/features/common/domain/dto/register_response/register_response.dart'
    as _i22;
import 'package:loud_question/features/common/domain/dto/verify_token_response/verify_token_response.dart'
    as _i12;
import 'package:loud_question/features/common/domain/providers/auth_exception_provider.dart'
    as _i61;
import 'package:loud_question/features/common/domain/providers/auth_provider.dart'
    as _i60;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i40;
import 'package:loud_question/features/common/domain/providers/user_provider.dart'
    as _i53;
import 'package:loud_question/features/common/domain/services/auth_service.dart'
    as _i59;
import 'package:loud_question/features/common/domain/services/token_service.dart'
    as _i46;
import 'package:loud_question/features/common/domain/services/user_service.dart'
    as _i52;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i57;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i58;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i41;
import 'package:loud_question/features/common/infrastructure/domain_providers/user_provider/user_provider.dart'
    as _i49;
import 'package:loud_question/features/common/infrastructure/json_converters/get_user_response_json_converter.dart'
    as _i31;
import 'package:loud_question/features/common/infrastructure/json_converters/log_in_response_json_converter.dart'
    as _i29;
import 'package:loud_question/features/common/infrastructure/json_converters/log_out_response_json_converter.dart'
    as _i27;
import 'package:loud_question/features/common/infrastructure/json_converters/register_response_json_converter.dart'
    as _i23;
import 'package:loud_question/features/common/infrastructure/json_converters/verify_token_response_json_converter.dart'
    as _i13;
import 'package:loud_question/features/home/application/application.dart'
    as _i9;
import 'package:loud_question/features/home/application/blocs/home/home_bloc.dart'
    as _i81;
import 'package:loud_question/features/home/application/coordinators/home_coordinator.dart'
    as _i82;
import 'package:loud_question/features/home/domain/dto/create_lobby_response/create_lobby_response.dart'
    as _i14;
import 'package:loud_question/features/home/domain/dto/get_lobbies_response/get_lobbies_response.dart'
    as _i16;
import 'package:loud_question/features/home/domain/dto/get_song_response/get_song_response.dart'
    as _i38;
import 'package:loud_question/features/home/domain/dto/join_lobby_response/join_lobby_response.dart'
    as _i18;
import 'package:loud_question/features/home/domain/providers/home_provider.dart'
    as _i68;
import 'package:loud_question/features/home/domain/services/home_service.dart'
    as _i70;
import 'package:loud_question/features/home/infrastructure/domain_providers/home_provider/home_provider.dart'
    as _i69;
import 'package:loud_question/features/home/infrastructure/json_converters/create_lobby_response_json_converter.dart'
    as _i15;
import 'package:loud_question/features/home/infrastructure/json_converters/get_lobbies_response_json_converter.dart'
    as _i17;
import 'package:loud_question/features/home/infrastructure/json_converters/get_song_response_json_converter.dart'
    as _i39;
import 'package:loud_question/features/home/infrastructure/json_converters/join_lobby_response_json_converter.dart'
    as _i19;
import 'package:loud_question/features/lobby/application/application.dart'
    as _i4;
import 'package:loud_question/features/lobby/application/blocs/lobby/lobby_bloc.dart'
    as _i85;
import 'package:loud_question/features/lobby/application/providers/date_time_provider.dart'
    as _i86;
import 'package:loud_question/features/lobby/domain/domain.dart' as _i62;
import 'package:loud_question/features/lobby/domain/dto/game_state_response/game_state_response.dart'
    as _i36;
import 'package:loud_question/features/lobby/domain/dto/get_lobby_response/get_lobby_response.dart'
    as _i34;
import 'package:loud_question/features/lobby/domain/dto/listen_lobby_response/listen_lobby_response.dart'
    as _i20;
import 'package:loud_question/features/lobby/domain/dto/set_leader_request/set_leader_request.dart'
    as _i24;
import 'package:loud_question/features/lobby/domain/providers/game_provider.dart'
    as _i67;
import 'package:loud_question/features/lobby/domain/providers/listen_game_state_provider.dart'
    as _i71;
import 'package:loud_question/features/lobby/domain/providers/listen_lobby_provider.dart'
    as _i83;
import 'package:loud_question/features/lobby/domain/providers/lobby_provider.dart'
    as _i76;
import 'package:loud_question/features/lobby/domain/services/game_service.dart'
    as _i66;
import 'package:loud_question/features/lobby/domain/services/lobby_service.dart'
    as _i75;
import 'package:loud_question/features/lobby/infrastructure/app_providers/date_time_provider.dart'
    as _i5;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/game_provider/game_provider.dart'
    as _i63;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/listen_game_state_provider.dart'
    as _i72;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/listen_lobby_provider.dart'
    as _i84;
import 'package:loud_question/features/lobby/infrastructure/domain_providers/lobby_provider/lobby_provider.dart'
    as _i73;
import 'package:loud_question/features/lobby/infrastructure/json_converters/game_state_response_json_converter.dart'
    as _i37;
import 'package:loud_question/features/lobby/infrastructure/json_converters/get_lobby_response_json_converter.dart'
    as _i35;
import 'package:loud_question/features/lobby/infrastructure/json_converters/listen_lobby_response_json_converter.dart'
    as _i21;
import 'package:loud_question/features/lobby/infrastructure/json_converters/set_leader_request_json_converter.dart'
    as _i25;
import 'package:loud_question/main/infrastructure/coordinators/home_coordinator.dart'
    as _i10;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i78;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i80;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i33;
import 'package:loud_question/repositories/implementations/account_repository.dart'
    as _i55;
import 'package:loud_question/repositories/implementations/game_repository.dart'
    as _i65;
import 'package:loud_question/repositories/implementations/lobby_repository.dart'
    as _i74;
import 'package:loud_question/repositories/implementations/token_repository.dart'
    as _i45;
import 'package:loud_question/repositories/implementations/user_repository.dart'
    as _i51;
import 'package:loud_question/repositories/interfaces/account_repository.dart'
    as _i54;
import 'package:loud_question/repositories/interfaces/game_repository.dart'
    as _i64;
import 'package:loud_question/repositories/interfaces/interfaces.dart' as _i47;
import 'package:loud_question/repositories/interfaces/token_repository.dart'
    as _i44;
import 'package:loud_question/repositories/interfaces/user_repository.dart'
    as _i50;
import 'package:loud_question/utils/server_settings.dart' as _i42;
import 'package:problem_details/problem_details.dart' as _i32;
import 'package:shared_preferences/shared_preferences.dart' as _i43;

import '../../../env/env_module.dart' as _i91;
import '../router/router.dart' as _i92;
import '../third_party/audio_player_module.dart' as _i93;
import '../third_party/dio_module.dart' as _i94;
import '../third_party/shared_preferences_module.dart' as _i95;

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
  final audioPlayerModule = _$AudioPlayerModule();
  final dioModule = _$DioModule();
  final routerModule = _$RouterModule();
  final envModule = _$EnvModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.singleton<_i3.AudioPlayer>(audioPlayerModule.player);
  await gh.singletonAsync<_i4.DateTimeProvider>(
    () {
      final i = _i5.ProdDateTimeProvider();
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i6.Dio>(dioModule.dio);
  gh.singleton<_i7.GlobalKey<_i7.NavigatorState>>(routerModule.rootKey);
  gh.singleton<_i8.GoRouter>(
      routerModule.router(gh<_i7.GlobalKey<_i7.NavigatorState>>()));
  gh.singleton<_i9.HomeCoordinator>(
      _i10.ProdHomeCoordinator(goRouter: gh<_i8.GoRouter>()));
  gh.singleton<
          _i11.JsonConverter<_i12.VerifyTokenResponse, Map<String, Object?>>>(
      _i13.VerifyTokenResponseJsonConverter());
  gh.singleton<
          _i11.JsonConverter<_i14.CreateLobbyResponse, Map<String, Object?>>>(
      _i15.CreateLobbyResponseJsonConverter());
  gh.singleton<
          _i11.JsonConverter<_i16.GetLobbiesResponse, Map<String, Object?>>>(
      _i17.GetLobbiesResponseJsonConverter());
  gh.singleton<
          _i11.JsonConverter<_i18.JoinLobbyResponse, Map<String, Object?>>>(
      _i19.JoinLobbyResponseJsonConverter());
  gh.singleton<
          _i11.JsonConverter<_i20.ListenLobbyResponse, Map<String, Object?>>>(
      _i21.ListenLobbyResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i22.RegisterResponse, Map<String, Object?>>>(
      _i23.RegisterResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i24.SetLeaderRequest, Map<String, Object?>>>(
      _i25.SetLeaderRequestJsonConverter());
  gh.singleton<_i11.JsonConverter<_i26.LogOutResponse, Map<String, Object?>>>(
      _i27.LogOutResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i28.LogInResponse, Map<String, Object?>>>(
      _i29.LogInResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i30.GetUserResponse, Map<String, Object?>>>(
      _i31.GetUserResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i32.ProblemDetails, Map<String, Object?>>>(
      _i33.ProblemDetailsJsonConverter());
  gh.singleton<_i11.JsonConverter<_i34.GetLobbyResponse, Map<String, Object?>>>(
      _i35.GetLobbyResponseJsonConverter());
  gh.singleton<
          _i11.JsonConverter<_i36.GameStateResponse, Map<String, Object?>>>(
      _i37.GameStateResponseJsonConverter());
  gh.singleton<_i11.JsonConverter<_i38.GetSongResponse, Map<String, Object?>>>(
      _i39.GetSongResponseJsonConverter());
  await gh.singletonAsync<_i40.ServerExceptionProvider>(
    () => _i41.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i42.ServerSettings>(envModule.serverSettings);
  await gh.factoryAsync<_i43.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i44.TokenRepository>(
      _i45.ProdTokenRepository(prefs: gh<_i43.SharedPreferences>()));
  await gh.singletonAsync<_i46.TokenService>(
    () {
      final i = _i46.TokenService(
        dio: gh<_i6.Dio>(),
        tokenRepository: gh<_i47.TokenRepository>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i48.UserProvider>(_i49.ProdUserProvider(
    gh<_i6.Dio>(),
    gh<_i42.ServerSettings>(),
  ));
  gh.singleton<_i50.UserRepository>(
      _i51.ProdUserRepository(prefs: gh<_i43.SharedPreferences>()));
  gh.singleton<_i52.UserService>(_i52.UserService(
    userRepository: gh<_i47.UserRepository>(),
    userProvider: gh<_i53.UserProvider>(),
  ));
  gh.singleton<_i54.AccountRepository>(
      _i55.ProdAccountRepository(prefs: gh<_i43.SharedPreferences>()));
  gh.singleton<_i56.AuthExceptionProvider>(
      _i57.ProdAuthExceptionProvider(gh<_i56.ServerExceptionProvider>()));
  gh.singleton<_i48.AuthProvider>(_i58.ProdAuthProvider(
    gh<_i6.Dio>(),
    gh<_i42.ServerSettings>(),
  ));
  await gh.singletonAsync<_i59.AuthService>(
    () {
      final i = _i59.AuthService(
        authProvider: gh<_i60.AuthProvider>(),
        authExceptionProvider: gh<_i61.AuthExceptionProvider>(),
        accountRepository: gh<_i54.AccountRepository>(),
        tokenService: gh<_i46.TokenService>(),
        userService: gh<_i52.UserService>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i62.GameProvider>(_i63.ProdGameProvider(
    gh<_i6.Dio>(),
    gh<_i42.ServerSettings>(),
  ));
  gh.singleton<_i64.GameRepository>(
      _i65.ProdGameRepository(prefs: gh<_i43.SharedPreferences>()));
  gh.singleton<_i66.GameService>(_i66.GameService(
    gameRepository: gh<_i64.GameRepository>(),
    gameProvider: gh<_i67.GameProvider>(),
  ));
  gh.singleton<_i68.HomeProvider>(_i69.ProdHomeProvider(
    gh<_i6.Dio>(),
    gh<_i42.ServerSettings>(),
  ));
  gh.singleton<_i70.HomeService>(
      _i70.HomeService(homeProvider: gh<_i68.HomeProvider>()));
  gh.factory<_i71.ListenGameStateProvider>(() =>
      _i72.ProdListenGameStateProvider(gameProvider: gh<_i67.GameProvider>()));
  gh.singleton<_i62.LobbyProvider>(_i73.ProdLobbyProvider(
    gh<_i6.Dio>(),
    gh<_i42.ServerSettings>(),
  ));
  gh.singleton<_i47.LobbyRepository>(
      _i74.ProdLobbyRepository(prefs: gh<_i43.SharedPreferences>()));
  gh.singleton<_i75.LobbyService>(_i75.LobbyService(
    lobbyRepository: gh<_i47.LobbyRepository>(),
    lobbyProvider: gh<_i76.LobbyProvider>(),
  ));
  gh.singleton<_i77.LogInCoordinator>(
    _i78.ProdLogInCoordinator(
      goRouter: gh<_i8.GoRouter>(),
      authService: gh<_i59.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i79.RegisterCoordinator>(
    _i80.ProdRegisterCoordinator(
      goRouter: gh<_i8.GoRouter>(),
      authService: gh<_i59.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i81.HomeBloc>(() => _i81.HomeBloc(
        authService: gh<_i48.AuthService>(),
        homeService: gh<_i70.HomeService>(),
        userService: gh<_i48.UserService>(),
        coordinator: gh<_i82.HomeCoordinator>(),
        player: gh<_i3.AudioPlayer>(),
      ));
  gh.factory<_i83.ListenLobbyProvider>(() =>
      _i84.ProdListenLobbyProvider(lobbyProvider: gh<_i76.LobbyProvider>()));
  gh.factory<_i85.LobbyBloc>(() => _i85.LobbyBloc(
        lobbyService: gh<_i62.LobbyService>(),
        userService: gh<_i48.UserService>(),
        gameService: gh<_i62.GameService>(),
        accountRepository: gh<_i54.AccountRepository>(),
        dateTimeProvider: gh<_i86.DateTimeProvider>(),
        listenGameStateProvider: gh<_i62.ListenGameStateProvider>(),
        listenLobbyProvider: gh<_i62.ListenLobbyProvider>(),
        player: gh<_i3.AudioPlayer>(),
      ));
  gh.factory<_i87.LogInBloc>(() => _i87.LogInBloc(
        logInCoordinator: gh<_i88.LogInCoordinator>(),
        authService: gh<_i59.AuthService>(),
      ));
  gh.factory<_i89.RegisterBloc>(() => _i89.RegisterBloc(
        registerCoordinator: gh<_i90.RegisterCoordinator>(),
        authService: gh<_i56.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i91.EnvModule {}

class _$RouterModule extends _i92.RouterModule {}

class _$AudioPlayerModule extends _i93.AudioPlayerModule {}

class _$DioModule extends _i94.DioModule {}

class _$SharedPreferencesModule extends _i95.SharedPreferencesModule {}
