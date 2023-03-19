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
    as _i46;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i52;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i54;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i53;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i55;
import 'package:loud_question/features/auth/auth.dart' as _i48;
import 'package:loud_question/features/common/common.dart' as _i37;
import 'package:loud_question/features/common/domain/domain.dart' as _i29;
import 'package:loud_question/features/common/domain/dto/log_in_response/log_in_response.dart'
    as _i17;
import 'package:loud_question/features/common/domain/dto/log_out_response/log_out_response.dart'
    as _i11;
import 'package:loud_question/features/common/domain/dto/register_response/register_response.dart'
    as _i15;
import 'package:loud_question/features/common/domain/dto/verify_token_response/verify_token_response.dart'
    as _i13;
import 'package:loud_question/features/common/domain/providers/auth_exception_provider.dart'
    as _i42;
import 'package:loud_question/features/common/domain/providers/auth_provider.dart'
    as _i41;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i21;
import 'package:loud_question/features/common/domain/providers/user_provider.dart'
    as _i34;
import 'package:loud_question/features/common/domain/services/auth_service.dart'
    as _i40;
import 'package:loud_question/features/common/domain/services/token_service.dart'
    as _i27;
import 'package:loud_question/features/common/domain/services/user_service.dart'
    as _i33;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i38;
import 'package:loud_question/features/common/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i39;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i22;
import 'package:loud_question/features/common/infrastructure/domain_providers/user_provider/user_provider.dart'
    as _i30;
import 'package:loud_question/features/common/infrastructure/json_converters/log_in_response_json_coverter.dart'
    as _i18;
import 'package:loud_question/features/common/infrastructure/json_converters/log_out_response_json_converter.dart'
    as _i12;
import 'package:loud_question/features/common/infrastructure/json_converters/register_response_json_converter.dart'
    as _i16;
import 'package:loud_question/features/common/infrastructure/json_converters/verify_token_response_json_converter.dart'
    as _i14;
import 'package:loud_question/features/home/application/application.dart'
    as _i6;
import 'package:loud_question/features/home/application/blocs/home/home_bloc.dart'
    as _i50;
import 'package:loud_question/features/home/application/coordinators/home_coordinator.dart'
    as _i51;
import 'package:loud_question/features/home/domain/dto/get_lobbies_response/get_lobbies_response.dart'
    as _i9;
import 'package:loud_question/features/home/domain/providers/home_provider.dart'
    as _i43;
import 'package:loud_question/features/home/domain/services/home_service.dart'
    as _i45;
import 'package:loud_question/features/home/infrastructure/domain_providers/home_provider/home_provider.dart'
    as _i44;
import 'package:loud_question/features/home/infrastructure/json_converters/get_lobbies_response_json_converter.dart'
    as _i10;
import 'package:loud_question/main/infrastructure/coordinators/home_coordinator.dart'
    as _i7;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i47;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i49;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i20;
import 'package:loud_question/repositories/implementations/account_repository.dart'
    as _i36;
import 'package:loud_question/repositories/implementations/token_repository.dart'
    as _i26;
import 'package:loud_question/repositories/implementations/user_repository.dart'
    as _i32;
import 'package:loud_question/repositories/interfaces/account_repository.dart'
    as _i35;
import 'package:loud_question/repositories/interfaces/interfaces.dart' as _i28;
import 'package:loud_question/repositories/interfaces/token_repository.dart'
    as _i25;
import 'package:loud_question/repositories/interfaces/user_repository.dart'
    as _i31;
import 'package:loud_question/utils/server_settings.dart' as _i23;
import 'package:problem_details/problem_details.dart' as _i19;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

import '../../../env/env_module.dart' as _i56;
import '../router/router.dart' as _i57;
import '../third_party/dio_module.dart' as _i58;
import '../third_party/shared_preferences_module.dart' as _i59;

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
  gh.singleton<_i8.JsonConverter<_i9.GetLobbiesResponse, Map<String, Object?>>>(
      _i10.GetLobbiesResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i11.LogOutResponse, Map<String, Object?>>>(
      _i12.LogOutResponseJsonConverter());
  gh.singleton<
          _i8.JsonConverter<_i13.VerifyTokenResponse, Map<String, Object?>>>(
      _i14.VerifyTokenResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i15.RegisterResponse, Map<String, Object?>>>(
      _i16.RegisterResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i17.LogInResponse, Map<String, Object?>>>(
      _i18.LogInResponseJsonConverter());
  gh.singleton<_i8.JsonConverter<_i19.ProblemDetails, Map<String, Object?>>>(
      _i20.ProblemDetailsJsonConverter());
  await gh.singletonAsync<_i21.ServerExceptionProvider>(
    () => _i22.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i23.ServerSettings>(envModule.serverSettings);
  await gh.factoryAsync<_i24.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i25.TokenRepository>(
      _i26.ProdTokenRepository(prefs: gh<_i24.SharedPreferences>()));
  await gh.singletonAsync<_i27.TokenService>(
    () {
      final i = _i27.TokenService(
        dio: gh<_i3.Dio>(),
        tokenRepository: gh<_i28.TokenRepository>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i29.UserProvider>(_i30.ProdUserProvider(
    gh<_i3.Dio>(),
    gh<_i23.ServerSettings>(),
  ));
  gh.singleton<_i31.UserRepository>(
      _i32.ProdUserRepository(prefs: gh<_i24.SharedPreferences>()));
  gh.singleton<_i33.UserService>(_i33.UserService(
    userRepository: gh<_i28.UserRepository>(),
    userProvider: gh<_i34.UserProvider>(),
  ));
  gh.singleton<_i35.AccountRepository>(
      _i36.ProdAccountRepository(prefs: gh<_i24.SharedPreferences>()));
  gh.singleton<_i37.AuthExceptionProvider>(
      _i38.ProdAuthExceptionProvider(gh<_i37.ServerExceptionProvider>()));
  gh.singleton<_i29.AuthProvider>(_i39.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i23.ServerSettings>(),
  ));
  await gh.singletonAsync<_i40.AuthService>(
    () {
      final i = _i40.AuthService(
        authProvider: gh<_i41.AuthProvider>(),
        authExceptionProvider: gh<_i42.AuthExceptionProvider>(),
        accountRepository: gh<_i35.AccountRepository>(),
        tokenService: gh<_i27.TokenService>(),
        userService: gh<_i33.UserService>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i43.HomeProvider>(_i44.ProdHomeProvider(
    gh<_i3.Dio>(),
    gh<_i23.ServerSettings>(),
  ));
  gh.singleton<_i45.HomeService>(
      _i45.HomeService(homeProvider: gh<_i43.HomeProvider>()));
  gh.singleton<_i46.LogInCoordinator>(
    _i47.ProdLogInCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i40.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i48.RegisterCoordinator>(
    _i49.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i40.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i50.HomeBloc>(() => _i50.HomeBloc(
        authService: gh<_i37.AuthService>(),
        homeService: gh<_i45.HomeService>(),
        coordinator: gh<_i51.HomeCoordinator>(),
      ));
  gh.factory<_i52.LogInBloc>(() => _i52.LogInBloc(
        logInCoordinator: gh<_i53.LogInCoordinator>(),
        authService: gh<_i40.AuthService>(),
      ));
  gh.factory<_i54.RegisterBloc>(() => _i54.RegisterBloc(
        registerCoordinator: gh<_i55.RegisterCoordinator>(),
        authService: gh<_i37.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i56.EnvModule {}

class _$RouterModule extends _i57.RouterModule {}

class _$DioModule extends _i58.DioModule {}

class _$SharedPreferencesModule extends _i59.SharedPreferencesModule {}
