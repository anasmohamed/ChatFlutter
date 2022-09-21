import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../register/data/datasources/firebase_auth_register_remote_data_source.dart';
import '../../../register/data/models/registe_user_requset_model.dart';
import '../../domain/repositories/login_user_repository.dart';
import '../datasources/firebase_auth_login_remote_data_source.dart';

class LoginUserRepositoryImpl implements LoginUserRepository {
  final FirebaseAuthenticationLoginRemoteDataSource loginRemoteDataSource;
  LoginUserRepositoryImpl({
    required this.loginRemoteDataSource,
  });
  @override
  Future<User> loginUser(UserRequestModel newUserInfo) async {
    try {
      User userId = await FirebaseAuthenticationLoginRemoteDataSource.logIn(
          email: newUserInfo.email, password: newUserInfo.password);
      return userId;
    } on ServerException {
      return Future.error(ServerFailure());
    }
  }
}
