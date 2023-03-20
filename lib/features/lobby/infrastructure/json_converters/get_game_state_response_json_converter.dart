import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/get_game_state_response/get_game_state_response.dart';

@Singleton(as: JsonConverter<GetGameStateResponse, JsonMap>)
class GetGameStateResponseJsonConverter
    extends JsonConverter<GetGameStateResponse, JsonMap> {
  const GetGameStateResponseJsonConverter();

  @override
  GetGameStateResponse fromJson(JsonMap json) {
    return GetGameStateResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GetGameStateResponse object) {
    return object.toJson();
  }
}
