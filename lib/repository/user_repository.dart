import 'package:flutter_api_starter/models/henry_api/user_list_response.dart';
import 'package:flutter_api_starter/network/api_service.dart';

class UserRepository {
  UserRepository({required this.api});

  ApiService api;

  Future<UserResponse> getUserList() async {
    String url = '${api.baseAPI}/roster/DET/20232024';
    print('URL: $url');
    final response = await api.get(url);
    final stronglyTypedResponse =
        UserResponse.fromJson(response.data as Map<String, dynamic>);
    return stronglyTypedResponse;
  }
}
