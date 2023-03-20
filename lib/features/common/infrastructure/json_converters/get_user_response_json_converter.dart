import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/get_user_response/get_user_response.dart';

@Singleton(as: JsonConverter<GetUserResponse, JsonMap>)
class GetUserResponseJsonConverter
    extends JsonConverter<GetUserResponse, JsonMap> {
  const GetUserResponseJsonConverter();

  @override
  GetUserResponse fromJson(JsonMap json) {
    return GetUserResponse.fromJson(json);
  }

  @override
  JsonMap toJson(GetUserResponse object) {
    return object.toJson();
  }
}
