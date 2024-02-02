import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag
  late String url; //location url for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {

    try{
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      time = now.toString();
    }
    catch (error) {
      if (kDebugMode) {
        print('caught error: $error');
      }
      time = 'could not get time data';
    }

  }

}