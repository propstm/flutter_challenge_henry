import 'package:flutter/material.dart';
import 'package:flutter_api_starter/models/henry_api/user_info.dart';

class ClientDetailScreen extends StatelessWidget {
  const ClientDetailScreen({super.key, required this.user});

  final UserInfo user;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(user.roleName),
      ),
    );
  }
}
