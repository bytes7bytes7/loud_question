import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/join_lobby_response/join_lobby_response.dart';

@Singleton(as: JsonConverter<JoinLobbyResponse, JsonMap>)
class JoinLobbyResponseJsonConverter
    extends JsonConverter<JoinLobbyResponse, JsonMap> {
  const JoinLobbyResponseJsonConverter();

  @override
  JoinLobbyResponse fromJson(JsonMap json) {
    return JoinLobbyResponse.fromJson(json);
  }

  @override
  JsonMap toJson(JoinLobbyResponse object) {
    return object.toJson();
  }
}
