import '../../features/common/domain/domain.dart';

abstract class AccountRepository {
  Future<UserID?> getMyID();

  Future<void> saveMyID({required UserID id});

  Future<void> removeMyID();
}
