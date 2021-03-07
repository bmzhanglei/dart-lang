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
 1. 子类使用extends关键词来继承父类
 2. 子类会继承父类里面可见的属性和方法 但是不会继承构造函数
 3. 子类能复写父类的方法 getter和setter
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

## 抽象类、多态、接口
Dart中抽象类: Dart抽象类主要用于定义标准，子类可以继承抽象类，也可以实现抽象类接口。

  1. 抽象类通过abstract 关键字来定义

  2. Dart中的抽象方法不能用abstract声明，Dart中没有方法体的方法我们称为抽象方法。

  3. 如果子类继承抽象类必须得实现里面的抽象方法

  4. 如果把抽象类当做接口实现的话必须得实现抽象类里面定义的所有属性和方法。

  5. 抽象类不能被实例化，只有继承它的子类可以

extends抽象类 和 implements的区别：

  1. 如果要复用抽象类里面的方法，并且要用抽象方法约束自类的话我们就用extends继承抽象类

  2. 如果只是把抽象类当做标准的话我们就用implements实现抽象类

### abstract

```dart 
abstract class Animal{
  eat();   //抽象方法
  run();  //抽象方法  
  printInfo(){
    print('我是一个抽象类里面的普通方法');
  }
}

class Dog extends Animal{
  @override
  eat() {
     print('小狗在吃骨头');
  }
  @override
  run() {
    // TODO: implement run
    print('小狗在跑');
  }  
}

class Cat extends Animal{
  @override
  eat() {
    // TODO: implement eat
    print('小猫在吃老鼠');
  }

  @override
  run() {
    // TODO: implement run
    print('小猫在跑');
  }
}

main(){
  Dog d=new Dog();
  d.eat();
  d.printInfo();
   Cat c=new Cat();
  c.eat();
  c.printInfo();
  // Animal a=new Animal();   //抽象类没法直接被实例化
}
```

### 多态
  允许将子类类型的指针赋值给父类类型的指针, 同一个函数调用会有不同的执行效果 。
  子类的实例赋值给父类的引用。
  多态就是父类定义一个方法不去实现，让继承他的子类去实现，每个子类有不同的表现。

```dart
abstract class Animal{
  eat();   //抽象方法 
}

class Dog extends Animal{
  @override
  eat() {
     print('小狗在吃骨头');
  }
  run(){
    print('run');
  }
}

class Cat extends Animal{
  @override
  eat() {   
    print('小猫在吃老鼠');
  }

  run(){
    print('run');
  }
}
main(){
  // Dog d=new Dog();
  // d.eat();
  // d.run();
  // Cat c=new Cat();
  // c.eat();

  Animal d=new Dog();
  d.eat();
  Animal c=new Cat();
  c.eat();
}
```

### 接口
  和Java一样，dart也有接口，但是和Java还是有区别的。
  首先，dart的接口没有interface关键字定义接口，而是普通类或抽象类都可以作为接口被实现。
  同样使用implements关键字进行实现。
  但是dart的接口有点奇怪，如果实现的类是普通类，会将普通类和抽象中的属性的方法全部需要覆写一遍。
  而因为抽象类可以定义抽象方法，普通类不可以，所以一般如果要实现像Java接口那样的方式，一般会使用抽象类。
  建议使用抽象类定义接口。

```dart
/*
定义一个DB库 支持 mysql  mssql  mongodb
mysql  mssql  mongodb三个类里面都有同样的方法
*/

abstract class Db{   //当做接口   接口：就是约定 、规范
    String uri;      //数据库的链接地址
    add(String data);
    save();
    delete();
}

class Mysql implements Db{
  @override
  String uri;
  Mysql(this.uri);

  @override
  add(data) {
    // TODO: implement add
    print('这是mysql的add方法'+data);
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }

  remove(){

  }

}

class MsSql implements Db{
  @override
  String uri;

  @override
  add(String data) {
    print('这是mssql的add方法'+data);
  }

  @override
  delete() {
    // TODO: implement delete
    return null;
  }

  @override
  save() {
    // TODO: implement save
    return null;
  }
}

//文件分离

// import 'lib/Mysql.dart';

import 'lib/MsSql.dart';

main() {
  // Mysql mysql=new Mysql('xxxxxx');
  // mysql.add('1243214');
  MsSql mssql=new MsSql();
  mssql.uri='127.0.0.1';
  mssql.add('增加的数据');
} 
```
### 实现多个接口
```dart
/*
Dart中一个类实现多个接口：
*/
abstract class A{
  String name;
  printA();
}
abstract class B{
  printB();
}

class C implements A,B{  
  @override
  String name;  

  @override
  printA() {
    print('printA');
  }

  @override
  printB() {
    // TODO: implement printB
    return null;
  }
}

void main(){
  C c=new C();
  c.printA();
}
```
## Mixins

```dart
/*
mixins的中文意思是混入，就是在类中混入其他功能。
在Dart中可以使用mixins实现类似多继承的功能
因为mixins使用的条件，随着Dart版本一直在变，这里讲的是Dart2.x中使用mixins的条件：
  1、作为mixins的类只能继承自Object，不能继承其他类
  2、作为mixins的类不能有构造函数
  3、一个类可以mixins多个mixins类
  4、mixins绝不是继承，也不是接口，而是一种全新的特性
*/

class Person{
  String name;
  num age;
  Person(this.name,this.age);
  printInfo(){
    print('${this.name}----${this.age}');
  }
  void run(){
    print("Person Run");
  }
}

class A {
  String info="this is A";
  void printA(){
    print("A");
  }

  void run(){
    print("A Run");
  }
}

class B {    
  void printB(){
    print("B");
  }

  void run(){
    print("B Run");
  }
}

class C extends Person with B,A{
  C(String name, num age) : super(name, age);  
}

void main(){  
  var c=new C('张三',20);  
  c.printInfo();
  c.printB();
  print(c.info);
   c.run();
}
```

### Mixins的类型
extends -> mixins -> implements

mixins的实例类型是什么？

很简单，mixins的类型就是其超类的子类型。

```dart
  print(c is C);    //true
  print(c is A);    //true
  print(c is B);   //true
```

## Callable classes
为了允许像函数一样调用Dart类的实例，使用call()方法
```dart
class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

main() {
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
}
```