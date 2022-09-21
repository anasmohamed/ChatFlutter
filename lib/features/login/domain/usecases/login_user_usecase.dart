import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../register/data/models/registe_user_requset_model.dart';
import '../repositories/login_user_repository.dart';

class LoginUserUseCase implements UseCase<User, UserRequestModel> {
  final LoginUserRepository loginUserRepository;
  LoginUserUseCase({
    required this.loginUserRepository,
  });
  @override
  Future<User> call(UserRequestModel newUserInfo) {
    return loginUserRepository.loginUser(newUserInfo);
  }
}
