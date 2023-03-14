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
import 'package:loud_question/features/auth/application/blocs/register/register_bloc.dart'
    as _i21;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i22;
import 'package:loud_question/features/auth/auth.dart' as _i19;
import 'package:loud_question/features/auth/domain/domain.dart' as _i14;
import 'package:loud_question/features/auth/domain/dto/register_response/register_response.dart'
    as _i7;
import 'package:loud_question/features/auth/domain/services/auth_service.dart'
    as _i18;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_exception_provider.dart'
    as _i15;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i17;
import 'package:loud_question/features/auth/infrastructure/json_converters/register_response_json_converter.dart'
    as _i8;
import 'package:loud_question/features/common/common.dart' as _i16;
import 'package:loud_question/features/common/domain/providers/server_exception_provider.dart'
    as _i11;
import 'package:loud_question/features/common/infrastructure/domain_providers/server_exception_provider/server_exception_provider.dart'
    as _i12;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i20;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i10;
import 'package:loud_question/utils/server_settings.dart' as _i13;
import 'package:problem_details/problem_details.dart' as _i9;

import '../../../env/env_module.dart' as _i23;
import '../router/router.dart' as _i24;
import '../third_party/dio_module.dart' as _i25;

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
  await gh.singletonAsync<_i11.ServerExceptionProvider>(
    () => _i12.ProdServerExceptionProvider.create(),
    preResolve: true,
  );
  gh.singleton<_i13.ServerSettings>(envModule.serverSettings);
  gh.singleton<_i14.AuthExceptionProvider>(
      _i15.ProdAuthExceptionProvider(gh<_i16.ServerExceptionProvider>()));
  gh.singleton<_i14.AuthProvider>(_i17.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i13.ServerSettings>(),
  ));
  gh.singleton<_i18.AuthService>(
    _i18.AuthService(
      authProvider: gh<_i19.AuthProvider>(),
      authExceptionProvider: gh<_i19.AuthExceptionProvider>(),
    ),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i19.RegisterCoordinator>(
    _i20.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i19.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i21.RegisterBloc>(() => _i21.RegisterBloc(
        registerCoordinator: gh<_i22.RegisterCoordinator>(),
        authService: gh<_i14.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i23.EnvModule {}

class _$RouterModule extends _i24.RouterModule {}

class _$DioModule extends _i25.DioModule {}
