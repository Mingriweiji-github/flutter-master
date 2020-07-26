
import 'package:flutter/material.dart';

class DateAndTime extends StatefulWidget {
  @override
  _DateAndTimeState createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets示例"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: new Column(
          children: <Widget>[
            FlatButton(onPressed: () async {
              var result = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2022)
              );
              print("result:\(result)");
            },
                child: Text("日期选择器")
            ),

            FlatButton(onPressed: () async {
              var result = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
              );
              print("result:\(result)");
            },
               child: Text("时间选择器")
            )

          ],
        ),
      ),
    );
  }
}
