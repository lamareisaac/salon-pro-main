import '../../../../core/entities/user.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/models/user_preferences.dart';
import '../../../../core/network/network_request.dart';
import '../../../../core/network/network_service.dart';
import '../../../../core/utils/failure.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<User> register(SaloonRegistrationParams params);
  Future<User> login(LoginParams params);
  Future<bool> logout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final NetworkService network;
  final UserPreferences preferences;

  AuthRemoteDataSourceImpl({required this.network, required this.preferences});

  @override
  Future<User> login(LoginParams params) async {
    NetworkRequest request = NetworkRequest(
        path: '/auth/login', method: NetworkMethod.post, body: params.toJson());
    var response = await network.fetchRequest(request);

    AuthModel token = AuthModel.fromJson(response);

    UserModel user = UserModel(
      id: 0,
      firstname: 'John',
      lastname: 'doe',
      email: 'john@doe.com',
      createdAt: '2023-10-22 18:00:00',
    );
    bool userSaved = await preferences.saveUserToHive(user,
        password: params.password, token: token.accessToken);

    if (!userSaved) {
      throw AuthenticationFailedException(
          "Impossible de vous connecter pour le moment.");
    }

    /// Check if login failed and response is 200
    return user;
  }

  @override
  Future<User> register(SaloonRegistrationParams params) async {
    NetworkRequest request = NetworkRequest(
        path: '/sign-up-salon',
        method: NetworkMethod.post,
        body: params.toJson());
    var response = await network.fetchRequest(request);

    UserModel user = UserModel.fromJson(response['data']);
    bool userSaved = await preferences.saveUserToHive(user,
        password: params.password, token: 'token');

    if (!userSaved) {
      throw AuthenticationFailedException(
          "Impossible de vous inscrire pour le moment.");
    }

    /// Check if login failed and response is 200
    return user;
  }

  @override
  Future<bool> logout() async {
    await preferences.removeUser();
    return true;
  }
}
