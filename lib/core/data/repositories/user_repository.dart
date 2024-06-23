import 'package:auto/core/data/models/apis/auth_model.dart';
import 'package:auto/core/data/models/apis/password_model.dart';
import 'package:auto/core/data/network/api_service.dart';
import 'package:auto/core/data/network/api_url.dart';
import 'package:auto/core/utils/general_util.dart';

class UserRepository {
  Future<AuthModel> creatAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String countryCode,
    required String confirmPassword,
  }) {
    final snapshot = ApiService<AuthModel>().multiPartRequset(
        url: ApiUrl.register,
        builder: AuthModel.fromJson,
        onRequest: (request) {
          request.headers['Content-Type'] = 'application/json';
          request.fields['name'] = name;
          request.fields['email'] = email;
          request.fields['phone'] = phone;
          request.fields['password'] = password;
          request.fields['country_code'] = countryCode;
          request.fields['password_confirm'] = confirmPassword;
        });
    return snapshot;
  }


  Future<AuthModel> login({
    required String email,
    required String password,
  }) {
    final snapshot = ApiService<AuthModel>().multiPartRequset(
        url: ApiUrl.login,
        builder: AuthModel.fromJson,
        onRequest: (request) {
          request.headers['Content-Type'] = 'application/json';
          request.fields['email'] = email;
          request.fields['password'] = password;
        });
    return snapshot;
  }

  Future<AuthModel> updateProfile({
    required String email,
    required String name,
    required String phone,
    required String countryCode,
  }) {
    final snapshot = ApiService<AuthModel>().multiPartRequset(
        url: ApiUrl.updateProfile,
        builder: AuthModel.fromJson,
        onRequest: (request) {
          request.headers['Content-Type'] = 'application/json';
          request.headers['Authorization'] = storage.getTokenInfo()!;
          request.fields['email'] = email;
          request.fields['name'] = name;
          request.fields['phone'] = phone;
          request.fields['country_code'] = countryCode;
        });
    return snapshot;
  }

  Future<PassordModel> changePassword({
    required String newPassword,
    required String confirmPassword,
    required String currentPassword
  }) {
    final snapshot = ApiService<PassordModel>().multiPartRequset(
        url: ApiUrl.changePassword,
        builder: PassordModel.fromJson,
        onRequest: (request) {
          request.headers['Content-Type'] = 'application/json';
          request.headers['Authorization'] = storage.getTokenInfo()!;
          request.fields['password'] = newPassword;
          request.fields['password_confirm'] = confirmPassword;
          request.fields['current_password'] = currentPassword;
        });
    return snapshot;
  }

  Future<PassordModel> deleteAcount() {
    final snapshot = ApiService<PassordModel>().build(
      url: ApiUrl.deleteAccount,
      isPublic: false,
      apiType: ApiType.delete,
      builder: PassordModel.fromJson,
    );
    return snapshot;
  }
}
