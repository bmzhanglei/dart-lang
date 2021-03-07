 ## 内置方法/函数：

      print();

  自定义方法：

      自定义方法的基本格式：

      返回类型  方法名称（参数1，参数2,...）{

        方法体

        return 返回值;

      }

## 定义一个带可选参数的方法

   String printUserInfo(String username,[String sex='男',int age]){  //行参

      if(age!=null){

        return "姓名:$username---性别:$sex--年龄:$age";

      }

      return "姓名:$username---性别:$sex--年龄保密";

    }

  print(printUserInfo('张三'));

  print(printUserInfo('小李','女'));

   print(printUserInfo('小李','女',30));

## 定义一个命名参数的方法

  String printUserInfo(String username,{int age,String sex='男'}){  //行参
      if(age!=null){
        return "姓名:$username---性别:$sex--年龄:$age";
      }
      return "姓名:$username---性别:$sex--年龄保密";
  }
  print(printUserInfo('张三',age:55));

## 箭头函数

List list=[4,1,2,3,4];

var newList=list.map((value)=>value>3?value*2:value);

print(newList.toList());

匿名方法

 var func1 = (str) {

       print("Hello-------$str");

  };

自执行方法

 ((int n){

      print(n);

      print('我是自执行方法'+n);

    })(12);

方法的递归

//常量构造函数 

class ImmutablePoint {

  static final ImmutablePoint origin =

      const ImmutablePoint(0, 0);

       final num x, y;

       const ImmutablePoint(this.x, this.y);

}

var a = const ImmutablePoint(1, 1);

var b = const ImmutablePoint(1, 1);

identical(a, b)  //true

可以省略除首次使用const关键字外的所有内容

const pointAndLine = {

  'point': [ImmutablePoint(0, 0)],

  'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],

};

//runtimeType 返回对象类型

'a'.runtimeType;  // String

//工厂构造函数

class Logger {

  final String name;

  bool mute = false;

  // _cache is library-private, thanks to

  // the _ in front of its name.

  static final Map<String, Logger> _cache =

      <String, Logger>{};

  factory Logger(String name) {

    return _cache.putIfAbsent(

        name, () => Logger._internal(name));

  }

  Logger._internal(this.name);

  void log(String msg) {

    if (!mute) print(msg);

  }

}

var logger = Logger('UI');

logger.log('Button clicked');

## 闭包：

    1、全局变量特点:    全局变量常驻内存、全局变量污染全局

    2、局部变量的特点：  不常驻内存会被垃圾机制回收、不会污染全局  

  /*  想实现的功能：

        1.常驻内存        

        2.不污染全局   

          产生了闭包,闭包可以解决这个问题.....  

          闭包: 函数嵌套函数, 内部函数会调用外部函数的变量或参数, 变量或参数不会被系统回收(不会释放内存)

	        闭包的写法： 函数嵌套函数，并return 里面的函数，这样就形成了闭包。
    */ 

	fn(){
        var a=123;  /*不会污染全局   常驻内存*/

        return(){			

          a++;			

          print(a);

        };        

      }     

      var b=fn();	

      b();

      b();

      b();