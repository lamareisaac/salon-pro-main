import 'package:dartz/dartz.dart';
import '../../../../core/entities/user.dart';
import '../../../../core/utils/failure.dart';
import '../../presentation/models/registration_view_model.dart';
import '../repository/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository repository;
  RegisterUsecase({required this.repository});

  Future<Either<Failure, User>> call(SaloonRegistrationParams params) async {
    return repository.register(params);
  }
}

class RegisterParams {
  String companyName;
  String email;
  String name;
  String password;

  RegisterParams(
      {required this.email,
      required this.companyName,
      required this.name,
      required this.password});

  factory RegisterParams.fromMap(Map<String, dynamic> json) {
    return RegisterParams(
      email: json['email'],
      companyName: json['companyName'],
      name: json['name'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "salon_name": companyName,
      "name": name,
      "firstname": "john",
      "lastname": name,
      "dial_code": "+225",
      "phone_number": "0779920203",
      "profession": "Artiste Coiffeur",
      "is_active": 1,
      "is_professional": 1,
      "user_types_id": 3,
    };
  }
}

class SaloonRegistrationParams {
  String saloonName;
  String email;
  String firstname;
  String lastname;
  String city;
  String birthday;
  String dialCode;
  String phoneNumber;
  String password;
  String photoPath;
  String identityCardPath;
  String categoryProId;
  String certificationPath;
  String numberSurccusale;
  String companyNumber;
  String accountnumber;
  String lat;
  String lon;
  String address;
  String buildingName;
  String houseNumber;
  String houseIndications;
  String bail;
  String description;
  String saloonPictures;
  String coverPicture;

  SaloonRegistrationParams({
    required this.saloonName,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.birthday,
    required this.dialCode,
    required this.phoneNumber,
    required this.password,
    required this.photoPath,
    required this.identityCardPath,
    required this.categoryProId,
    required this.certificationPath,
    required this.numberSurccusale,
    required this.companyNumber,
    required this.accountnumber,
    required this.lat,
    required this.lon,
    required this.address,
    required this.buildingName,
    required this.houseNumber,
    required this.houseIndications,
    required this.bail,
    required this.description,
    required this.saloonPictures,
    required this.coverPicture,
  });

  factory SaloonRegistrationParams.fromMap(Map<String, dynamic> json) {
    return SaloonRegistrationParams(
      saloonName: json["salon_name"],
      email: json["email"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      city: json["city"],
      birthday: json["birthday"],
      dialCode: json["dial_code"],
      phoneNumber: json["phone_number"],
      password: json["password"],
      photoPath: json["photoPath"],
      identityCardPath: json["piece"],
      categoryProId: json["category_pro_id"],
      certificationPath: json["certification_pro"],
      numberSurccusale: json["number_surccusale"],
      companyNumber: json["numero_company"],
      accountnumber: json["numero_compte"],
      lat: json["lat"],
      lon: json["lon"],
      address: json["address_name"],
      buildingName: json["batiment_name"],
      houseNumber: json["number_local"],
      houseIndications: json["indications"],
      bail: json["bail"],
      description: json["description"],
      saloonPictures: json["salon_pictures"],
      coverPicture: json["cover_picture"],
    );
  }

  factory SaloonRegistrationParams.fromViewModel(RegistrationViewModel model) {
    return SaloonRegistrationParams(
      saloonName: model.personnalInformation.saloonName ?? "",
      email: model.personnalInformation.email,
      firstname: model.personnalInformation.firstname,
      lastname: model.personnalInformation.lastname,
      city: model.personnalInformation.email,
      birthday: model.personnalInformation.birthdate,
      dialCode: model.personnalInformation.dialCode,
      phoneNumber: model.personnalInformation.phoneNumber,
      password: model.personnalInformation.password,
      photoPath:
          model.photos.photos.isNotEmpty ? model.photos.photos.first : '',
      identityCardPath: model.workAuthorizationProof.idFilePath,
      categoryProId: "1",
      certificationPath: model.workAuthorizationProof.idFilePath,
      numberSurccusale: model.personnalInformation.email,
      companyNumber: model.personnalInformation.email,
      accountnumber: model.personnalInformation.email,
      lat: "1",
      lon: "1",
      address: model.addSaloonAddress.address,
      buildingName: model.addSaloonAddress.buildingName,
      houseNumber: model.addSaloonAddress.appartmentName,
      houseIndications: model.addSaloonAddress.indications,
      bail: model.addSaloonAddress.bail,
      description: "",
      saloonPictures: model.personnalInformation.email,
      coverPicture: model.personnalInformation.email,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "salon_name": saloonName,
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "city": city,
      "birthday": "20-04-1990", // birthday
      "dial_code": dialCode,
      "phone_number": phoneNumber,
      "password": password,
      "photo_url": photoPath, // replace with file
      "piece": identityCardPath,
      "category_pro_id": 1,
      "certification_pro": certificationPath, // replace with file
      "number_surccusale": numberSurccusale,
      "numero_company": companyNumber,
      "numero_compte": accountnumber,
      "lat": lat,
      "lon": lon,
      "address_name": address,
      "batiment_name": buildingName,
      "number_local": houseNumber,
      "indications": houseIndications,
      "bail": bail, // replace with file
      "description": description,
      "salon_pictures": [], // replace all files
      "cover_picture": "", // replace with file
    };
  }
}
