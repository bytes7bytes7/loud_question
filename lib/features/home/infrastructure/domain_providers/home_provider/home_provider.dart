import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../utils/json_either_wrapper.dart';
import '../../../../../utils/server_settings.dart';
import '../../../domain/dto/dto.dart';
import '../../../domain/providers/home_provider.dart';

part 'home_provider.g.dart';

const _route = '/lobby/';

@Singleton(as: HomeProvider)
@RestApi()
abstract class ProdHomeProvider implements HomeProvider {
  @factoryMethod
  factory ProdHomeProvider(Dio dio, ServerSettings settings) {
    return ProdHomeProvider._(
      dio,
      baseUrl: '${settings.baseUri}$_route',
    );
  }

  factory ProdHomeProvider._(
    Dio dio, {
    String baseUrl,
  }) = _ProdHomeProvider;

  @override
  @GET('/all')
  Future<JsonEitherWrapper<ProblemDetails, GetLobbiesResponse>> getLobbies();
}
