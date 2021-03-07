## 面向对象编程(OOP)的三个基本特征是：封装、继承、多态      

      封装：封装是对象和类概念的主要特性。封装，把客观事物封装成抽象的类，并且把自己的部分属性和方法提供给其他对象调用, 而一部分属性和方法则隐藏。                

      继承：面向对象编程 (OOP) 语言的一个主要功能就是“继承”。继承是指这样一种能力：它可以使用现有类的功能，并在无需重新编写原来的类的情况下对这些功能进行扩展。            

      多态：允许将子类类型的指针赋值给父类类型的指针, 同一个函数调用会有不同的执行效果 。

Dart所有的东西都是对象，所有的对象都继承自Object类。

Dart是一门使用类和单继承的面向对象语言，所有的对象都是类的实例，并且所有的类都是Object的子类

一个类通常由属性和方法组成。

Dart是一门使用类和单继承的面向对象语言，所有的对象都是类的实例，并且所有的类都是Object的子类
```dart
class Person{
  String name;
  int age; 

  //默认构造函数的简写
  Person(this.name,this.age);
  Person.now(){
     print('我是命名构造函数');
  }

  Person.setInfo(String name,int age){
     this.name=name;
     this.age=age;
  }
  void printInfo(){   
    print("${this.name}----${this.age}");
  }
}

class Animal{
  String _name;   //私有属性
  int age; 
  //默认构造函数的简写
  Animal(this._name,this.age);
  void printInfo(){   
    print("${this._name}----${this.age}");
  }
  String getName(){ 
    return this._name;
  } 
  void _run(){
    print('这是一个私有方法');
  }
  execRun(){
    this._run();  //类里面方法的相互调用
  }
}

//把类单独抽成一个模块
import 'lib/Person.dart';
void main(){
    var d=new DateTime.now();   //实例化DateTime调用它的命名构造函数
     print(d);
      Person p1=new Person('张三', 20);   //默认实例化类的时候调用的是 默认构造函数
      Person p1=new Person.now();   //命名构造函数
      Person p1=new Person.setInfo('李四',30);
      p1.printInfo(); 
}
```
## getter和setter修饰符

```dart
class Rect{
  num height;
  num width; 
  Rect(this.height,this.width);
  get area{
    return this.height*this.width;
  }
  set areaHeight(value){
    this.height=value;
  }
}

void main(){
  Rect r=new Rect(10,4);
  // print("面积:${r.area()}"); 
  r.areaHeight=6;
  print(r.area); //24
}

//可以在构造函数体运行之前初始化实例变量
class Rect{
  int height;
  int width;
  Rect():height=2,width=10{
    print("${this.height}---${this.width}");
  }

  getArea(){
    return this.height*this.width;
  } 
}
```
## static静态成员、方法
1、使用static 关键字来实现类级别的变量和函数
2、静态方法不能访问非静态成员，非静态方法可以访问静态成员

```dart
class Person {
  static String name = '张三';
  int age=20;
  static void show() {
    print(name);
  }
  void printInfo(){  /*非静态方法可以访问静态成员以及非静态成员*/
      print(name);  //访问静态属性
      print(this.age);  //访问非静态属性
      show();   //调用静态方法
  }

  static void printUserInfo(){//静态方法
       print(name);   //静态属性
        show();        //静态方法
        //print(this.age);     //静态方法没法访问非静态的属性
        // this.printInfo();   //静态方法没法访问非静态的方法
        // printInfo();
  }
}
```
## 对象操作符

Dart中的对象操作符:

    ?     条件运算符 （了解）

    as    类型转换

    is    类型判断

    ..    级联操作 （连缀）  (记住)
```dart
class Person {
  String name;
  num age;
  Person(this.name,this.age);
  void printInfo() {
    print("${this.name}---${this.age}");  
  }  
}

main(){ 
   Person p;
   p?.printInfo();
   p = new Person('张三', 20);
   if(p is Person){
        p.name="李四";
    } 
    p.printInfo();

    print(p is Object); //true

    (p as Person).printInfo()  //

  //级联操作

   p..name="王五"

     ..age=30
     ..printInfo();
}
```
## 继承 extends
 1、子类使用extends关键词来继承父类
 2、子类会继承父类里面可见的属性和方法 但是不会继承构造函数
 3、子类能复写父类的方法 getter和setter
```dart
class Person {
    String name;
    num age; 
    Person(this.name,this.age);
    Person.xxx(this.name,this.age);
    void printInfo() {
        print("${this.name}---${this.age}");  
  }
     work(){
         print("${this.name}在工作...");
      }
}
class Web extends Person{
     String sex;
    Web(String name, num age,String sex) : super.xxx(name, age){
         this.sex=sex;
  }
    run(){
        print("${this.name}---${this.age}--${this.sex}");  
        super.work();  //子类调用父类的方法
    }
    @override  //覆写父类的方法
    work(){
        print("${this.name}的工作是写代码");
    }  
}

main(){ 
  Web w=new Web('李四',20);
  // w.printInfo();
  w.run();
}
```