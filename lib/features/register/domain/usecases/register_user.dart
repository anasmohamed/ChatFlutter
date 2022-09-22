// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/usecases/usecase.dart';
import '../../data/models/registe_user_requset_model.dart';
import '../repositories/reqister_user_repository.dart';

class RegisterUserUseCase implements UseCase<User, UserRequestModel> {
  final RegisterUserRepository registerUserRepository;
  RegisterUserUseCase({
    required this.registerUserRepository,
  });
  @override
  Future<User> call({required UserRequestModel params}) {
    return registerUserRepository.registerUser(params);
  }
}
