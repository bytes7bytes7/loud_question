import 'package:injectable/injectable.dart';

import '../../../common/common.dart';
import '../../domain/domain.dart';

@Singleton(as: AuthExceptionProvider)
class ProdAuthExceptionProvider implements AuthExceptionProvider {
  const ProdAuthExceptionProvider(this._serverExceptionProvider);

  final ServerExceptionProvider _serverExceptionProvider;

  @override
  String get nameIsAlreadyInUse => _serverExceptionProvider.nameIsAlreadyInUse;
}
