import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag
  late String url; //location url for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  void getTime() async {

    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);
    // print(data);

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(dateTime);
    // print(offset);

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    // set time property
    time = now.toString();

  }

}

WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.pgn', url: 'Europe/Berlin');