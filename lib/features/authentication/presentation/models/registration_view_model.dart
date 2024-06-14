class RegistrationViewModel {
  int accountTypeData;
  PersonnalInformationModel personnalInformation;
  WorkAuthorizationProofModel workAuthorizationProof;
  int? categoryProId;
  String? certificationPro;
  SaloonAddressModel addSaloonAddress;
  SaloonPhotos photos;

  RegistrationViewModel({
    required this.accountTypeData,
    required this.personnalInformation,
    required this.workAuthorizationProof,
    this.categoryProId,
    this.certificationPro,
    required this.addSaloonAddress,
    required this.photos,
  });

  factory RegistrationViewModel.empty() {
    return RegistrationViewModel(
      accountTypeData: 1,
      personnalInformation: PersonnalInformationModel.empty(),
      workAuthorizationProof: WorkAuthorizationProofModel.empty(),
      addSaloonAddress: SaloonAddressModel.empty(),
      photos: SaloonPhotos.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // "type": accountTypeData,
      "category_pro_id": categoryProId,
      "certification_pro": certificationPro,
      ...personnalInformation.toJson(),
      ...workAuthorizationProof.toJson(),
      ...addSaloonAddress.toJson(),
    };
  }
}

class PersonnalInformationModel {
  String email;
  String? saloonName;
  String firstname;
  String lastname;
  String city;
  String birthdate;
  String dialCode;
  String phoneNumber;
  String password;

  PersonnalInformationModel({
    required this.email,
    this.saloonName,
    required this.firstname,
    required this.lastname,
    required this.city,
    required this.birthdate,
    required this.dialCode,
    required this.phoneNumber,
    required this.password,
  });

  factory PersonnalInformationModel.empty() {
    return PersonnalInformationModel(
      email: 'gillesyao12@gmail.com',
      saloonName: 'pinterest',
      firstname: 'john',
      lastname: 'doe',
      city: '',
      birthdate: '',
      dialCode: '+225',
      phoneNumber: '06877667766',
      password: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "saloonName": saloonName,
      "firstname": firstname,
      "lastname": lastname,
      "city": city,
      "birthdate": birthdate,
      "dialCode": dialCode,
      "phoneNumber": phoneNumber,
      "password": password,
    };
  }
}

class WorkAuthorizationProofModel {
  String typeID;
  String idFilePath;

  WorkAuthorizationProofModel({required this.typeID, required this.idFilePath});

  factory WorkAuthorizationProofModel.empty() {
    return WorkAuthorizationProofModel(typeID: 'passeport', idFilePath: '');
  }

  Map<String, dynamic> toJson() {
    return {"piece": idFilePath, "type_piece": typeID};
  }
}

class SaloonAddressModel {
  String address;
  String buildingName;
  String appartmentName;
  String indications;
  String bail;

  SaloonAddressModel({
    required this.address,
    required this.buildingName,
    required this.appartmentName,
    required this.indications,
    required this.bail,
  });

  factory SaloonAddressModel.empty() {
    return SaloonAddressModel(
        address: '',
        buildingName: '',
        appartmentName: '',
        indications: '',
        bail: '');
  }

  Map<String, dynamic> toJson() {
    return {
      "address_name": address,
      "batiment_name": buildingName,
      "number_local": appartmentName,
      "indications": indications,
      "bail": bail,
    };
  }
}

class SaloonPhotos {
  List<String> photos;
  SaloonPhotos({required this.photos});

  factory SaloonPhotos.fromJson(List<String> json) {
    return SaloonPhotos(photos: json);
  }

  factory SaloonPhotos.empty() {
    return SaloonPhotos(photos: []);
  }

  Map<String, dynamic> toJson() {
    return {"photos": photos};
  }
}
