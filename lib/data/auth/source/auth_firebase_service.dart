import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_shop/data/auth/models/user_creation_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserCreationReq user);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserCreationReq user) async {
    try {
      var ReturnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);

      FirebaseFirestore.instance
          .collection('user')
          .doc(ReturnedData.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'password': user.password,
        'gender': user.gender,
        'age': user.age
      });
      return const Right('Sign up was successfull');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provide is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exista with that email.';
      }
      return Left(message);
    }
  }
}
