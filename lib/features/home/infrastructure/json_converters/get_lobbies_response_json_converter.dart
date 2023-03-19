import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/get_lobbies_response/get_lobbies_response.dart';

@Singleton(as: JsonConverter<GetLobbiesResponse, JsonMap>)
class GetLobbiesResponseJsonConverter
    extends JsonConverter<GetLobbiesResponse, JsonMap> {
  const GetLobbiesResponseJsonConverter();

  @override
  GetLobbiesResponse fromJson(JsonMap json) {
    return GetLobbiesResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GetLobbiesResponse object) {
    return object.toJson();
  }
}
