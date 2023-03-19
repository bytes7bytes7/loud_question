import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';

part 'log_in_request.g.dart';

@JsonSerializable()
class LogInRequest {
  const LogInRequest({
    required this.name,
    required this.password,
  });

  final String name;
  final String password;

  factory LogInRequest.fromJson(JsonMap json) => _$LogInRequestFromJson(json);

  JsonMap toJson() => _$LogInRequestToJson(this);
}
