import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  const RegisterResponse({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory RegisterResponse.fromJson(JsonMap json) =>
      _$RegisterResponseFromJson(json);

  JsonMap toJson() => _$RegisterResponseToJson(this);
}
