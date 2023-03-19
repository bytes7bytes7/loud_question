import 'package:injectable/injectable.dart';

import '../../common.dart';

@Singleton(as: AuthExceptionProvider)
class ProdAuthExceptionProvider implements AuthExceptionProvider {
  const ProdAuthExceptionProvider(this._serverExceptionProvider);

  final ServerExceptionProvider _serverExceptionProvider;

  @override
  String get nameIsAlreadyInUse => _serverExceptionProvider.nameIsAlreadyInUse;

  @override
  String get invalidCredentials => _serverExceptionProvider.invalidCredentials;
}
