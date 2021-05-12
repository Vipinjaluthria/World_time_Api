import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetupWorldTime  () async
  {
      Worldtime instance=Worldtime("Europe/Berlin","Berlin","germany.png");
      await instance.getTime();
      Navigator.pushReplacementNamed(context,"/home",arguments: {
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
        'isDaytime':instance.isDaytime,

      });
     // print(instance.time);
  }
  @override
  void initState() {
    SetupWorldTime();
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitSpinningCircle(
          color: Colors.amberAccent,
          size: 50.0,
        ),
      ),
    );
  }
}
