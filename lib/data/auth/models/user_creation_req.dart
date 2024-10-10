import 'dart:ffi';

class UserCreationReq {
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  Int? gender;
  String? age;

  UserCreationReq({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });
}
