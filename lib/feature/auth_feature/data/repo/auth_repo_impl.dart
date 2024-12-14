import 'dart:developer';

import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/core/services/fire_base_auth_services.dart';
import 'package:commerce/core/services/firebase_firestore.dart';
import 'package:commerce/feature/auth_feature/data/model/user_model.dart';
import 'package:commerce/feature/auth_feature/domain/auth_repo/auth_repo.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo {
  FireBaseAuthServices fireBaseAuthServices;
  FireBaseFireStoreServices fireBaseFireStoreServices;
  AuthRepoImpl(this.fireBaseAuthServices, this.fireBaseFireStoreServices);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password) async {
    UserEntity? userEntity;
    try {
      User user = await fireBaseAuthServices.signInWithEmailAndPassword(
          emailAddress: email, password: password);
      userEntity = await fireBaseFireStoreServices.getUserData(id: user.uid);
      return Right(userEntity!);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> registerWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAuthServices.createWithEmailAndPassword(
          emailAddress: email, password: password, name: name);
      UserEntity userEntity = UserModel.fromFireBase(user);
      await fireBaseFireStoreServices.addUser(
          userModel: UserModel.fromFireBase(user), id: user.uid);
      log('name in auth repo ${UserModel.fromFireBase(user).name}');
      return Right(userEntity);
    } on Exception catch (e) {
      deleteUser(user);
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return left(ServerFailure('Google sign-in was canceled or failed.'));
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        return left(ServerFailure('Failed to retrieve user details.'));
      }

      final userModel = UserModel.fromFireBase(user);
      final userExists =
          await fireBaseFireStoreServices.isUserExist(id: user.uid);

      if (userExists) {
        await fireBaseFireStoreServices.getUserData(id: user.uid);
        return right(userModel);
      } else {
        await fireBaseFireStoreServices.addUser(
            userModel: userModel, id: user.uid);
        return right(userModel);
      }
    } catch (e) {
      log('Exception in signinWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Handle cancellation or failure during Facebook login
      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        return left(ServerFailure('Facebook login was canceled or failed.'));
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      final User? user = userCredential.user;

      if (user == null) {
        return left(ServerFailure('Failed to retrieve user details.'));
      }

      final userModel = UserModel.fromFireBase(user);
      final userExists =
          await fireBaseFireStoreServices.isUserExist(id: user.uid);

      if (userExists) {
        await fireBaseFireStoreServices.getUserData(id: user.uid);
        return right(userModel);
      } else {
        await fireBaseFireStoreServices.addUser(
            userModel: userModel, id: user.uid);
        return right(userModel);
      }
    } catch (e) {
      log('Exception in signinWithFacebook: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }

  @override
  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await FirebaseAuth.instance.currentUser!.delete();
    }
  }
}
/**
 * Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
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
    user = userCredential.user;
    UserEntity userEntity = UserModel.fromFireBase(user!);
    if (await fireBaseFireStoreServices.isUserExist(id: user.uid)) {
    await fireBaseFireStoreServices.getUserData(
    id: userCredential.user!.uid);
    return right(userEntity);
    } else {
    await fireBaseFireStoreServices.addUser(
    userModel: UserModel.fromFireBase(userCredential.user!),
    id: userCredential.user!.uid);
    return right(UserModel.fromFireBase(userCredential.user!));
    }
    } catch (e) {
    if(user != null) {
    if (!await fireBaseFireStoreServices.isUserExist(id: user.uid)) {
    await deleteUser(user);
    }
    }
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
 */
