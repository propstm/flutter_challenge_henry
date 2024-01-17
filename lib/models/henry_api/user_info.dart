import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo {
  /// The generated code assumes these values exist in JSON.
  final int id;
  final String fullName;
  final String roleName;
  final int roleId;

  UserInfo({
    required this.id,
    required this.fullName,
    required this.roleName,
    required this.roleId,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
