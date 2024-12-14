import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> signinWithGoogle();
  Future<Either<Failure, UserEntity>> signinWithFacebook();
  Future<void> deleteUser(User? user);
}
