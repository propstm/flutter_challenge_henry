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
      body: ListView.builder(
          itemCount: schedule.length,
          itemBuilder: (BuildContext context, int index) {
            final timeslot = schedule[index];
            print(
                'start time: ${timeslot.prettyStartTime} is available ${timeslot.isAvailable}');
            String providerNameOrUnavailable = timeslot.isAvailable
                ? timeslot.providerName
                : 'Time unavailable';
            return ListTile(
              tileColor:
                  timeslot.isAvailable ? Colors.transparent : Colors.grey,
              onTap: () => timeslot.isAvailable
                  ? _showConfirmationDialog(context, timeslot)
                  : (),
              trailing: Icon(Icons.arrow_right_sharp),
              title: Row(
                children: <Widget>[
                  Text(
                    '${timeslot.prettyStartTime} - ${timeslot.prettyEndTime}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(), // use Spacer
                  Text('${providerNameOrUnavailable}'),
                ],
              ),
            );
          }),
    );
  }

  tappedTile(TimeSlot slot) {
    print('TAPPED ON ${slot}');
  }

  Future<void> _showConfirmationDialog(
      BuildContext context, TimeSlot slot) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment Confirmation'),
          content: Text(
              'Please confirm that you would like to schedule an appointment for ${slot.prettyStartTime} with ${slot.providerName}.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Handle deny action
              },
              child: Text('Deny'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Handle confirm action
                // call web service and update value.
              },
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
