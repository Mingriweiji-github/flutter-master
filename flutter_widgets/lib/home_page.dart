
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_radar_chart.dart';
import 'package:flutter_widgets/switchAndCheckBox.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _nameController = TextEditingController();
  @override
  void initState() {

    super.initState();
    _nameController.addListener(() {
      print(_nameController.text);
    });

  }
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
                  lastDate: DateTime(2022),
                  selectableDayPredicate: (DateTime day) {
                    return day.difference(DateTime.now()).inDays < 2;
                  },
//                locale: Locale('zh'), // 如果MaterialApp入口处声明了local这里就不需要了
//                helpText: "2020年的夏天",
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
            ),

            FlatButton(onPressed: () {
              // 导航到新路由
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return SwitchAndCheckBox();
                  }));
            },
                child: Container(
                  child: new Text("单选复选"),
                )
            ),

            TextField(
              autofocus: true, //自动对焦
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请填写用户名",
                prefixIcon: Icon(Icons.person)
              ),
              controller: _nameController,
            ),

            TextField(
              obscureText: true, //加密模式
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock)
              ),
            ),
  
            FlatButton(onPressed: () {

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return flutter_radar_chart();
                  }));

            }, child: Text("flutter_radar_chart")),

          ],
        ),
      ),
    );
  }
}
