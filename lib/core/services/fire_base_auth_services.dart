import 'dart:developer';

import 'package:commerce/core/services/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthServices {
  Future<User> createWithEmailAndPassword(
      {required String emailAddress,
      required String password,
      required String name}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user == null) {
        log('Auth Services user is null');
        throw CustomException(
            message: 'An error occurred. Please try again later.');
      }
      credential.user?.updateDisplayName(name);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(
            message: 'An error occurred. Please try again later.');
      }
    } catch (e) {
      throw CustomException(
          message: 'An error occurred. Please try again later.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user == null) {
        log('Auth Services user is null');
        throw CustomException(
            message: 'An error occurred. Please try again later.');
      }
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else {
        throw CustomException(
            message: 'An error occurred. Please try again later.');
      }
    } catch (e) {
      throw CustomException(
          message: 'An error occurred. Please try again later.');
    }
  }
}
