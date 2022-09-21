import 'package:firebase_auth/firebase_auth.dart';

import '../../data/models/registe_user_requset_model.dart';

abstract class RegisterUserRepository {
  Future<User> registerUser(UserRequestModel newUserInfo);
}
