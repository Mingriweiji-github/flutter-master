
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_radar_chart.dart';
import 'package:flutter_widgets/flutter_rader_map.dart';
import 'package:flutter_widgets/flutter_spider_view.dart';
import 'package:flutter_widgets/switchAndCheckBox.dart';
import 'mp_chart/MPChartRadar.dart';

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
        width: double.infinity,
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

//            TextField(
//              autofocus: true, //自动对焦
//              decoration: InputDecoration(
//                labelText: "用户名",
//                hintText: "请填写用户名",
//                prefixIcon: Icon(Icons.person)
//              ),
//              controller: _nameController,
//            ),
//
//            TextField(
//              obscureText: true, //加密模式
//              decoration: InputDecoration(
//                labelText: "密码",
//                hintText: "请输入密码",
//                prefixIcon: Icon(Icons.lock)
//              ),
//            ),
  
            FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return flutter_radar_chart();
                      }));

            }, child: Text("flutter_radar_chart")
            ),


//            FlatButton(onPressed: () {
//
//              Navigator.push(context,
//                MaterialPageRoute(builder: (context) {
//                  return MPChartRadar();
//                })
//              );
//            },child: Text("MPChartRadar"),),
//              InkWell(
//                onTap: () {
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) {
//                        return MPChartRadar();
//                      })
//                    );
//                  },
//                child: Text(
//                  "Redar Chart",
//                  textDirection: TextDirection.ltr,
//                  textAlign: TextAlign.center,
//                ),
//            ),

            FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return Flutter_Radar_Map();
                  })
                );
              },
              child: Text("Flutter_Radar_Map"),
            ),

            FlatButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return FlutterSpiderView();
                  })
                );
              },
              child: Text("FlutterSpiderView"),
            ),

            FlatButton(
              onPressed: () {
                showConfirmDialog();
//                showDialogWithAnimation();
              },
              child: Text("AlertDialog"),
            ),



          ],
        ),
      ),
    );
  }

  ///弹出对话窗
  Future<bool> showConfirmDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("说明"),
          titleTextStyle: TextStyle(fontSize: 16, color: Colors.grey), // 666666
          content: Text("1实现代码很简单，不在赘述。\n2唯一需要注意的是我们是通过Navigator.of(context).pop(…)方法来关闭对话框的\n3这和路由返回的方式是一致的，并且都可以返回一个结果数据。现在，对话框我们已经构建好了，那么如何将它弹出来呢？\n4还有对话框返回的数据应如何被接收呢？这些问题的答案都在showDialog()方法中。"),
          contentTextStyle: TextStyle(fontSize: 12, color: Colors.grey), // 666666
          actions: <Widget>[
            Container(
              child: FlatButton(
                child: Text("确定", style: TextStyle(fontSize: 16, color: Colors.blue)),
                onPressed: () => Navigator.of(context).pop(), // 关闭对话框
              ),
            )
          ],
        );
      },
    );
  }

  void showDialogWithAnimation() {
    _showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          titleTextStyle: TextStyle(fontSize: 16, color: Colors.grey),
          content: Text("1实现代码很简单，不在赘述。\n2唯一需要注意的是我们是通过Navigator.of(context).pop(…)方法来关闭对话框的\n3这和路由返回的方式是一致的，并且都可以返回一个结果数据。现在，对话框我们已经构建好了，那么如何将它弹出来呢？\n4还有对话框返回的数据应如何被接收呢？这些问题的答案都在showDialog()方法中。"),
          contentTextStyle: TextStyle(fontSize: 12, color: Colors.grey), // 666666// 666666
          actions: <Widget>[
            FlatButton(
              child: Text("确定"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
  Future<T> _showCustomDialog<T>({
    @required BuildContext context,
    bool barrierDismissible = true,
    WidgetBuilder builder,
  }) {
    final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final Widget pageChild = Builder(builder: builder);
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54, // 自定义遮罩颜色
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // 使用缩放动画
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
