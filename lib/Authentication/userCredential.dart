// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insurapp/Models/users.dart';

import '../Home/Homepage.dart';
import '../Home/mainpage.dart';

class Auth {
  UserModel userModel = UserModel();

  //firebase initializing
  static Future<FirebaseApp> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  //creating account
  void createAccount(String username, String number,) async {
    userModel.uid = FirebaseAuth.instance.currentUser!.uid;
    userModel.email = FirebaseAuth.instance.currentUser!.email;
    userModel.username = username;
    userModel.number = number;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toMap());
  }

  //SignUp
  void SignUpAuth(BuildContext context, GlobalKey<FormState> keyForm,
      String username, String email, String number, String pass,) async {
    if (keyForm.currentState!.validate()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((uid) {
        createAccount(username, number,);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Account Created',
          desc: 'Account Successfully Created',
          btnOkOnPress: () {},
        )..show();
      }).catchError((e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Invalid Authentication',
          desc: '$e',
          btnOkOnPress: () {},
        )..show();
      });
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Invalid Form',
        desc: 'Please enter invalid data into the fields',
        btnOkOnPress: () {},
      )..show();
    }
  }

  //loggging In
  loginAuth(BuildContext context, GlobalKey<FormState> keyForm, String email,
      String pass) async {
    if (keyForm.currentState!.validate()) {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Mainpage(),
          ),
        ).catchError((e) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Invalid Authentication',
            desc: '$e',
            btnOkOnPress: () {},
          )..show();
        });
      });
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.WARNING,
        animType: AnimType.BOTTOMSLIDE,
        title: 'Invalid Form',
        desc: 'Please enter invalid data into the fields',
        btnOkOnPress: () {},
      )..show();
    }
  }

  //google signIn
  static Future<void> signinWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          //handle error
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Invalid Form',
            desc: 'account exist with different credential',
            btnOkOnPress: () {},
          )..show();
          print('account exist with different credential');
        } else if (e.code == 'invalid-credential') {
          //handle error
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Invalid Form',
            desc: 'invalid credential',
            btnOkOnPress: () {},
          )..show();
        }
      } catch (e) {
        //handle error
        print('something else');
      }
    }
  }

  //check user availability
  static void checkSignedIn(BuildContext context) {
    Auth.initializeFirebase();

    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }


  //password reset
  static void resetPassword(BuildContext context, String email) {
    final auth = FirebaseAuth.instance;
    auth.sendPasswordResetEmail(email: email);
  }

  //signout user
  static Future<void> signout({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
  }
}
