import 'package:firebase_auth/firebase_auth.dart';
import 'package:fireship_firestore_provide_hero/screens/home_screen.dart';
import 'package:flutter/material.dart';

class FirebaseAuthProvider {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthProvider(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  String getUserId() {
    if (_firebaseAuth.currentUser == null) {
      return '';
    } else {
      return _firebaseAuth.currentUser!.uid;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      return "Success";
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  Future<String> signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
      return "Success";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
