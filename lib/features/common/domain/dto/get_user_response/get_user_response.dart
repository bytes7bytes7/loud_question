import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/utils.dart';
import '../../entities/user/user.dart';

part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  const GetUserResponse({
    required this.user,
  });

  final User user;

  factory GetUserResponse.fromJson(JsonMap json) =>
      _$GetUserResponseFromJson(json);

  JsonMap toJson() => _$GetUserResponseToJson(this);
}
