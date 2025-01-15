import 'package:dartz/dartz.dart';
import 'package:firebase_shop/data/auth/models/user_creation_req.dart';
import 'package:firebase_shop/data/auth/models/user_signin_req.dart';
import 'package:firebase_shop/data/auth/source/auth_firebase_service.dart';
import '../../../domain/Auth/repository/auth.dart';
import 'package:firebase_shop/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  Future<Either> signup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }

  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }
  
  @override
  Future<Either> sendPasswordResetEmail(String email) async {
     return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }
}
