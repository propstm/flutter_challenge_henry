// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlot _$TimeSlotFromJson(Map<String, dynamic> json) => TimeSlot(
      id: json['id'] as int,
      providerName: json['providerName'] as String,
      providerId: json['providerId'] as int,
      prettyEndTime: json['prettyEndTime'] as String,
      prettyStartTime: json['prettyStartTime'] as String,
      isAvailable: json['isAvailable'] as bool,
    );

Map<String, dynamic> _$TimeSlotToJson(TimeSlot instance) => <String, dynamic>{
      'id': instance.id,
      'providerName': instance.providerName,
      'providerId': instance.providerId,
      'prettyStartTime': instance.prettyStartTime,
      'prettyEndTime': instance.prettyEndTime,
      'isAvailable': instance.isAvailable,
    };
