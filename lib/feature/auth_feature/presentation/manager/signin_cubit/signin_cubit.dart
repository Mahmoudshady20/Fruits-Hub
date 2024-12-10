import 'package:commerce/core/errors/failure.dart';
import 'package:commerce/feature/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:commerce/feature/auth_feature/domain/entity/user_entity.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signin_cubit/signin_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SignInState> {
  AuthRepoImpl authRepoImpl;
  SigninCubit(this.authRepoImpl) : super(SignInInitial());

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    Either<Failure, UserEntity> user =
        await authRepoImpl.loginWithEmailAndPassword(email, password);
    user.fold((failure) => emit(SignInFailure(message: failure.message)),
        (user) => emit(SignInSuccess(userEntity: user)));
  }

  Future<void> signinWithGoogle() async {
    emit(SignInLoading());
    Either<Failure, UserEntity> user = await authRepoImpl.signinWithGoogle();
    user.fold((failure) => emit(SignInFailure(message: failure.message)),
        (user) => emit(SignInSuccess(userEntity: user)));
  }

  Future<void> signinWithFacebook() async {
    emit(SignInLoading());
    Either<Failure, UserEntity> user = await authRepoImpl.signinWithFacebook();
    user.fold((failure) => emit(SignInFailure(message: failure.message)),
        (user) => emit(SignInSuccess(userEntity: user)));
  }
}
