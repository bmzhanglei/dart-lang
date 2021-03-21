void main(List<String> arguments) {
  // const Object i = 8;

  // var list = [i as int, 4, 54];
  // // const map = {if (i is int) i: "int"};
  // List list2 = [6, 7, 0];
  // // list.insertAll(1, list2);
  // // var l2 = list.where((i) => i % 2 == 1);

  // var s = list2.toSet();
  // list2.asMap().forEach((key, item) => {print(key), item = item + 2});
  // List.generate(list2.length, (index) => {
  //   return _renderItem(index)
  // });

  // var flybyObjects = ['木星', '土星', '天王星', '海王星'];
  // flybyObjects.where((name) => name.contains('土星')).toSet().forEach(print);

  // final xx;
  // // const x;
  // // x = "xxx";
  // var a = 1;
  // if (a == 1) {
  //   xx = "pp";
  // } else {
  //   if (a >= 0) {
  //     xx = "ff";
  //   }
  // }
  // dynamic aa;

  // xx = "pp";
  // double d = 1;

  // print(xx);
  // List b = [];
  // a.forEach((key, value) => {b.add(key)});
  // var constantSet = {
  //   'fluorine',
  //   'chlorine',
  //   'bromine',
  //   'iodine',
  //   'astatine',
  // };
  // constantSet.add("xx");
  // // var l;
  // var val = {"e", ...constantSet};
  // // var val = constantSet.reduce((value, element) => value + element);
  // print(val);
  // var list = ["😆", "🇩🇰"];
  // var list2 = [0, ...list];

  // var chars = "Ilike 🇩🇰";
  // var l = chars.split("");

  // // print(chars.substring(1, 2));
  // // var v = chars.codeUnitAt(chars.length - 1);
  // var v = chars.lastIndexOf("e");

  // print(v);
  // print(chars.substring(chars.length - 4, chars.length));
  // var add = make(8);

  // print(add(3));
  // print('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  // print(2 is int);
  // print("s" is String);
  // print({'a': 1} is! Map);

  // var a = {"a": 1};
  // var b;
  // b ??= a;
  // b['a'] = 9;
  // var collection = [1, 2, 3];
  // for (var x in collection) {
  //   print(x); // 1 2 3
  // }

  // throw FormatException("tttt");
  // var a = {'a': 1};
  // var b = a;
  // print(identical(a, b));
  // print(3);

  var emp = new Employee({'a': 2});

  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  emp.firstName = 'Bob';
  print(emp.firstName);
}

class Person {
  String firstName = "";

  Person.fromJson(Map data) {
    print('in Person' + data['a'].toString());
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Map data = {};
  // Employee(this.data);
}
