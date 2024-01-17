// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      providers: (json['providers'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      clients: (json['clients'] as List<dynamic>)
          .map((e) => UserInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'providers': instance.providers,
      'clients': instance.clients,
    };
