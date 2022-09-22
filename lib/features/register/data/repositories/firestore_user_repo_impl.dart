// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat/features/register/data/models/user_data_model.dart';
import 'package:chat/features/register/domain/repositories/firestore_user_repository.dart';

import '../../../login/data/datasources/firestore_user.dart';

class FirestoreUserRepositoryImpl implements FirestoreUserRepository {
  FirestoreUser firestoreUser;
  FirestoreUserRepositoryImpl({
    required this.firestoreUser,
  });

  @override
  Future<void> addNewUser(UserDataModel newUserInfo) async {
    try {
      await firestoreUser.createUser(userPresonalInfo: newUserInfo);
      // await FirestoreNotification.createNewDeviceToken(
      // userId: newUserInfo.userId, myPersonalInfo: newUserInfo);
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
