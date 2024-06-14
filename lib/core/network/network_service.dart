import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saloon_pro/core/models/user_preferences.dart';
import '../utils/failure.dart';
import 'dart:convert';
import 'network_request.dart';

/// Network service implementation
class NetworkService {
  NetworkRequest? _request;
  String BASE_URL = "http://svloon.com/api";
  UserPreferences preferences;

  NetworkService({required this.preferences});

  @override
  Future<dynamic> fetchRequest(
    NetworkRequest request, {
    bool collection = false,
  }) async {
    _request = request;

    try {
      switch (request.method) {
        case NetworkMethod.get:
          {
            if (collection) return _getCollectionRequest(request);

            return await _getRequest(request);
          }
        case NetworkMethod.post:
          {
            debugPrint("=================================== request");
            debugPrint(request.path);
            debugPrint(request.body.toString());
            return await _postRequest(request);
          }
        case NetworkMethod.put:
          {
            debugPrint("=================================== request");
            debugPrint(request.path);
            debugPrint(request.body.toString());
            return await _postRequest(request);
          }
        case NetworkMethod.delete:
          return await _deleteRequest(request);
      }
    } on SocketException {
      debugPrint("No internet Connection");
      throw ServerException(message: 'Vérifier votre accès internet');
    } on Error catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _getRequest(NetworkRequest param) async {
    final url = Uri.parse(BASE_URL + param.path);
    final response = await http.get(url, headers: _getHeaders());
    return _response(response, param);
  }

  Future<Map<String, dynamic>> _postRequest(NetworkRequest param) async {
    final url = Uri.parse(BASE_URL + param.path);
    final response = await http.post(url,
        body: json.encode(param.body), headers: _getHeaders());
    return _response(response, param);
  }

  Future<Map<String, dynamic>> _deleteRequest(NetworkRequest param) async {
    final url = Uri.parse(BASE_URL + param.path);

    final response = await http.delete(
      url,
      body: json.encode(param.body),
      headers: _getHeaders(),
    );

    return _response(response, param);
  }

  Future<Map<String, dynamic>> _response(
      http.Response response, NetworkRequest param) async {
    debugPrint("=== server response ===");

    print(response.statusCode);
    print(response.body.toString());

    switch (response.statusCode) {
      case 200:
      case 201:
      case 206:
        var responseJson = jsonDecode(response.body.toString());
        if (responseJson == null) {
          return {'data': null};
        }
        return responseJson;
      case 302:
        throw ServerException(message: formatErrorMessage(response));
      case 400:
        throw ServerException(message: formatErrorMessage(response));
      case 401:
      case 403:
        if (param.path != '/auth/login') {
          await login();

          switch (param.method) {
            case NetworkMethod.get:
              return _getRequest(param);
            case NetworkMethod.post:
              return _postRequest(param);
            case NetworkMethod.put:
              return _postRequest(param);
            case NetworkMethod.delete:
              return _deleteRequest(param);
          }
        }

        throw ServerException(message: formatErrorMessage(response));
      case 404:
        debugPrint("server response NotFoundException");
        throw ServerException(message: response.body.toString());
      case 422:
        try {
          var responseJson =
              jsonDecode(response.body.toString()) as Map<String, dynamic>;
          throw ValidationException(
              message: responseJson['message'], response: responseJson);
        } catch (err) {
          if (err is ValidationException) {
            rethrow;
          }
          throw ServerException(message: err.toString());
        }
      case 500:
        throw ServerException(
            message: formatErrorMessage(response), code: response.statusCode);
      default:
        throw ServerException(
            message:
                'Error while fetching data : ${response.statusCode.toString()}');
    }
  }

  String formatErrorMessage(response) {
    try {
      var error = jsonDecode(response.body.toString());
      return error['message'];
    } catch (ex) {
      return response.body.toString();
    }
  }

  /// Management the case where the API returns us a list rather than an object
  Future<List<dynamic>> _getCollectionRequest(NetworkRequest param) async {
    final url = Uri.parse(BASE_URL + param.path);
    final response = await http.get(url, headers: _getHeaders());
    return _collectionResponse(response, param);
  }

  Future<List<dynamic>> _collectionResponse(
      http.Response response, NetworkRequest param) async {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 206:
        var responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        await login();
        throw ServerException(message: response.body.toString());
      case 401:
      case 403:
        await login();
        return _getCollectionRequest(param);
      case 404:
        debugPrint("server response NotFoundException");
        throw ServerException(message: response.body.toString());
      case 422:
        try {
          var responseJson =
              jsonDecode(response.body.toString()) as Map<String, dynamic>;
          throw ValidationException(
              message: "Erreur de validation", response: responseJson);
        } catch (err) {
          throw ServerException(message: err.toString());
        }
      case 429:
        throw ServerException(message: response.toString());
      default:
        debugPrint("Server response FetchDataException");
        throw ServerException(
          message:
              'Error while fetching data : ${response.statusCode.toString()}',
        );
    }
  }

  Map<String, String> _getHeaders() {
    return preferences.getToken() == null
        ? {'Content-Type': 'application/json', 'Accept': 'application/json'}
        : {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${preferences.getToken()}'
          };
  }

  /// User re-authentication
  Future<void> login() async {
    final user = preferences.getUser();

    final Map<String, dynamic> loginData = {
      'user_id': user.id,
      'email': user.email,
      'password': user.password,
    };

    NetworkRequest request = NetworkRequest(
      path: "/auth/login",
      method: NetworkMethod.post,
      body: loginData,
      headers: const {"Content-Type": 'application/json'},
    );

    final json = await fetchRequest(request);
    final String? token = json["authToken"];

    if (token == null) {
      throw (ServerException(message: ""));
    }

    preferences.updateAuthToken(token);
  }
}
