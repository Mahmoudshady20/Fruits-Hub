import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';

abstract class DataBaseRepo {
  Future<void> addUser({
    required UserModel userModel,
    required String id,
  });
  Future<void> updateUser({
    required UserModel userModel,
    required String id,
  });
  Future<void> deleteUser({
    required String id,
  });
  Future<UserEntity?> getUserData({
    required String id,
  });
  Future<bool> isUserExist({required String id});
}
