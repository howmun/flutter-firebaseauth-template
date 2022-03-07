import 'package:fireship_firestore_provide_hero/providers/firebaseauth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Consumer<FirebaseAuthProvider>(
          builder: (context, fap, child) => Text(
            'Your Firebase Auth user id is:  ${fap.getUserId()}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.logout),
        onPressed: () {
          Provider.of<FirebaseAuthProvider>(context, listen: false).signOut();
          Navigator.of(context).pushReplacementNamed('/');
        },
      ),
    );
  }
}
