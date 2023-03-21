import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/listen_lobby_response/listen_lobby_response.dart';

@Singleton(as: JsonConverter<ListenLobbyResponse, JsonMap>)
class ListenLobbyResponseJsonConverter
    extends JsonConverter<ListenLobbyResponse, JsonMap> {
  const ListenLobbyResponseJsonConverter();

  @override
  ListenLobbyResponse fromJson(JsonMap json) {
    return ListenLobbyResponse.fromJson(json);
  }

  @override
  JsonMap toJson(ListenLobbyResponse object) {
    return object.toJson();
  }
}
