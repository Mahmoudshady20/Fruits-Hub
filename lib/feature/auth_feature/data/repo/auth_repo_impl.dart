import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/core/services/fire_base_auth_services.dart';
import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/auth_repo/auth_repo.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  FireBaseAuthServices fireBaseAuthServices;
  AuthRepoImpl(this.fireBaseAuthServices);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      User user = await fireBaseAuthServices.signInWithEmailAndPassword(
          emailAddress: email, password: password);
      return Right(UserModel.fromFireBase(user));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      User user = await fireBaseAuthServices.createWithEmailAndPassword(
          emailAddress: email, password: password, name: name);
      return Right(UserModel.fromFireBase(user));
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
