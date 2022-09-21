// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/reqister_user_repository.dart';
import '../datasources/firebase_auth_register_remote_data_source.dart';
import '../models/registe_user_requset_model.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  final FirebaseAuthenticationRegisterRemoteDataSource
      registerUserRemoteDataSource;
  RegisterUserRepositoryImpl({
    required this.registerUserRemoteDataSource,
  });
  @override
  Future<User> registerUser(UserRequestModel newUserInfo) async {
    try {
      User userId = await FirebaseAuthenticationRegisterRemoteDataSource.signUp(
          email: newUserInfo.email, password: newUserInfo.password);
      return userId;
    } on ServerException {
      return Future.error(ServerFailure());
    }
  }
}
