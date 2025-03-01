import 'dart:convert';
import 'package:firebase_shop/domain/entity/user.dart';

class UserModel {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;
  final String image;
  final int gender;

  UserModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gender
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
        userId: userId,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        image: image);
  }
}
