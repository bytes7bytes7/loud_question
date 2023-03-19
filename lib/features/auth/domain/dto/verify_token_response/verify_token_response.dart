import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/utils.dart';

part 'verify_token_response.g.dart';

@JsonSerializable()
class VerifyTokenResponse {
  const VerifyTokenResponse();

  factory VerifyTokenResponse.fromJson(JsonMap json) =>
      _$VerifyTokenResponseFromJson(json);

  JsonMap toJson() => _$VerifyTokenResponseToJson(this);
}
