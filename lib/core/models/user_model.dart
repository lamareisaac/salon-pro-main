import '../entities/user.dart';

class UserModel extends User {
  int id;
  String firstname;
  String lastname;
  String? name;
  String dialCode;
  String phoneNumber;
  String profession;
  String photoUrl;
  String email;
  String? emailVerifiedAt;
  String? updatedAt;
  String createdAt;
  String? password;
  String? token;
  Map<String, dynamic>? userType;
  int isActive;
  int? isProfessional;
  int? userTypesId;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      this.name,
      this.dialCode = "",
      this.phoneNumber = "",
      this.profession = "",
      this.photoUrl = "",
      this.isActive = 0,
      this.isProfessional = 0,
      required this.email,
      this.emailVerifiedAt,
      this.userTypesId = 3,
      this.updatedAt,
      this.password,
      this.token,
      required this.createdAt})
      : super(
            id: id,
            firstname: firstname,
            lastname: lastname,
            name: name,
            dialCode: dialCode,
            phoneNumber: phoneNumber,
            profession: profession,
            photoUrl: photoUrl,
            isActive: isActive,
            isProfessional: isProfessional,
            email: email,
            emailVerifiedAt: emailVerifiedAt,
            userTypesId: userTypesId,
            updatedAt: updatedAt,
            createdAt: createdAt);

  get fullname {
    return '$firstname $lastname';
  }

  factory UserModel.fromJson(Map<dynamic, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        name: json['name'],
        dialCode: json['dial_code'],
        phoneNumber: json['phone_number'],
        profession: json['profession'],
        photoUrl: json['photo_url'],
        isActive: json['is_active'],
        isProfessional: json['is_professional'],
        email: json['email'],
        emailVerifiedAt: json['email_verified_at'],
        userTypesId: json['user_types_id'],
        updatedAt: json['updated_at'],
        createdAt: json['created_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'name': name,
      'dial_code': dialCode,
      'phone_number': phoneNumber,
      'profession': profession,
      'photo_url': photoUrl,
      'is_active': isActive,
      'is_professional': isProfessional,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'user_types_id': userTypesId,
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }

  @override
  List<Object?> get props => [id, name, firstname, lastname, email];
}
