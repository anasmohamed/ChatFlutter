import 'package:chat/features/register/data/models/user_data_model.dart';

abstract class FirestoreUserRepository {
  Future<void> addNewUser(UserDataModel newUserInfo);
  // Future<UserDataModel> getPersonalInfo(
  // {required String userId, bool getDeviceToken = false});
}
