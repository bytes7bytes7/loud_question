import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/common/domain/domain.dart';
import '../interfaces/account_repository.dart';

const _userIDKey = 'myUserID';

@Singleton(as: AccountRepository)
class ProdAccountRepository implements AccountRepository {
  ProdAccountRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<UserID?> getMyID() async {
    final string = _prefs.getString(_userIDKey);

    if (string == null) {
      return null;
    }

    return UserID.fromString(string);
  }

  @override
  Future<void> saveMyID({required UserID id}) async {
    await _prefs.setString(_userIDKey, id.str);
  }

  @override
  Future<void> removeMyID() async {
    await _prefs.remove(_userIDKey);
  }
}
