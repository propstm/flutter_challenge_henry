import 'package:flutter/material.dart';
import 'package:flutter_api_starter/models/henry_api/schedule_response.dart';
import 'package:flutter_api_starter/models/henry_api/time_slot.dart';
import 'package:flutter_api_starter/models/henry_api/user_info.dart';
import 'package:flutter_api_starter/repository/schedule_repository.dart';

import 'network/api_service.dart';

class ClientDetailScreen extends StatefulWidget {
  const ClientDetailScreen({super.key, required this.user});

  final UserInfo user;

  @override
  State<ClientDetailScreen> createState() => _ClientDetailScreenState();
}

class _ClientDetailScreenState extends State<ClientDetailScreen> {
  late List<TimeSlot> schedule = [];
  bool ready = false;

  @override
  void initState() {
    super.initState();
    getUserList();
  }

  Future<void> getUserList() async {
    final api = ApiService();
    ScheduleResponse response =
        await ScheduleRepository(api: api).getSchedule();
    schedule = response.timeslots;
    setState(() {
      ready = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.fullName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: schedule.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final timeslot = schedule[index];
              return ListTile(
                onTap: () => tappedTile(timeslot),
                trailing: Icon(Icons.arrow_right_sharp),
                title: Row(
                  children: <Widget>[
                    Text(
                      '${timeslot.prettyStartTime} - ${timeslot.prettyEndTime}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(), // use Spacer
                    Text('${timeslot.providerName}'),
                  ],
                ),
              );
            }),
      ),
    );
  }

  tappedTile(TimeSlot slot) {
    print('TAPPED ON ${slot}');
  }
}
