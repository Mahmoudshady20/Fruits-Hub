import 'package:commerce/feature/auth_feature/data/repo/auth_repo_impl.dart';
import 'package:commerce/feature/auth_feature/presentation/manager/signup_cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState> {
  AuthRepoImpl authRepoImpl;
  SignupCubit(this.authRepoImpl) : super(SignUpInitial());

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignUpLoading());
    final result =
        await authRepoImpl.registerWithEmailAndPassword(email, password, name);
    result.fold((l) => emit(SignUpFailure(message: l.message)),
        (r) => emit(SignUpSuccess(userEntity: r)));
  }
}
