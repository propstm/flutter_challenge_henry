import 'package:flutter_api_starter/models/henry_api/schedule_response.dart';
import 'package:flutter_api_starter/network/api_service.dart';

class ScheduleRepository {
  ScheduleRepository({required this.api});

  ApiService api;

  Future<ScheduleResponse> getSchedule() async {
    //Connect to actual endpoint later
    String url = '${api.baseAPI}/roster/DET/20232024';
    //print('URL: $url');
    final response = await api.get(url);
    final stronglyTypedResponse =
        ScheduleResponse.fromJson(response.data as Map<String, dynamic>);
    return stronglyTypedResponse;
  }

  Future<ScheduleResponse> setScheduleTimeslot(
      int providerId, int clientId, String prettyTimeslotStart) async {
    //Connect to actual endpoint later
    print('"saving" timeslot with call to endpoint with following data:\n'
        'clientId: ${clientId}\n'
        'providerId: ${providerId}\n'
        'prettyStartTime: ${prettyTimeslotStart}\n');

    String url = '${api.baseAPI}/roster/DET/20232024';
    //print('URL: $url');
    final response = await api.get(url);
    final stronglyTypedResponse =
        ScheduleResponse.fromJson(response.data as Map<String, dynamic>);
    return stronglyTypedResponse;
  }

  Future<ScheduleResponse> setProviderTimeblock(
      int providerId, DateTime blockStart, DateTime blockEnd) async {
    //Connect to actual endpoint later
    print('"saving" timeslot with call to endpoint with following data:\n'
        'providerId: ${providerId}\n'
        'startTimestamp: ${blockStart}\n'
        'endTimestamp: ${blockEnd}\n');

    String url = '${api.baseAPI}/roster/DET/20232024';
    //print('URL: $url');
    final response = await api.get(url);
    final stronglyTypedResponse =
        ScheduleResponse.fromJson(response.data as Map<String, dynamic>);
    return stronglyTypedResponse;
  }
}
