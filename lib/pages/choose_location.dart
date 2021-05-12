import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class Chooseful extends StatefulWidget {
  @override
  _ChoosefulState createState() => _ChoosefulState();
}

class _ChoosefulState extends State<Chooseful> {
  List<Worldtime> locations = [
    Worldtime( 'Europe/London',  'London',  'uk.png'),
    Worldtime( 'Europe/Berlin',  'Athens',  'greece.png'),
    Worldtime( 'Africa/Cairo',  'Cairo',  'egypt.png'),
    Worldtime( 'Africa/Nairobi',  'Nairobi',  'kenya.png'),
    Worldtime( 'America/Chicago',  'Chicago',  'usa.png'),
    Worldtime( 'America/New_York',  'New York',  'usa.png'),
    Worldtime( 'Asia/Seoul',  'Seoul',  'south_korea.png'),
    Worldtime( 'Asia/Jakarta',  'Jakarta',  'indonesia.png'),
  ];
  void updatetime(index) async{
    Worldtime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Choose location "),
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
            return Card(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: ListTile(
                  onTap:(){
                    updatetime(index);

                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}',

                  ),
                  ),
                ),
              ),
            );
        },

         ),
    );
  }
}
