import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:saloon_pro/core/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  SharedPreferences sharedPreferences;
  Box authBox;
  UserPreferences({required this.sharedPreferences, required this.authBox});

  Future<bool> saveUser(UserModel user,
      {required String password, required String token}) async {
    sharedPreferences.setInt(UserPreferenceKeys.idKey, user.id);
    sharedPreferences.setString(UserPreferenceKeys.idKey, user.name ?? '');
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, user.token ?? '');
    sharedPreferences.setString(UserPreferenceKeys.emailKey, user.email);
    sharedPreferences.setString(UserPreferenceKeys.phoneKey, user.phoneNumber);
    sharedPreferences.setString(UserPreferenceKeys.lastNameKey, user.lastname);
    sharedPreferences.setString(
        UserPreferenceKeys.firstNameKey, user.firstname);
    // sharedPreferences.setInt(UserPreferenceKeys.statusKey, user.status);
    sharedPreferences.setString(UserPreferenceKeys.dateKey, user.createdAt);
    sharedPreferences.setString(
        UserPreferenceKeys.updatedAtKey, user.updatedAt ?? "");

    return sharedPreferences.commit();
  }

  Future<bool> saveUserToHive(UserModel user,
      {required String password, required String token}) async {
    try {
      await authBox.put('user', user.toJson());
      await authBox.put('password', password);
      await authBox.put('token', token);
      return true;
    } catch (err) {}

    return false;
  }

  Future<void> updateUser(UserModel user) async {
    sharedPreferences.setInt(UserPreferenceKeys.idKey, user.id);
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, user.token ?? '');
    sharedPreferences.setString(UserPreferenceKeys.emailKey, user.email);
    sharedPreferences.setString(UserPreferenceKeys.phoneKey, user.phoneNumber);
    // sharedPreferences.setString(UserPreferenceKeys.roleKey, user.role ?? "");
    sharedPreferences.setString(UserPreferenceKeys.lastNameKey, user.lastname);
    sharedPreferences.setString(
        UserPreferenceKeys.firstNameKey, user.firstname);
    // sharedPreferences.setInt(UserPreferenceKeys.statusKey, user.status);
    sharedPreferences.setString(UserPreferenceKeys.dateKey, user.createdAt);

    sharedPreferences.reload();
  }

  UserModel getUser() {
    var data = authBox.get('user');

    return UserModel.fromJson(data);
  }

  Future<void> updateAuthToken(String token) async {
    sharedPreferences.setString(UserPreferenceKeys.tokenKey, token);
    await sharedPreferences.reload();
  }

  String? getToken() {
    return sharedPreferences.getString("token");
  }

  Future<void> removeUser() async {
    for (String userKey in UserPreferenceKeys.allKeys) {
      await sharedPreferences.remove(userKey);
    }

    await authBox.deleteAll(['user', 'password', 'token']);
  }

  void userTypeChoose(String value) {
    sharedPreferences.setString("userType", value);
  }

  String? userTypeChoosen() {
    return sharedPreferences.getString("userType");
  }

  bool isUserTypeChoosen() {
    return sharedPreferences.getString("userType") != null ? true : false;
  }

  void sliderSeen() {
    sharedPreferences.setBool("firstLoggin", true);
  }

  void initUserProfile() {
    sharedPreferences.setBool("haveProfile", true);
  }

  bool haveProfile() {
    return !(sharedPreferences.getBool("haveProfile") ?? false);
  }

  bool isFirstLoggin() {
    return !(sharedPreferences.getBool("firstLoggin") ?? false);
  }

  bool isUserLoggedIn() {
    try {
      authBox.get('token') as String;
      getUser();
      return true;
    } catch (err) {
      removeUser();
      return false;
    }
  }
}

class UserPreferenceKeys {
  static const String idKey = "userId";
  static const String tokenKey = "token";
  static const String phoneKey = "userPhone";
  static const String lastNameKey = "userLastName";
  static const String firstNameKey = "userFirstName";
  static const String emailKey = "userEmail";
  static const String passwordKey = "userPassword";
  static const String photoKey = "userPhoto";
  static const String statusKey = "userStatus";
  static const String dateKey = "userDate";
  static const String updatedAtKey = "userDate";

  static List<String> allKeys = [
    idKey,
    tokenKey,
    emailKey,
    phoneKey,
    passwordKey,
    photoKey,
    lastNameKey,
    firstNameKey,
    statusKey,
    dateKey,
  ];
}
