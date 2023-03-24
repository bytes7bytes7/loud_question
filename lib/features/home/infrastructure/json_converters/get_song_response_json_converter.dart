import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/get_song_response/get_song_response.dart';

@Singleton(as: JsonConverter<GetSongResponse, JsonMap>)
class GetSongResponseJsonConverter
    extends JsonConverter<GetSongResponse, JsonMap> {
  const GetSongResponseJsonConverter();

  @override
  GetSongResponse fromJson(JsonMap json) {
    return GetSongResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GetSongResponse object) {
    return object.toJson();
  }
}
