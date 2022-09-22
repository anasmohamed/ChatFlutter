import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/registe_user_requset_model.dart';
import '../../domain/usecases/register_user.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final RegisterUserUseCase registerUserUseCase;
  RegisterCubit({required this.registerUserUseCase})
      : super(RegisterInitialStates());

  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData suffixIconForPasswordTextField = Icons.visibility_off_outlined;
  bool isPassword = true;
  User? user;

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffixIconForPasswordTextField =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(RegisterPasswordTextFieldChangeVisibilityStates());
  }

  Future<User?> registerUser(UserRequestModel registerUserRequestModel) async {
    emit(RegisterLoadingStates());
    await registerUserUseCase(params: registerUserRequestModel).then(
      (newUser) {
        emit(RegisterSuccessStates(newUser));
        user = newUser;
      },
    ).catchError((error) {
      debugPrint('error aaaa ${error}');
      emit(RegisterErrorStates());
    });
    return user;
  }
}
