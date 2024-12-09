import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailure extends SignUpState {
  final String message;
  SignUpFailure({required this.message});
}

class SignUpSuccess extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccess({required this.userEntity});
}
