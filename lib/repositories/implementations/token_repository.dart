import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/token_repository.dart';

const _tokenKey = 'token';

@Singleton(as: TokenRepository)
class ProdTokenRepository implements TokenRepository {
  const ProdTokenRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<String?> getToken() async {
    return _prefs.getString(_tokenKey);
  }

  @override
  Future<void> saveToken({required String token}) async {
    await _prefs.setString(_tokenKey, token);
  }

  @override
  Future<void> removeToken() async {
    await _prefs.remove(_tokenKey);
  }
}
