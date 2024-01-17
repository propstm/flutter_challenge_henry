import 'package:json_annotation/json_annotation.dart';

part 'time_slot.g.dart';

@JsonSerializable()
class TimeSlot {
  /// The generated code assumes these values exist in JSON.
  final int id;
  final String providerName;
  final String prettyStartTime;
  final String prettyEndTime;
  final bool isAvailable;

  TimeSlot(
      {required this.id,
      required this.providerName,
      required this.prettyEndTime,
      required this.prettyStartTime,
      required this.isAvailable});

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);
}
