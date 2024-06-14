import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
abstract class User extends Equatable {
  int id;
  String firstname;
  String lastname;
  String? name;
  String dialCode;
  String phoneNumber;
  String profession;
  String photoUrl;
  int isActive;
  int? isProfessional;
  String email;
  String? emailVerifiedAt;
  int? userTypesId;
  String? updatedAt;
  String createdAt;
  Map<String, dynamic>? userType;

  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      this.name,
      required this.dialCode,
      required this.phoneNumber,
      required this.profession,
      required this.photoUrl,
      required this.isActive,
      required this.isProfessional,
      required this.email,
      this.emailVerifiedAt,
      required this.userTypesId,
      this.updatedAt,
      required this.createdAt});
}
