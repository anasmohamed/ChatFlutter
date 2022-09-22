import 'package:chat/features/login/domain/usecases/login_user_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../register/data/models/registe_user_requset_model.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginUserUseCase loginUserUseCase;
  LoginCubit({required this.loginUserUseCase}) : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffixIconForPasswordTextField = Icons.visibility_off_outlined;
  bool isPassword = false;
  User? user;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffixIconForPasswordTextField =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(PasswordTextFieldChangeVisibilityStates());
  }

  Future<User?> loginUser(UserRequestModel params) async {
    emit(LoginLoadingStates());
    await loginUserUseCase(params: params).then(
      (newUser) {
        emit(LoginSuccessStates(user: newUser));
        user = newUser;
      },
    ).catchError((error) {
      debugPrint('error aaaa ${error}');
      emit(LoginErrorStates(error));
    });
    return user;
  }
}
