abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSuccessStates extends RegisterStates {
  // final User user;
  // RegisterSuccessStates(this.user);
}

class RegisterErrorStates extends RegisterStates {}

class RegisterPasswordTextFieldChangeVisibilityStates extends RegisterStates {}
