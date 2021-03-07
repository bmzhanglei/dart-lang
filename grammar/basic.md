## 更新 升级命令

$ brew update

$ brew upgrade dart

$ brew cleanup dart

Important concepts

1.一切皆对象，都从Object类继承.

2.尽管Dart是强类型的，但类型注释是可选的，因为Dart可以推断类型. 在上面的代码中， number被推断为int类型. 当您想明确地说不希望有任何类型时，请使用特殊类型dynamic .

3.Dart支持通用类型，例如List<int> （整数列表）或List<dynamic> （任何类型的对象列表）

4.Dart支持顶级功能（例如main() ）以及绑定到类或对象的功能（分别为静态 方法和实例方法 ）. 您也可以在函数内创建函数（ 嵌套 函数或局部函数 ）

5.Dart支持顶级变量 ，以及与类或对象绑定的变量（静态变量和实例变量）. 实例变量有时称为字段或属性

6.Dart没有关键字public ， protected和private . 如果标识符以下划线（_）开头

7.标识符可以以字母或下划线（_）开头，然后是这些字符加数字的任意组合

8.Dart同时具有表达式 （具有运行时值）和语句 （没有）

9.Dart工具可以报告两种问题： 警告和错误 


## 常量
const值不变 一开始就得赋值

const PI=3.14159;

final 可以开始不赋值 只能赋一次 ; 而final不仅有const的编译时常量的特性，最重要的它是运行时常量，并且final是惰性初始化，即在运行时第一次使用前才初始化

final a=new DateTime.now();

区别：final 可以开始不赋值 只能赋一次 ; 而final不仅有const的编译时常量的特性，最重要的它是运行时常量，并且final是惰性初始化，即在运行时第一次使用前才初始化

## 数据类型
umbers（数值）:

          int

          double

      方法：int.parse('')

            double.parse('1.1') 

      Strings（字符串）

          String

          str.startsWith('g');  //

          str.endsWith('g');

     Enumerated

         enum Color { red, green, blue }

         List<Color> colors = Color.values;

      Booleans(布尔)

          bool

      List（数组）

          在Dart中，数组是列表对象，所以大多数人只是称它们为列表

      Maps（字典）

          通常来说，Map 是一个键值对相关的对象。 键和值可以是任何类型的对象。每个 键 只出现一次， 而一个值则可以出现多次

  //第一种定义 Maps的方式

    var person={

      "name":"张三",

      "age":20,

      "work":["程序员","送外卖"]

    };

 //第二种定义 Maps的方式

    var p=new Map();

    p["name"]="李四";

    p["age"]=22;

    p["work"]=["程序员","送外卖"];

    print(p);

    print(p["age"]);

类型判断

 is 关键词来判断类型

 // str is String

String oneAsString = 1.toString();

String piAsString = 3.14159.toStringAsFixed(2);

//多行字符串

var s1 = '''

You can create

multi-line strings like this one.

''';

$的使用

var n ='gg';

//var b = 'gg$n''o';

var b = 'gg${n.toUpperCase()}o';

print(b);

字符串前添加r来创建"原始"字符串

var s = r'In a raw string, not even \n gets special treatment.';

## 运算符、条件判断
1. Dart运算符：
    算术运算符
      +    -    *    /     ~/ (取整)     %（取余）     

    关系运算符
      ==    ！=   >    <    >=    <=

    逻辑运算符
        !  &&   ||

    赋值运算符
     基础赋值运算符   =   ??=

     b??=23;  表示如果b为空的话把 23赋值给b

     复合赋值运算符   +=  -=  *=   /=   %=  ~/=

    条件表达式 
        if  else   switch case 

        三目运算符

        ??运算符：

     var a;

     var b= a ?? 10;

     print(b);   //10

     ...     散布运算符 

     ...?   空感知的散布运算符

     var list;

     var list2 = [0, ...?list];

2. 类型转换

    1、Number与String类型之间的转换    

     // Number类型转换成String类型 toString()

      // String类型转成Number类型  int.parse()

    2、其他类型转换成Booleans类型

      //str.isEmpty

      var myNum=0/0;        

        // print(myNum);

        if(myNum.isNaN){

          print('NaN');

        }

3.  可以定义常量，这些常量使用类型检查和强制类型转换 （ is和as ）， if的集合和collection以及价差运算符 （ ...和...? ）

const Object i = 3; 

const list = [i as int]; 

const map = {if (i is int) i: "int"}; 

const set = {if (list is List<int>) ...list};

var listOfInts = [1, 2, 3];

var listOfStrings = [
  '#0',
  for (var i in listOfInts) '#$i'
];

print(listOfStrings[1] == '#1');