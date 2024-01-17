import 'package:flutter_api_starter/models/henry_api/time_slot.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedule_response.g.dart';

@JsonSerializable()
class ScheduleResponse {
  /// The generated code assumes these values exist in JSON.
  final List<TimeSlot> timeslots;

  ScheduleResponse({required this.timeslots});

  factory ScheduleResponse.fromJson(Map<String, dynamic> json) =>
      _$ScheduleResponseFromJson(mockScheduleData);
}

var mockScheduleData = {
  "timeslots": [
    {
      "id": 1,
      "providerName": "Dr. Joe Smith",
      "prettyStartTime": "3:00pm",
      "prettyEndTime": "3:15pm",
      "isAvailable": false
    },
    {
      "id": 1,
      "providerName": "Dr. Joe Smith",
      "prettyStartTime": "3:15pm",
      "prettyEndTime": "3:30pm",
      "isAvailable": true
    },
    {
      "id": 1,
      "providerName": "Dr. Joe Smith",
      "prettyStartTime": "3:30pm",
      "prettyEndTime": "3:45pm",
      "isAvailable": true
    },
    {
      "id": 1,
      "providerName": "Dr. Joe Smith",
      "prettyStartTime": "3:45pm",
      "prettyEndTime": "4:00pm",
      "isAvailable": false
    }
  ]
};
