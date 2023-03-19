// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:freezed_annotation/freezed_annotation.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:go_router/go_router.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:loud_question/features/auth/application/application.dart'
    as _i37;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i40;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i42;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i41;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i43;
import 'package:loud_question/features/auth/auth.dart' as _i36;
import 'package:loud_question/features/auth/domain/domain.dart' as _i31;
import 'package:loud_question/features/auth/domain/dto/log_in_response/log_in_response.dart'
    as _i7;
import 'package:loud_question/features/auth/domain/dto/register_response/register_response.dart'
    as _i9;
import 'package:loud_question/features/auth/domain/dto/verify_token_response/verify_token_response.dart'
    as _i13;
import 'package:loud_question/features/auth/domain/services/auth_service.dart'
    as _i35;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i32;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i34;
import 'package:loud_question/features/auth/infrastructure/json_converters/log_in_response_json_coverter.dart'
    as _i8;
import 'package:loud_question/features/auth/infrastructure/json_converters/register_response_json_converter.dart'
    as _i10;
import 'package:loud_question/features/auth/infrastructure/json_converters/verify_token_response_json_converter.dart'
    as _i14;
import 'package:loud_question/features/common/common.dart' as _i33;
import 'package:loud_question/features/common/domain/domain.dart' as _i23;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i15;
import 'package:loud_question/features/common/domain/providers/user_provider.dart'
    as _i28;
import 'package:loud_question/features/common/domain/services/token_service.dart'
    as _i21;
import 'package:loud_question/features/common/domain/services/user_service.dart'
    as _i27;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i16;
import 'package:loud_question/features/common/infrastructure/domain_providers/user_provider/user_provider.dart'
    as _i24;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i38;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i39;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i12;
import 'package:loud_question/repositories/implementations/account_repository.dart'
    as _i30;
import 'package:loud_question/repositories/implementations/token_repository.dart'
    as _i20;
import 'package:loud_question/repositories/implementations/user_repository.dart'
    as _i26;
import 'package:loud_question/repositories/interfaces/account_repository.dart'
    as _i29;
import 'package:loud_question/repositories/interfaces/interfaces.dart' as _i22;
import 'package:loud_question/repositories/interfaces/token_repository.dart'
    as _i19;
import 'package:loud_question/repositories/interfaces/user_repository.dart'
    as _i25;
import 'package:loud_question/utils/server_settings.dart' as _i17;
import 'package:problem_details/problem_details.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../../env/env_module.dart' as _i44;
import '../router/router.dart' as _i45;
import '../third_party/dio_module.dart' as _i46;
import '../third_party/shared_preferences_module.dart' as _i47;

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
  gh.singleton<_i6.JsonConverter<_i7.LogInResponse, Map<String, Object?>>>(
      _i8.LogInResponseJsonConverter());
  gh.singleton<_i6.JsonConverter<_i9.RegisterResponse, Map<String, Object?>>>(
      _i10.RegisterResponseJsonConverter());
  gh.singleton<_i6.JsonConverter<_i11.ProblemDetails, Map<String, Object?>>>(
      _i12.ProblemDetailsJsonConverter());
  gh.singleton<
          _i6.JsonConverter<_i13.VerifyTokenResponse, Map<String, Object?>>>(
      _i14.VerifyTokenResponseJsonConverter());
  await gh.singletonAsync<_i15.ServerExceptionProvider>(
    () => _i16.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i17.ServerSettings>(envModule.serverSettings);
  await gh.factoryAsync<_i18.SharedPreferences>(
    () => sharedPreferencesModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i19.TokenRepository>(
      _i20.ProdTokenRepository(prefs: gh<_i18.SharedPreferences>()));
  await gh.singletonAsync<_i21.TokenService>(
    () {
      final i = _i21.TokenService(
        dio: gh<_i3.Dio>(),
        tokenRepository: gh<_i22.TokenRepository>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
  );
  gh.singleton<_i23.UserProvider>(_i24.ProdUserProvider(
    gh<_i3.Dio>(),
    gh<_i17.ServerSettings>(),
  ));
  gh.singleton<_i25.UserRepository>(
      _i26.ProdUserRepository(prefs: gh<_i18.SharedPreferences>()));
  gh.singleton<_i27.UserService>(_i27.UserService(
    userRepository: gh<_i22.UserRepository>(),
    userProvider: gh<_i28.UserProvider>(),
  ));
  gh.singleton<_i29.AccountRepository>(
      _i30.ProdAccountRepository(prefs: gh<_i18.SharedPreferences>()));
  gh.singleton<_i31.AuthExceptionProvider>(
      _i32.ProdAuthExceptionProvider(gh<_i33.ServerExceptionProvider>()));
  gh.singleton<_i31.AuthProvider>(_i34.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i17.ServerSettings>(),
  ));
  await gh.singletonAsync<_i35.AuthService>(
    () {
      final i = _i35.AuthService(
        authProvider: gh<_i36.AuthProvider>(),
        authExceptionProvider: gh<_i36.AuthExceptionProvider>(),
        accountRepository: gh<_i29.AccountRepository>(),
        tokenService: gh<_i23.TokenService>(),
        userService: gh<_i23.UserService>(),
      );
      return i.init().then((_) => i);
    },
    preResolve: true,
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i37.LogInCoordinator>(
    _i38.ProdLogInCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i31.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i36.RegisterCoordinator>(
    _i39.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i36.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i40.LogInBloc>(() => _i40.LogInBloc(
        logInCoordinator: gh<_i41.LogInCoordinator>(),
        authService: gh<_i31.AuthService>(),
      ));
  gh.factory<_i42.RegisterBloc>(() => _i42.RegisterBloc(
        registerCoordinator: gh<_i43.RegisterCoordinator>(),
        authService: gh<_i31.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i44.EnvModule {}

class _$RouterModule extends _i45.RouterModule {}

class _$DioModule extends _i46.DioModule {}

class _$SharedPreferencesModule extends _i47.SharedPreferencesModule {}
