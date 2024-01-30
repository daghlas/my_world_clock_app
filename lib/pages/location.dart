import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build function run');
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: (){
          setState(() {
            counter ++;
          });
        }, child: Text('counter is $counter'),
      ),
    );
  }
}
