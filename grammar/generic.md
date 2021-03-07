## 泛型方法
不指定类型放弃了类型检查。我们现在想实现的是传入什么 返回什么。比如:传入number 类型必须返回number类型  传入 string类型必须返回string类型
```dart
 //只对传入的参数校验
getData<T>(T value){
      return value;
  }

 //只对传入的参数和返回的类型校验
T getData<T>(T value){
      return value;
  }

void main(){
    // print(getData(21));
    print(getData('xxx'));
    // getData<String>('你好');
    print(getData<int>(12));
}
```

## 泛型类 
```dart

 class PrintClass<T>{
      List list=new List<T>();
      void add(T value){
          this.list.add(value);
      }

      void printInfo(){          
          for(var i=0;i<this.list.length;i++){
            print(this.list[i]);
          }
      }
 }

main() {  

    PrintClass p=new PrintClass<String>();
    p.add('你好');
     p.add('哈哈');
     p.printInfo();
}
```

## 泛型接口

 实现数据缓存的功能：有文件缓存、和内存缓存。内存缓存和文件缓存按照接口约束实现。
    1、定义一个泛型接口 约束实现它的子类必须有getByKey(key) 和 setByKey(key,value)
    2、要求setByKey的时候的value的类型和实例化子类的时候指定的类型一致

```dart

abstract class Cache<T>{
  getByKey(String key);
  void setByKey(String key, T value);
}

class FlieCache<T> implements Cache<T>{

    @override
    getByKey(String key) {    
        return null;
     }

     @override
     void setByKey(String key, T value) {
           print("我是文件缓存 把key=${key}  value=${value}的数据写入到了文件中");
       }
}

class MemoryCache<T> implements Cache<T>{

  @override
  getByKey(String key) {   
    return null;
  }

  @override
  void setByKey(String key, T value) {
       print("我是内存缓存 把key=${key}  value=${value} -写入到了内存中");
  }
}

void main(){

    // MemoryCache m=new MemoryCache<String>();
    //  m.setByKey('index', '首页数据');
     MemoryCache m=new MemoryCache<Map>();
     m.setByKey('index', {"name":"张三","age":20});

}
```
