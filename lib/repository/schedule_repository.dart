import 'package:flutter_api_starter/models/henry_api/schedule_response.dart';
import 'package:flutter_api_starter/network/api_service.dart';

class ScheduleRepository {
  ScheduleRepository({required this.api});

  ApiService api;

  Future<ScheduleResponse> getSchedule() async {
    //Connect to actual endpoint later
    String url = '${api.baseAPI}/roster/DET/20232024';
    print('URL: $url');
    final response = await api.get(url);
    final stronglyTypedResponse =
        ScheduleResponse.fromJson(response.data as Map<String, dynamic>);
    return stronglyTypedResponse;
  }
}
