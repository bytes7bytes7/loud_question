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
    as _i22;
import 'package:loud_question/features/auth/application/blocs/log_in/log_in_bloc.dart'
    as _i25;
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i27;
import 'package:loud_question/features/auth/application/coordinators/log_in_coordinator.dart'
    as _i26;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i28;
import 'package:loud_question/features/auth/auth.dart' as _i21;
import 'package:loud_question/features/auth/domain/domain.dart' as _i16;
import 'package:loud_question/features/auth/domain/dto/log_in_response/log_in_response.dart'
    as _i11;
import 'package:loud_question/features/auth/domain/dto/register_response/register_response.dart'
    as _i7;
import 'package:loud_question/features/auth/domain/services/auth_service.dart'
    as _i20;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i17;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i19;
import 'package:loud_question/features/auth/infrastructure/json_converters/log_in_response_json_coverter.dart'
    as _i12;
import 'package:loud_question/features/auth/infrastructure/json_converters/register_response_json_converter.dart'
    as _i8;
import 'package:loud_question/features/common/common.dart' as _i18;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i13;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i14;
import 'package:loud_question/main/infrastructure/coordinators/log_in_coordinator.dart'
    as _i23;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i24;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i10;
import 'package:loud_question/utils/server_settings.dart' as _i15;
import 'package:problem_details/problem_details.dart' as _i9;

import '../../../env/env_module.dart' as _i29;
import '../router/router.dart' as _i30;
import '../third_party/dio_module.dart' as _i31;

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
  gh.singleton<_i3.Dio>(dioModule.dio);
  gh.singleton<_i4.GlobalKey<_i4.NavigatorState>>(routerModule.rootKey);
  gh.singleton<_i5.GoRouter>(
      routerModule.router(gh<_i4.GlobalKey<_i4.NavigatorState>>()));
  gh.singleton<_i6.JsonConverter<_i7.RegisterResponse, Map<String, Object?>>>(
      _i8.RegisterResponseJsonConverter());
  gh.singleton<_i6.JsonConverter<_i9.ProblemDetails, Map<String, Object?>>>(
      _i10.ProblemDetailsJsonConverter());
  gh.singleton<_i6.JsonConverter<_i11.LogInResponse, Map<String, Object?>>>(
      _i12.LogInResponseJsonConverter());
  await gh.singletonAsync<_i13.ServerExceptionProvider>(
    () => _i14.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i15.ServerSettings>(envModule.serverSettings);
  gh.singleton<_i16.AuthExceptionProvider>(
      _i17.ProdAuthExceptionProvider(gh<_i18.ServerExceptionProvider>()));
  gh.singleton<_i16.AuthProvider>(_i19.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i15.ServerSettings>(),
  ));
  gh.singleton<_i20.AuthService>(
    _i20.AuthService(
      authProvider: gh<_i21.AuthProvider>(),
      authExceptionProvider: gh<_i21.AuthExceptionProvider>(),
    ),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i22.LogInCoordinator>(
    _i23.ProdLogInCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i16.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i21.RegisterCoordinator>(
    _i24.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i21.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i25.LogInBloc>(() => _i25.LogInBloc(
        logInCoordinator: gh<_i26.LogInCoordinator>(),
        authService: gh<_i16.AuthService>(),
      ));
  gh.factory<_i27.RegisterBloc>(() => _i27.RegisterBloc(
        registerCoordinator: gh<_i28.RegisterCoordinator>(),
        authService: gh<_i16.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i29.EnvModule {}

class _$RouterModule extends _i30.RouterModule {}

class _$DioModule extends _i31.DioModule {}
