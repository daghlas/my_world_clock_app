import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  int counter = 0;

  void getData(){
    Future.delayed(const Duration(seconds : 3), (){
      print('DAGHLAS');
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState function run');
  }

  @override
  Widget build(BuildContext context) {
    print('build function run');
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
