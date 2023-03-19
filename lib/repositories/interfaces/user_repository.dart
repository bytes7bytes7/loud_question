import '../../features/common/domain/domain.dart';

abstract class UserRepository {
  Future<User?> get({
    required UserID id,
  });

  Future<void> update({
    required User user,
  });
}
