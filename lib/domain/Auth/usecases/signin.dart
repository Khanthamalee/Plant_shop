import 'package:dartz/dartz.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/data/auth/models/user_signin_req.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
import '../../../service_locator.dart';

class SigninUsecase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
