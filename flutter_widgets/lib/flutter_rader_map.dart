import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

class Flutter_Radar_Map extends StatefulWidget {
  @override
  _Flutter_Radar_MapState createState() => _Flutter_Radar_MapState();
}

class _Flutter_Radar_MapState extends State<Flutter_Radar_Map> {

  double sideWith = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("flutter_radar_map")),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        child: _fiveCharts(context, sideWith),
      ),
    );
  }

  Widget _fiveCharts(BuildContext context,double sideWith) {
    double offsetLeft = MediaQuery.of(context).size.width/2;
    double offsetTop = sideWith + 30.0;
    return Container(
        child: Stack(
          children: <Widget>[
            CustomPaint(size: Size(MediaQuery.of(context).size.width, sideWith * 2 + 50), painter: MyPainter(offsetLeft,sideWith)),
            Positioned(
                top:10.0,
                left:MediaQuery.of(context).size.width/2 - 35,
                child: Container(
                  width: 30,
                  height: sideWith + 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('100'),
                      Text('80'),
                      Text('60'),
                      Text('40'),
                      Text('20'),
                      Text('0'),
                    ],
                  ),
                )
            ),
            Positioned(
                top: offsetTop - sideWith * sin(1 / 10 * pi) -10,
                left: offsetLeft + sideWith * cos(1 / 10 * pi) + 5,
                child: Text(
                  '购买力 50',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
            ),
            Positioned(
                top: offsetTop - sideWith -30,
                left: offsetLeft - 25,
                child: Text(
                  '活跃度60',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
            ),
            Positioned(
                top: offsetTop - sideWith * sin(1 / 10 * pi) -10,
                left: offsetLeft - sideWith * cos(1 / 10 * pi) -50,
                child: Text(
                  '行为 55',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
            ),
            Positioned(
                top: offsetTop + sideWith * cos(1 / 5 * pi),
                left: offsetLeft - sideWith * sin(1 / 5 * pi) - 50,
                child: Text(
                  '身份 85',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
            ),
            Positioned(
                top: offsetTop + sideWith * cos(1 / 5 * pi),
                left: offsetLeft + sideWith * sin(1 / 5 * pi),
                child: Text(
                  '忠诚度 35',
                  style: TextStyle(
                      fontSize: 12
                  ),
                )
            )
          ],
        )
    );
  }
}

class MyPainter extends CustomPainter {
  final double sideWith;
  final double offsetLeft;

  MyPainter(this.offsetLeft,this.sideWith);

  int angle = 72;
  Paint _paint = Paint()
    ..color = Colors.black12
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..strokeWidth = 1.0;

  Paint _paintMain = Paint()
    ..color = Colors.blue
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    double offsetTop = sideWith + 30.0;
    List<Offset> points = new List();
    Offset p1 = Offset(offsetLeft + sideWith * cos(1 / 10 * pi),
        offsetTop - sideWith * sin(1 / 10 * pi));
    Offset p2 = Offset(offsetLeft + 0, offsetTop - sideWith);
    Offset p3 = Offset(offsetLeft - sideWith * cos(1 / 10 * pi),
        offsetTop - sideWith * sin(1 / 10 * pi));
    Offset p4 = Offset(offsetLeft - sideWith * sin(1 / 5 * pi),
        offsetTop + sideWith * cos(1 / 5 * pi));
    Offset p5 = Offset(offsetLeft + sideWith * sin(1 / 5 * pi),
        offsetTop + sideWith * cos(1 / 5 * pi));

    // 外部Line
    Offset p0 = Offset(offsetLeft, offsetTop);
    points..add(p1)..add(p2)..add(p3)..add(p4)..add(p5)..add(p1);

    canvas.drawPoints(PointMode.polygon, points, _paint);

    canvas.drawLine(p0, p1, _paint);
    canvas.drawLine(p0, p2, _paint);
    canvas.drawLine(p0, p3, _paint);
    canvas.drawLine(p0, p4, _paint);
    canvas.drawLine(p0, p5, _paint);

    //内部Line
    for(int i = 1; i < 5; i ++) {
      List<Offset> insidePoints = List();
      double currentWith = sideWith / 5 * i;
      Offset inP1 = Offset(offsetLeft + currentWith * cos(1 / 10 * pi), offsetTop - currentWith * sin(1 / 10 * pi));
      Offset inP2 = Offset(offsetLeft + 0, offsetTop - currentWith);
      Offset inP3 = Offset(offsetLeft - currentWith * cos(1 / 10 * pi),
        offsetTop - currentWith * sin(1 / 10 * pi));
      Offset inP4 = Offset(offsetLeft - currentWith * sin(1 / 5 * pi),
          offsetTop + currentWith * cos(1 / 5 * pi));
      Offset inP5 = Offset(offsetLeft + currentWith * sin(1 / 5 * pi),
          offsetTop + currentWith * cos(1 / 5 * pi));
      insidePoints
        ..add(inP1)
        ..add(inP2)
        ..add(inP3)
        ..add(inP4)
        ..add(inP5)
        ..add(inP1);

        canvas.drawPoints(PointMode.polygon, insidePoints, _paint);
    }

    List<Offset> minPoints = List();
    double perWidth = sideWith / 5;
    Offset dataP1 = Offset(offsetLeft + perWidth * 2.8 * cos(1 / 10 * pi),
        offsetTop - perWidth * 2.8 * sin(1 / 10 * pi));
    Offset dataP2 = Offset(offsetLeft + 0, offsetTop - perWidth * 3);
    Offset dataP3 = Offset(offsetLeft - perWidth * 3.6 * cos(1 / 10 * pi),
        offsetTop - perWidth * 3.6 * sin(1 / 10 * pi));
    Offset dataP4 = Offset(offsetLeft - perWidth * 4.2 * sin(1 / 5 * pi),
        offsetTop + perWidth * 4.2 * cos(1 / 5 * pi));
    Offset dataP5 = Offset(offsetLeft + perWidth * 1.5 * sin(1 / 5 * pi),
        offsetTop + perWidth * 1.5 * cos(1 / 5 * pi));

    minPoints
      ..add(dataP1)
      ..add(dataP2)
      ..add(dataP3)
      ..add(dataP4)
      ..add(dataP5)
      ..add(dataP1);

    canvas.drawPoints(PointMode.polygon, minPoints, _paintMain);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }

}