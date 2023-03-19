import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../utils/json_either_wrapper.dart';
import '../../../../../utils/server_settings.dart';
import '../../../domain/domain.dart';

part 'user_provider.g.dart';

const _route = '/user/';

@Singleton(as: UserProvider)
@RestApi()
abstract class ProdUserProvider implements UserProvider {
  @factoryMethod
  factory ProdUserProvider(Dio dio, ServerSettings settings) {
    return ProdUserProvider._(
      dio,
      baseUrl: '${settings.baseUri}$_route',
    );
  }

  factory ProdUserProvider._(
    Dio dio, {
    String baseUrl,
  }) = _ProdUserProvider;

  @override
  @GET('/{id}')
  Future<JsonEitherWrapper<ProblemDetails, GetUserResponse>> getUser(
    @Path() String id,
  );
}
