// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingStates extends LoginStates {}

class LoginSuccessStates extends LoginStates {
  User user;
  LoginSuccessStates({
    required this.user,
  });
}

class LoginErrorStates extends LoginStates {
  final String error;
  LoginErrorStates(this.error);
}

class PasswordTextFieldChangeVisibilityStates extends LoginStates {}
