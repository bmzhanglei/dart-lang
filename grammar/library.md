## Dart中的库
/*

前面介绍Dart基础知识的时候基本上都是在一个文件里面编写Dart代码的，但实际开发中不可能这么写，模块化很重要，所以这就需要使用到库的概念。

在Dart中，库的使用时通过import关键字引入的。

library指令可以创建一个库，每个Dart文件都是一个库，即使没有使用library指令来指定。

Dart中的库主要有三种：

1. 我们自定义的库     

          import 'lib/xxx.dart';

2. 系统内置库       

          import 'dart:math';    

          import 'dart:io'; 

          import 'dart:convert';

3. Pub包管理系统中的库  

    https://pub.dev/packages

    https://pub.flutter-io.cn/packages

    https://pub.dartlang.org/flutter/

1. 需要在自己想项目根目录新建一个pubspec.yaml（鸭毛）

2. 在pubspec.yaml文件 然后配置名称 、描述、依赖等信息

3. 然后运行 pub get 获取包下载到本地  

4. 项目中引入库 import 'package:http/http.dart' as http; 看文档使用

*/

## 导入自己本地库

```dart
//Animal.dart 文件
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

// main.dart文件
import 'lib/Animal.dart';
main(){
  var a=new Animal('小黑狗', 20);
  print(a.getName());
}
```

## 导入系统内置库
```dart
import "dart:math";
import 'dart:io';
import 'dart:convert';

void main() async{
  var result = await getDataFromZhihuAPI();
  print(result);
}

main(){
    print(min(12,23));
    print(max(12,25));
}

//api接口： http://news-at.zhihu.com/api/3/stories/latest

getDataFromZhihuAPI() async{
  //1、创建HttpClient对象
  var httpClient = new HttpClient();  
  //2、创建Uri对象
  var uri = new Uri.http('news-at.zhihu.com','/api/3/stories/latest');
  //3、发起请求，等待请求
  var request = await httpClient.getUrl(uri);
  //4、关闭请求，等待响应
  var response = await request.close();
  //5、解码响应的内容
  return await response.transform(utf8.decoder).join();
}
```

## 导入pub包管理系统中的库
pub包管理系统:
1、从下面网址找到要用的库
        https://pub.dev/packages
        https://pub.flutter-io.cn/packages
        https://pub.dartlang.org/flutter/

2、创建一个pubspec.yaml文件，内容如下
    name: xxx
    description: A new flutter module project.
    dependencies:  
        http: ^0.12.0+2
        date_format: ^1.0.6
3、配置dependencies
4、运行pub get 获取远程库
5、看文档引入库使用

```dart

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
main() async {
  var url = "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=1";
    // Await the http get response, then decode the json-formatted responce.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
    print(formatDate(DateTime.now(), [yyyy, '*', mm, '*', dd,'日']));
}
```

## Dart库的管理
1. 冲突解决
当引入两个库中有相同名称标识符的时候，如果是java通常我们通过写上完整的包名路径来指定使用的具体标识符，甚至不用import都可以，但是Dart里面是必须import的。当冲突的时候，可以使用as关键字来指定库的前缀。如下例子所示：

    import 'package:lib1/lib1.dart';
    import 'package:lib2/lib2.dart' as lib2;
    Element element1 = new Element();           // Uses Element from lib1.
    lib2.Element element2 = new lib2.Element(); // Uses Element from lib2.

2. 部分导入

  如果只需要导入库的一部分，有两种模式：
     模式一：只导入需要的部分，使用show关键字，如下例子所示：
      import 'package:lib1/lib1.dart' show foo;
     模式二：隐藏不需要的部分，使用hide关键字，如下例子所示：
      import 'package:lib2/lib2.dart' hide foo;    

3.  延迟加载
    也称为懒加载，可以在需要的时候再进行加载。
    懒加载的最大好处是可以减少APP的启动时间。
    懒加载使用deferred as关键字来指定，如下例子所示：
    import 'package:deferred/hello.dart' deferred as hello;
    当需要使用的时候，需要使用loadLibrary()方法来加载：
    greet() async {
      await hello.loadLibrary();
      hello.printGreeting();
    }
