import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> loginWithEmailAndPassword(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user found for that email.')),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No user found for that email.')),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Wrong password provided for that user.')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
