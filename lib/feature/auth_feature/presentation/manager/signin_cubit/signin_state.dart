import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity userEntity;
  SignInSuccess({required this.userEntity});
}

class SignInFailure extends SignInState {
  final String message;
  SignInFailure({required this.message});
}

class SignInLoading extends SignInState {}
