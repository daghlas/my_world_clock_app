import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {

  int counter = 0;

  void getData() async {
    //first name
    String firstName = await Future.delayed(const Duration(seconds : 3), (){
      return 'DAGHLAS';
    });
    //last name
    String lastName = await Future.delayed(const Duration(seconds : 2), (){
      return 'KENYATTA';
    });
    //second name
    String secondName = 'KAIRE';

    //OUTPUT
    print('$firstName $secondName $lastName');

  }

  @override
  void initState() {
    super.initState();
    getData();
    //whatever is in here will continue running regardless of what goes on in
    //the async getData(); method above. The print output below is not affected
    //and will run when the screen loads
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
