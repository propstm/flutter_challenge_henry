import 'package:flutter/material.dart';
import 'package:flutter_api_starter/models/henry_api/user_list_response.dart';
import 'package:flutter_api_starter/repository/user_repository.dart';

import 'models/henry_api/user_info.dart';
import 'network/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Starter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Red Wings Roster API Exercise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<UserInfo> userList = [];
  bool ready = false;

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  Future<void> getUserList() async {
    final api = ApiService();
    UserResponse response = await UserRepository(api: api).getUserList();

    userList = [...response.providers, ...response.clients];
    setState(() {
      ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select User and Role',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
          itemCount: userList.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            final userObject = userList[index];
            return ListTile(
              trailing: Icon(Icons.arrow_right_sharp),
              title: Row(
                children: <Widget>[
                  Text(
                    '${userObject.fullName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(), // use Spacer
                  Text('(${userObject.roleName})'),
                ],
              ),
            );
          }),
    );
  }
}