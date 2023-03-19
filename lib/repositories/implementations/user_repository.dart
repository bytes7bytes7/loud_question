import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/common/domain/domain.dart';
import '../interfaces/user_repository.dart';

const _userKeyPrefix = 'user ';

@Singleton(as: UserRepository)
class ProdUserRepository implements UserRepository {
  ProdUserRepository({
    required SharedPreferences prefs,
  }) : _prefs = prefs;

  final SharedPreferences _prefs;
  final _jsonEncoder = const JsonEncoder();
  final _jsonDecoder = const JsonDecoder();

  @override
  Future<User?> get({
    required UserID id,
  }) async {
    final key = _getKey(id);
    final jsonData = _prefs.getString(key);

    if (jsonData == null) {
      return null;
    }

    final map = _jsonDecoder.convert(jsonData);
    return User.fromJson(map);
  }

  @override
  Future<void> update({
    required User user,
  }) async {
    final key = _getKey(user.id);

    await _prefs.setString(key, _jsonEncoder.convert(user));
  }

  String _getKey(UserID id) => '$_userKeyPrefix$id';
}
