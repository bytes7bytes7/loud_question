import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../utils/typedef.dart';
import '../../../domain/providers/server_exception_provider.dart';

part 'server_exception_provider.g.dart';

@Singleton(as: ServerExceptionProvider)
@JsonSerializable(fieldRename: FieldRename.snake)
class ProdServerExceptionProvider implements ServerExceptionProvider {
  const ProdServerExceptionProvider({
    required this.nameIsAlreadyInUse,
    required this.invalidCredentials,
  });

  @override
  final String nameIsAlreadyInUse;

  @override
  final String invalidCredentials;

  @FactoryMethod(preResolve: true)
  static Future<ProdServerExceptionProvider> create() async {
    return ProdServerExceptionProvider.fromJson({
      'name_is_already_in_use': 'Name is already in use.',
      'invalid_credentials': 'Invalid credentials.',
    });
  }

  factory ProdServerExceptionProvider.fromJson(JsonMap json) =>
      _$ProdServerExceptionProviderFromJson(json);

  JsonMap toJson() => _$ProdServerExceptionProviderToJson(this);
}
