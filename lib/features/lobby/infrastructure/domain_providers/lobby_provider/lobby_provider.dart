import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:problem_details/problem_details.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../utils/json_either_wrapper.dart';
import '../../../../../utils/server_settings.dart';
import '../../../domain/domain.dart';

part 'lobby_provider.g.dart';

const _route = '/lobby/';

@Singleton(as: LobbyProvider)
@RestApi()
abstract class ProdLobbyProvider implements LobbyProvider {
  @factoryMethod
  factory ProdLobbyProvider(Dio dio, ServerSettings settings) {
    return ProdLobbyProvider._(
      dio,
      baseUrl: '${settings.baseUri}$_route',
    );
  }

  factory ProdLobbyProvider._(
    Dio dio, {
    String baseUrl,
  }) = _ProdLobbyProvider;

  @override
  @GET('/{id}')
  Future<JsonEitherWrapper<ProblemDetails, GetLobbyResponse>> getLobby(
    @Path() String id,
  );
}
