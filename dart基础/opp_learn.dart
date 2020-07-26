
class Logger {
  static Logger _cache;
  factory Logger() {
    if (_cache == null) {
      _cache = Logger()._internal();
    }
    return _cache;
  }
  Logger _internal() {}
  void log(String msg) {
    print(msg);
  }
}

class Student extends Person {
  String _school;//通过下划线标记私有变量
  String city;
  String name;
  String country;
  //构造方法：
  // 通过this._school初始化自有的参数
  // name和age给父类来初始化
  // city为可选参数
  // country为默认参数
  Student(this._school,String name, String age,
      {this.city, this.country = "China"})
      :
        name = "$country.$name",
        super(name, age);


  // 命名构造方法
  Student.cover(Student stu) : super(stu.name, stu.age){
    print("这是明明构造方法的方法体");
  }


}
class Person {
  String name;
  String age;
  ///标准构造方法
  Person(this.name,this.age);
  @override
  String toString() {
    // TODO: implement toString
    return "name:$name,age:$age";
  }
}