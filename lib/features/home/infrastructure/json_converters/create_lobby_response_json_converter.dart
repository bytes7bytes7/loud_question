import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/create_lobby_response/create_lobby_response.dart';

@Singleton(as: JsonConverter<CreateLobbyResponse, JsonMap>)
class CreateLobbyResponseJsonConverter
    extends JsonConverter<CreateLobbyResponse, JsonMap> {
  const CreateLobbyResponseJsonConverter();

  @override
  CreateLobbyResponse fromJson(JsonMap json) {
    return CreateLobbyResponse.fromJson(json);
  }

  @override
  JsonMap toJson(CreateLobbyResponse object) {
    return object.toJson();
  }
}
