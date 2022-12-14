import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

//test@gmail.com qwe123
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "succ";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> registerUser({
    required String hotelName,
  }) async {
    String res = "couldnt register";
    try {
      await _firebaseFirestore
          .collection(hotelName)
          .doc(_auth.currentUser!.uid)
          .set(
        {
          'cubes': 0 as int,
        },
      );
      res = "succ";
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  // Future<Cubes> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;

  //   DocumentSnapshot documentSnapshot = await _firebaseFirestore
  //       .collection('users')
  //       .doc('hotel')
  //       .collection('ifthar')
  //       .doc('values')
  //       .collection('coin')
  //       .get();

  //   return Cubes.fromSnap(documentSnapshot);
  // }

  //google Sign in
  // signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser =
  //       await GoogleSignIn(scopes: <String>['email']).signIn();
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser!.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
