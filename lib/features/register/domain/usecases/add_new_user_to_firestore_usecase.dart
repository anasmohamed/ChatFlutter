import 'package:chat/core/usecases/usecase.dart';
import 'package:chat/features/register/data/models/user_data_model.dart';

import '../repositories/firestore_user_repository.dart';

class AddNewUserToFirestoreUseCase implements UseCase<void, UserDataModel> {
  final FirestoreUserRepository addNewUserRepository;

  AddNewUserToFirestoreUseCase({required this.addNewUserRepository});

  @override
  Future<void> call({required UserDataModel params}) {
    return addNewUserRepository.addNewUser(params);
  }
}
