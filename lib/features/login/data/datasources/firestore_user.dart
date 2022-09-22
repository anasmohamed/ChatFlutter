import 'package:chat/features/register/data/models/user_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUser {
  static final _fireStoreUserCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required UserDataModel userPresonalInfo}) async {
    await _fireStoreUserCollection
        .doc(userPresonalInfo.uId)
        .set(userPresonalInfo.toMap())
        .then((value) {})
        .catchError((error) {
      print(error.toString());
    });
  }
}
