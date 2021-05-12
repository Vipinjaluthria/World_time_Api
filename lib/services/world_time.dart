import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class Worldtime {
    String url;
    String time;

    Worldtime(this.url, this.location, this.flag);
    bool isDaytime;
    String location;
    String flag;

  Future<void> getTime()  async
  {
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String datatime = data['utc_datetime'];
      String Offset = data['utc_offset'].substring(0, 3);
      //print(datatime);
      print(Offset);
      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(Offset)));
      isDaytime=now.hour>6 && now.hour<20 ?true:false;
      time =DateFormat.jm().format(now);
    }
    catch(e)
    {
      time="could not get time data";
      print("error $e");
    }
  }
}