import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      String email, String password);
}
