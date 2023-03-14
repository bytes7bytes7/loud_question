import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  const RegisterRequest({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory RegisterRequest.fromJson(JsonMap json) =>
      _$RegisterRequestFromJson(json);

  JsonMap toJson() => _$RegisterRequestToJson(this);
}
