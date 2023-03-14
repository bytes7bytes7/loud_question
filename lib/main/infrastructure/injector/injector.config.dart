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
    as _i17;
import 'package:loud_question/features/auth/application/coordinators/register_coordinator.dart'
    as _i18;
import 'package:loud_question/features/auth/auth.dart' as _i15;
import 'package:loud_question/features/auth/domain/domain.dart' as _i12;
import 'package:loud_question/features/auth/domain/dto/register_response/register_response.dart'
    as _i9;
import 'package:loud_question/features/auth/domain/services/auth_service.dart'
    as _i14;
import 'package:loud_question/features/auth/infrastructure/domain_providers/auth_provider/auth_provider.dart'
    as _i13;
import 'package:loud_question/features/auth/infrastructure/json_converters/register_response_json_converter.dart'
    as _i10;
import 'package:loud_question/main/infrastructure/coordinators/register_coordinator.dart'
    as _i16;
import 'package:loud_question/main/infrastructure/json_converters/problem_detials_json_converter.dart'
    as _i8;
import 'package:loud_question/utils/server_settings.dart' as _i11;
import 'package:problem_details/problem_details.dart' as _i7;

import '../../../env/env_module.dart' as _i19;
import '../router/router.dart' as _i20;
import '../third_party/dio_module.dart' as _i21;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
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
  gh.singleton<_i6.JsonConverter<_i7.ProblemDetails, Map<String, Object?>>>(
      _i8.ProblemDetailsJsonConverter());
  gh.singleton<_i6.JsonConverter<_i9.RegisterResponse, Map<String, Object?>>>(
      _i10.RegisterResponseJsonConverter());
  gh.singleton<_i11.ServerSettings>(envModule.serverSettings);
  gh.singleton<_i12.AuthProvider>(_i13.ProdAuthProvider(
    gh<_i3.Dio>(),
    gh<_i11.ServerSettings>(),
  ));
  gh.singleton<_i14.AuthService>(
    _i14.AuthService(authProvider: gh<_i15.AuthProvider>()),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i15.RegisterCoordinator>(
    _i16.ProdRegisterCoordinator(
      goRouter: gh<_i5.GoRouter>(),
      authService: gh<_i15.AuthService>(),
    )..init(),
    dispose: (i) => i.dispose(),
  );
  gh.factory<_i17.RegisterBloc>(() => _i17.RegisterBloc(
        registerCoordinator: gh<_i18.RegisterCoordinator>(),
        authService: gh<_i12.AuthService>(),
      ));
  return getIt;
}

class _$EnvModule extends _i19.EnvModule {}

class _$RouterModule extends _i20.RouterModule {}

class _$DioModule extends _i21.DioModule {}
