import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/*
* Users Authentication utility class using Firebase Auth
* */
class MyUserAuth {
  //Firebase authentication instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //This one login a user using email and password
  Future<String> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        if (kDebugMode) {
          print('User Not Found!');
        }
        return 'Informations invalides (email ou mot de passe)';
      } else if (err.code == 'invalid-email') {
        if (kDebugMode) {
          print('Wrong Email!');
        }
        return 'Informations invalides (email ou mot de passe)';
      } else if (err.code == 'wrong-password') {
        if (kDebugMode) {
          print('Wrong password!');
        }
        return 'Informations invalides (email ou mot de passe)';
      } else if (err.code == 'network-request-failed') {
        if (kDebugMode) {
          print('Network Error');
        }
        return 'Erreur réseau! connexion internet indisponible!';
      } else {
        if (kDebugMode) {
          print(err.toString());
        }
        return 'Erreur inconnue survenue! veuillez contacter '
            'un administrateur';
      }
    }
  }

  // Checks if the User is logged in
  bool isLogged() {
    final user = auth.currentUser;
    if (user != null) {
      if (kDebugMode) {
        print('User LoggedIn');
      }
      return true;
    } else {
      if (kDebugMode) {
        print('User Not LoggedIn');
      }
      return false;
    }
  }

  //Get some user data functions below

  //Get UID
  String? getUserUID() {
    final user = auth.currentUser;
    return user?.uid.toString();
  }

  //Get username
  String? getUserName() {
    final user = auth.currentUser;
    return user?.displayName.toString();
  }

  //Get email
  String? getUserEmail() {
    final user = auth.currentUser;
    return user?.email.toString();
  }

  //Get photoUrl
  String? getUserPhotoUrl() {
    final user = auth.currentUser;
    return user?.photoURL.toString();
  }

  //logout a user (why did I put this in a function?)
  void logout() {
    try {
      auth.signOut();
    } on FirebaseAuthException catch (err) {
      if (kDebugMode) {
        print(err.toString());
      }
    }
  }
}
