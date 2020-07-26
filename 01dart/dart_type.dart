import 'package:flutter/material.dart';

/// 常用数据类型
class DartType extends StatefulWidget {
  @override
  _DartTypeState createState() => _DartTypeState();
}

class _DartTypeState extends State<DartType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _StringType();
    _boolType();
    _ListType();
    _mapType();
    return Container(child: Text("常用数据类型"),);
  }

  ///数字类型
  void _numType() {
    num num1 = -1.0;
    num num2 = 2;
    int num3 = 3;
    double d1 = 1.68;
    print("num:$num1, num2: $num2, int: $num3, double: $d1");
    print("绝对值：${num1.abs()}");//转绝对值
    print("转Int: ${num1.toInt()}");//转Int
    print("转Double: ${num1.toDouble()}");
  }

  ///字符串类型
  void _StringType() {
    String str1 = "string1", str2 = "string2";
    String str3 = "$str1 and $str2";
    String str4 = str1 + " and " + str2;
    print("str3:$str3");
    print("str4:$str4");
    String str5 = "Dart is a new laguange";
    print("str5 subString:${str5.substring(0,4)}");
    print("str5 has dart in:${str5.indexOf("new")}");
  }

  void _boolType() {
    bool success = true, fail = false;
    print("succss is ${success}");
    print("fail is ${false}");
    print(success || false);
    print(success && false);
  }

  void _ListType() {
    print("-----ListType----");
    /// 初始化集合List
    List list = [1, 2, 3, "List"];
    print(list);
    List<int> intList = [4, 5, 6];
    print(intList);
    intList.add(7);
    intList.add(8);
    intList.add(9);
    print(intList);
    ///list.addAll()
    List list3 = [];
    list3.addAll(list);
    list3.addAll(intList);
    print(list3);
    /// generate
    List l4 = List.generate(3, (index) => index * 2);
    print(l4);
    ///List遍历方法
//    for (int i=0; i < l4.length; i ++ ) {
//      print(i); // 0 1 2
//    }
//    for (var value in l4) {
//      print(value); // 0 2 4
//    }
//    l4.forEach((val) {
//        print(val); // 0 2 4
//    });
//    l4.removeLast();
//    print(l4);
//    l4.insert(0, 88);
//    print(l4);
//    l4.sublist(0, 1);
//    print(l4);
//
//    print(l4.indexOf(88));
  }

  void _mapType() {
    print("------Map Type-----");
    Map map = {"name": "jack", "age": 10, "sex": "man"};
    print(map);
    map["gf"] = "Rose";
    print(map);
    /// forEach遍历得到key & value
    map.forEach((key, value) {
      print("key:$key, value:$value");
    });
    ///新的map
    Map newMap = map.map((k, v) {
      return MapEntry(v, k);
    });
    print(newMap);

    ///for遍历 得到key
    for(var key in map.keys) {
      print(key);
    }
    ///for遍历 得到value
    for(var value in map.values) {
      print(value);
    }
    print(map.containsKey("gf"));
    print(map.containsValue("Rose"));
  }

}
