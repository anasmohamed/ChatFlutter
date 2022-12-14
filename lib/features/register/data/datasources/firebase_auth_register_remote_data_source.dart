import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthenticationRegisterRemoteDataSource {
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  get user => _firebaseAuth.currentUser;

  static Future<User> signUp(
      {required String email, required String password}) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    final user = result.user!;
    return user;
  }

  static Future signOut() async => await _firebaseAuth.signOut();
}
