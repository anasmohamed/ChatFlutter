import 'package:firebase_auth/firebase_auth.dart';

import '../../../register/data/models/registe_user_requset_model.dart';

abstract class LoginUserRepository {
  Future<User> loginUser(UserRequestModel newUserInfo);
}
