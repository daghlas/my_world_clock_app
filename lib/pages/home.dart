import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;
    if (kDebugMode) {
      print(data);
    }

    //setting day/night bg
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? statusBarColor =
        data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: statusBarColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 160.0, 0.0, 0.0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time' : result['time'],
                      'location' : result['location'],
                      'isDaytime' : result['isDaytime'],
                      'flag' : result['flag'],
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                    color: Colors.blue[900]),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 68.0,
                  color: Colors.white,
                ),
              ),
              //const SizedBox(height: 20.0),
              //CircleAvatar(
              //  backgroundImage: AssetImage('assets/${data['flag']}'),
              //),
            ],
          ),
        ),
      )),
    );
  }
}
