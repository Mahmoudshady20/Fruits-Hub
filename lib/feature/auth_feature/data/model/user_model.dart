import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.uid,
  });
  factory UserModel.fromFireBase(User user) {
    return UserModel(
        name: user.displayName!, email: user.email!, uid: user.uid);
  }
}
