import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {
    data=data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgcolor=data['isDaytime'] ? 'day.png' :'night.png' ;
    print(data);
    return Scaffold(
     body: Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage('assets/$bgcolor'),
             fit: BoxFit.cover,
           )
         ),
         child: Padding(
           padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
           child: SafeArea(
               child: Column(
                 children: <Widget>[
                   FlatButton.icon(onPressed: ()  async {

                    dynamic result= await Navigator.pushNamed(context, "/location");
                    setState(() {
                    data= {
                      'time' : result['time'],
                      'location' :result['location'],
                      'isDaytime':result['isDaytime'],
                      'flag':result['flag'],

                    };
                    });

                    },
                   icon: Icon(Icons.edit_location,
                   color: Colors.white,), label: Text("Edit location",
                   style: TextStyle(color:Colors.white),)),
                   SizedBox(height: 20.0,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                       Text(data['location'],
                       style: TextStyle(
                         color: Colors.amberAccent,
                         letterSpacing: 2.0,
                         fontSize: 28.0,
                       ),),

                     ],
                   ),
                   SizedBox(height: 20.0,),
                   Text(data['time'],
                     style: TextStyle(
                       color: Colors.amberAccent,
                       letterSpacing: 2.0,
                       fontSize: 60.0,
                     ),)
                 ],

           )),
         ),
       ),
     );
  }
}
