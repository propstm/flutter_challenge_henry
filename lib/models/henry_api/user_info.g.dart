// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      roleName: json['roleName'] as String,
      roleId: json['roleId'] as int,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'roleName': instance.roleName,
      'roleId': instance.roleId,
    };
