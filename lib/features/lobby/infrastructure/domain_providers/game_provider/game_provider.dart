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
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getState(
    @Path() String id,
  );

  @override
  @POST('{id}/ready')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setReady(
    @Path() String id,
  );

  @override
  @POST('/{id}/not_ready')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> setNotReady(
    @Path() String id,
  );

  @override
  @POST('/{id}/start')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startGame(
    @Path() String id,
  );

  @override
  @POST('/{id}/start_answer')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> startAnswer(
    @Path() String id,
  );

  @override
  @POST('/{id}/give_answer')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> giveAnswer(
    @Path() String id,
    @Body() GiveAnswerRequest request,
  );

  @override
  @GET('/{id}/get_answer')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> getAnswer(
    @Path() String id,
  );

  @override
  @POST('/{id}/restart')
  Future<JsonEitherWrapper<ProblemDetails, GameStateResponse>> restart(
    @Path() String id,
  );
}
