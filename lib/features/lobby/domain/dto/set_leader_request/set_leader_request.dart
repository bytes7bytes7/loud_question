import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'set_leader_request.g.dart';

@JsonSerializable()
class SetLeaderRequest {
  const SetLeaderRequest({
    required this.userID,
  });

  final UserID userID;

  factory SetLeaderRequest.fromJson(JsonMap json) =>
      _$SetLeaderRequestFromJson(json);

  JsonMap toJson() => _$SetLeaderRequestToJson(this);
}
