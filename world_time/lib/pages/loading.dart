import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Singapore', flag: 'singapore.png', url: 'Asia/Singapore');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'url': instance.url,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  void initState() {
    // TODO: implement initStatec
    super.initState();
    setupWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}

