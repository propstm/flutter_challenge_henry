import 'package:flutter/material.dart';
import 'package:flutter_api_starter/models/henry_api/user_info.dart';
import 'package:flutter_api_starter/repository/schedule_repository.dart';

import 'network/api_service.dart';

class ProviderDetailScreen extends StatefulWidget {
  const ProviderDetailScreen({super.key, required this.user});

  final UserInfo user;

  @override
  State<ProviderDetailScreen> createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  DateTime selectedDate = DateTime.now();
  String prettyDate = 'Select Date';

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  Future<void> _selectStartTime(BuildContext context) async {
    // Can't limit to 15 min increment selections.
    // https://github.com/flutter/flutter/issues/60573
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );

    if (picked != null && picked != startTime) {
      setState(() {
        startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );

    if (picked != null && picked != endTime) {
      setState(() {
        endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle consistentStyle = TextStyle(fontSize: 16);
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Blocking Tool',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Time block selection for ${prettyDate}',
              style: consistentStyle,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => showPicker(context),
                child: const Text('Update Date Selection'),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Select Time Block:',
              style: consistentStyle,
            ),
            Text(
              'Selected Time Range: ${startTime.format(context)} - ${endTime.format(context)}',
              style: consistentStyle,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _selectStartTime(context),
              child: Text('Select Start Time'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _selectEndTime(context),
              child: Text('Select End Time'),
            ),
            SizedBox(height: 36),
            ElevatedButton(
                onPressed: _saveTimeblock, child: Text('SAVE TIMEBLOCK')),
          ],
        ),
      ),
    );
  }

  Future<void> showPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2024, 1),
        lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        prettyDate = selectedDate.toLocal().toString().split(' ')[0];
      });
    }
  }

  void _saveTimeblock() {
    // call web service and update value.
    final api = ApiService();
    ScheduleRepository(api: api).setProviderTimeblock(widget.user.id,
        selectedDate.applied(startTime), selectedDate.applied(endTime));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Your timeblock has been saved."),
    ));
  }
}

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}
