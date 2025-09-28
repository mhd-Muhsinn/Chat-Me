import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance of auth & firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //sign in
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password,String name) async {
    try {
      //creating user
      UserCredential usercredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      //saving usr info in doc
      _firestore
          .collection("Users")
          .doc(usercredential.user!.uid)
          .set({'uid': usercredential.user!.uid,'name':name,'email': email,});
      return usercredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  //errors
}
