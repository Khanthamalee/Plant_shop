import 'package:firebase_shop/core/usecases/usecase.dart';
import 'package:firebase_shop/domain/Auth/repository/auth.dart';
import '../../../service_locator.dart';

class IsLoggedIn implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
