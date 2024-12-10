import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';

abstract class DataBaseRepo {
  Future<void> addUser({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<void> updateUser({
    required Map<String, dynamic> data,
    required String id,
  });
  Future<void> deleteUser({
    required String id,
  });
  Future<UserEntity?> getUserData({
    required String id,
  });
}
