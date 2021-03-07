## List里面常用的属性和方法：
    常用属性：

        length          长度

        reversed        翻转

        isEmpty         是否为空

        isNotEmpty      是否不为空

    常用方法：  

        add         增加

        addAll      拼接数组

        indexOf     查找  传入具体值

        remove      删除  传入具体值

        removeAt    删除  传入索引值

        fillRange   修改   

        insert(index,value);            指定位置插入    

        insertAll(index,list)           指定位置插入List

        toList()    其他类型转换成List  

        join()      List转换成字符串

        split()     字符串转化成List

        forEach   

        map

        where

var ls = list.where((obj)=>obj.toString().length==2);

        any //只要集合里面有满足条件的就返回true

        every //每一个都满足条件返回true  否则返回false

## Set

//用它最主要的功能就是去除数组重复内容

//Set是没有顺序且不能重复的集合，所以不能通过索引去获取值

List myList=['香蕉','苹果','西瓜','香蕉','苹果','香蕉','苹果'];

  var s=new Set();

  s.addAll(myList);

  print(s);

  print(s.toList());

 ## 映射(Maps)是无序的键值对：

    常用属性：

        keys            获取所有的key值

        values          获取所有的value值

        isEmpty         是否为空

        isNotEmpty      是否不为空

    常用方法:

        remove(key)     删除指定key的数据

        addAll({...})   合并映射  给映射内增加属性

        containsValue   查看映射内的值  返回true/false

     创建一个编译时常量的映射，在映射文字之前添加const

final constantMap = const {

  2: 'helium',

  10: 'neon',

  18: 'argon',

};

forEach

List myList=['香蕉','苹果','西瓜'];

  myList.forEach((value){

          print("$value");

      });

for (var x in myList) {

  print(x); // 

}

 Map person={

        "name":"张三",

         "age":20

      };

      person.forEach((key,value){            

       print("$key---$value");

   });

      

List list = ['hello', 'world', 'china'];

final listToMap = list.asMap();

//获取index

List<Widget> _list = _products.asMap().map((i, item){

      return MapEntry(i, _renderCount(item, i)); // 可以在这里获取索引以及渲染组件

    }).values.toList();

List list = ['hello', 'world', 'china'];

 List result = List.generate(list.length, (index) {

      return _renderItem(index);

});