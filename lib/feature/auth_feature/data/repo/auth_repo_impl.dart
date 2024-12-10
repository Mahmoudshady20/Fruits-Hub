import 'dart:developer';

import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/core/services/fire_base_auth_services.dart';
import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/auth_repo/auth_repo.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return right(UserModel.fromFireBase(userCredential.user!));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return right(UserModel.fromFireBase(userCredential.user!));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
}
