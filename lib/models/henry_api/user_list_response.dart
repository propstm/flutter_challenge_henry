import 'package:flutter_api_starter/models/henry_api/user_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_list_response.g.dart';

@JsonSerializable()
class UserResponse {
  /// The generated code assumes these values exist in JSON.
  final List<UserInfo> providers;
  final List<UserInfo> clients;

  UserResponse({required this.providers, required this.clients});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(mockUserData);
}

var mockUserData = {
  "providers": [
    {
      "id": 1,
      "fullName": "Dr. Joe Smith",
      "roleName": "provider",
      "roleId": 100
    },
    {
      "id": 2,
      "fullName": "Dr. Jared Goff",
      "roleName": "provider",
      "roleId": 100
    }
  ],
  "clients": [
    {"id": 201, "fullName": "John Doe", "roleName": "client", "roleId": 101},
    {"id": 202, "fullName": "Sally Smith", "roleName": "client", "roleId": 101}
  ]
};
