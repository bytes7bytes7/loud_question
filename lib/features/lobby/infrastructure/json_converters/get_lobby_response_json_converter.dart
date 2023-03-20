import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/utils.dart';
import '../../domain/dto/get_lobby_response/get_lobby_response.dart';

@Singleton(as: JsonConverter<GetLobbyResponse, JsonMap>)
class GetLobbyResponseJsonConverter
    extends JsonConverter<GetLobbyResponse, JsonMap> {
  const GetLobbyResponseJsonConverter();

  @override
  GetLobbyResponse fromJson(JsonMap json) {
    return GetLobbyResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GetLobbyResponse object) {
    return object.toJson();
  }
}
