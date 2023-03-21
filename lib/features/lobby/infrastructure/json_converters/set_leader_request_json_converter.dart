import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../utils/typedef.dart';
import '../../domain/dto/set_leader_request/set_leader_request.dart';

@Singleton(as: JsonConverter<SetLeaderRequest, JsonMap>)
class SetLeaderRequestJsonConverter
    extends JsonConverter<SetLeaderRequest, JsonMap> {
  const SetLeaderRequestJsonConverter();

  @override
  SetLeaderRequest fromJson(JsonMap json) {
    return SetLeaderRequest.fromJson(json);
  }

  @override
  JsonMap toJson(SetLeaderRequest object) {
    return object.toJson();
  }
}
