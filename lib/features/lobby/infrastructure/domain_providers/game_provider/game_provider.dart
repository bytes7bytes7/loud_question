import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../utils/json_either_wrapper.dart';
import '../../../../../utils/server_settings.dart';
import '../../../domain/domain.dart';

part 'game_provider.g.dart';

const _route = '/game/';

@Singleton(as: GameProvider)
@RestApi()
abstract class ProdGameProvider implements GameProvider {
  @factoryMethod
  factory ProdGameProvider(Dio dio, ServerSettings settings) {
    return ProdGameProvider._(
      dio,
      baseUrl: '${settings.baseUri}$_route',
    );
  }

  factory ProdGameProvider._(
    Dio dio, {
    String baseUrl,
  }) = _ProdGameProvider;

  @override
  @GET('/{id}/state')
  Future<JsonEitherWrapper<ProblemDetails, GetGameStateResponse>> getState(
    String id,
  );
}
