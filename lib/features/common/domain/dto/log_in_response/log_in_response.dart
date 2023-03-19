import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/typedef.dart';
import '../../../../common/domain/domain.dart';

part 'log_in_response.g.dart';

@JsonSerializable()
class LogInResponse {
  const LogInResponse({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory LogInResponse.fromJson(JsonMap json) => _$LogInResponseFromJson(json);

  JsonMap toJson() => _$LogInResponseToJson(this);
}
