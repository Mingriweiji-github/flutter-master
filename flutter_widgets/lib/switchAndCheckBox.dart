

import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxState createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {
  bool _switchSeleted = true; // 单选开关状态
  bool _checkBoxSeleted = true; // 复选

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单选复选框"),),
      body: Container(

        padding: EdgeInsets.only(left: 150, top: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Switch(
              value: _switchSeleted,
              onChanged: (value){
                //重新构建页面
                setState(() {
                  _switchSeleted = value;
                });
              }),

          Checkbox(
              value: _checkBoxSeleted,
              onChanged: (value) {
                setState(() {
                  _checkBoxSeleted = value;
                });
              })
        ],
      ),
      )
    );
  }
}

