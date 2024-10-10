import 'package:dartz/dartz.dart';
import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';

import '../../../data/auth/models/user_creation_req.dart';
import '../../../service_locator.dart';

class SignupUsecase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
