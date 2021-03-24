# Flutter

//升级更新
r 键:点击后热加载，也就算是重新加载吧。
p 键:显示网格，这个可以很好的掌握布局情况，工作中很有用。 
o 键:切换 android 和 ios 的预览模式。
q 键:退出调试预览模式。
快捷方式
输出stless就可以创建一个StatelessWidget
输入stful创建一个StatefulWidget
重命名方法，重命名widget，重命名类或者文件名，只需要使用Shift + F6 
Ctrl+Alt+O 删除未使用的import

## MaterialApp

MaterialApp 是一个方便的 Widget，它封装了应用程序实现 Material Design 所需要的 一些 Widget。一般作为顶层 widget 使用。
快捷引入
fim
常用的属性:
home(主页) title(标题) color(颜色) theme(主题) routes(路由) ...

## Scaffold
```
Scaffold 是 Material Design 布局结构的基本实现。此类提供了用于显示 drawer、
snackbar 和底部 sheet 的 API。
Scaffold 有下面几个主要属性:
appBar - 显示在界面顶部的一个 AppBar。 
body - 当前界面所显示的主要内容 
Widget。 drawer - 抽屉菜单控件。
...
```
## Widget

### Container
```
alignment
decoration: BoxDecoration( color: Colors.blue, border: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
          borderRadius:
BorderRadius.all(
)
margin:EdgeInsets.all(20.0),
padding:EdgeInsets.all(10.0),
transform:Matrix4.rotationZ(0.2),
height
width
child
```
### Text
```
textAlign: center | left | right | justfy
textDirection:ltr |rtl
overflow: clip|fade |ellipsis
textScaleFactor
maxLines
style:TextStyle(
    decoration
    decorationColor
    decorationStyle
    wordSpacing
    letterSpacing
    fontStyle
    fontSize
    color
    fontWeight
)


Center(
          child: Container(
              child: Text(
                '文字部分',
                textAlign:TextAlign.left,
                overflow:TextOverflow.ellipsis ,
                // overflow:TextOverflow.fade ,
                maxLines: 2,
                textScaleFactor: 1.8,
                style:TextStyle(
                  fontSize: 16.0,
                  color:Colors.red,
                  // color:Color.fromARGB(a, r, g, b)
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  decoration:TextDecoration.lineThrough,
                  decorationColor:Colors.white,
                  decorationStyle: TextDecorationStyle.dashed,
                  letterSpacing: 5.0
                  )              
              ),
              height: 300.0,
              width: 300.0,
              decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0
                ),
                borderRadius: BorderRadius.all(
                //  Radius.circular(150),    //圆形
                  Radius.circular(10),  
                )
              ),
              // padding:EdgeInsets.all(20),

              // padding:EdgeInsets.fromLTRB(10, 30, 5, 0)

              margin: EdgeInsets.fromLTRB(10, 30, 5, 0),

              // transform:Matrix4.translationValues(100,0,0)

              // transform:Matrix4.rotationZ(0.3)

              // transform:Matrix4.diagonal3Values(1.2, 1, 1)

              alignment: Alignment.bottomLeft,
          ),
    );
```
### Image
```
Image.asset
 images/a.jpeg
 images/2.0x/a.jpeg
 images/3.0x/a.jpeg
 images/4.0x/a.jpeg
pubspec.yaml 声明一下添加的图片文件，注意要配置对
        ClipOval 圆角
Image.network

  alignment:Alignment.topLeft  //图片的对齐方式
  color: Colors.red,
  colorBlendMode: BlendMode.colorDodge,
   repeat:ImageRepeat.repeatX
   width  //结合 ClipOval 才能看到效果
   height:100.0,
   decoration: BoxDecoration(
       color: Colors.yellow ,
      borderRadius: BorderRadius.circular(150),
     image: DecorationImage(
              image: new
NetworkImage('https://45381862.jpg'),
              fit: BoxFit.cover
),
   fit:BoxFit.fill  //全图显示,图片会被拉伸，并充满父容器
     BoxFit.contain //全图显示，显示原比例，可能会有空隙
    BoxFit.cover  //显示可能拉伸，可能裁切，充满(图片要 充满整个容器，还不变形)
    BoxFit.fitWidth
    BoxFit.fitHeight
     BoxFit.scaleDown //效果和 contain 差不多，但是此属 性不允许显示超过源图片大小，可小不可大

return Center(
child: Container(
   child:ClipOval( 
       child:Image.network("https://381862.jpg",
       width: 150.0,
        height: 150.0,
    ),
  )
), );

```


### ListView
```
  ListView
     scrollDirection:Axis.horizontal
     //scrollDirection:Axis.vertical
     padding:EdgeInsetsGeometry   //内边距
     resolve:bool    //组件反向排序
     children:List<Widget>

children: <Widget>[
ListTile(
leading: Icon(Icons.phone),
title: Text("this is list",style: TextStyle(fontSize: 28.0),), subtitle: Text('this is list this is list'),
),
]

//动态列表
class HomeContent extends StatelessWidget {
  List list=new List();
  HomeContent({ Key key }) : super(key: key){
    for(var i=0;i<20;i++){ 
      list.add("这是第${i}条数据");
    }
    print(list); 
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder( 
      itemCount:this.list.length, itemBuilder:(context,index){
      // print(context); 
        return ListTile(
          leading: Icon(Icons.phone),
          title: Text("${list[index]}"), 
        );
      },
    ); 
  }
}

/*******************************************/
import 'res/listData.dart';
class HomeContent extends StatelessWidget {  

  //自定义方法
  Widget _getListData(context,index){
        return ListTile(           
            title: Text(listData[index]["title"]),
            leading:Image.network(listData[index]["imageUrl"]),          
            subtitle:Text(listData[index]["author"])
        );
  }

  @override
  Widget build(BuildContext context) {    
    // TODO: implement build
    return ListView.builder(
        itemCount:listData.length,
        itemBuilder:this._getListData
    );
  }
}
```
### GridView

1、垂直列表
2、垂直图文列表 
3、水平列表
4、动态列表
 5、矩阵式列表(网格布局)


1、可以通过 GridView.count 实现网格布局
2、通过 GridView.builder 实现网格布局
```
scrollDirection:Axis
padding:EdgeInsetsGeometry
resolve:bool
crossAxisSpacing:double
mainAxisSpacing:double
crossAxisCount
childAspectRatio
children:<Widget>[ ]

gridDelegate:SliverGridDelegateWithFix
edCrossAxisCount(常用)
SliverGridDelegateWithMax
控制布局主要用在 GridView.builder 里面
 CrossAxisExtent
```
### Layout

- Padding

  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
  child

- Row

  mainAxisAlignment //主轴的排序方式 横向
  crossAxisAlignment 次轴的排序方式
  children

- Column

  mainAxisAlignment
  crossAxisAlignment
  children

- Expanded

  flex 元素站整个父 Row /Column 的比例
  child   子元素

- Stack

     alignment  配置所有子元素的显示位置
     children  子组件  
  
```
  Align
     alignment  配置所有子元素的显示位置
     children  子组件
    return Center(
        child:  Container(
              height: 400,
              width: 300,
              color: Colors.red,
              child: Stack(
                // alignment: Alignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment(1,-0.2),
                    child: Icon(Icons.home,size: 40,color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.search,size: 30,color: Colors.white),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
                  )
                ],
              ),
        ),
      );
``` 
```
  Positioned
  top 子元素距离顶部的距离
  bottom  子元素距离底部的距离
  left  子元素距离左侧距离
  right 子元素距离右侧距离
  child 子组件
     return Center(
        child:  Container(
              height: 400,
              width: 300,
              color: Colors.red,
              child: Stack(
                // alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                  //  left: 10,
                    child: Icon(Icons.home,size: 40,color: Colors.white),
                  ),
                  Positioned(
                   bottom: 0,
                   left: 100,
                    child: Icon(Icons.search,size: 30,color: Colors.white),
                  ),
                  Positioned(
                    right: 0,
                    child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
                  )
                ],
              ),
        ),
      );
```
- AspectRatio
```
  aspectRatio
    宽高比，最终可能不会根据这个值去布局， 具体则要看综合因素，外层是否允许按照这 种比率进行布局，这只是一个参考值
  child 子组件
  
  child: AspectRatio(
      aspectRatio: 2.0/1.0,
      child: Container(
            color: Colors.red,
       ),
  ),
```
- Card

  margin
  child
  Shape Card 的阴影效果，默认的阴影效果为圆角的 长方形边。

- Wrap
```
  direction 主轴的方向，默认水平
  alignment 
  spacing
  textDirection
  verticalDirection
  runAlignment run 的对齐方式。run 可以理解为新的行或者 列，如果是水平方向布局的话，run 可以理解 为新的一行
  runSpacing run 的间距
```

### StatefulWidget
```
StatelessWidget 是无状态组件，状态不可变的 widget
StatefulWidget 是有状态组件，持有的状态可能在 widget 生命周期改变。通俗的讲:如果我 们想改变页面中的数据的话这个时候就需要用到 StatefulWidget
          setState(() {   //只有有状态组件里面才有
                  this.countNum++;
             });
```

### BottomNavigationBar
```
items List<BottomNavigationBarItem> 底 部 导 航 条按钮集合
iconSize
currentIndex 默认选中第几个
onTap 
fixedColor
type BottomNavigationBarType.fixed
        BottomNavigationBarType.shifting


Scaffold(
  appBar: AppBar(
      title: Text('Flutter Demo') 
    ),
  body: this._pagesList[this._curentIndex], 
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _curentIndex,
    onTap: _changePage,
    fixedColor: Colors.black,
    type: BottomNavigationBarType.fixed, 
    items: [
      BottomNavigationBarItem( title:Text("首页"), icon:Icon(Icons.home)), BottomNavigationBarItem(
        title:Text("分类"),
        icon:Icon(Icons.category) ),
      BottomNavigationBarItem( 
        title:Text("设置"), 
        icon:Icon(Icons.settings)
      ),
    ], 
  ),
)
```
### AppBar、Tab

leading  首页通常logo,其他界面通常为返回按钮
title 可以放组 件
actions 通常使用IconButton来表示,可放按钮组
bottom 通常放 tabBar，标题下面显示一个 Tab 导航栏
backgroundColor
iconTheme 图标样式
textTheme 文字样式
centerTitle 标题是否居中显示


AppBar 中自定义 TabBar 实现顶部 Tab 切换

tabs 显示的标签内容，一般使用 Tab 对象,也可以是其他 的 Widget
controller  TabController 对象
isScrollable 是否可滚动
indicatorColor
indicatorWeight  指示器高度
indicatorPadding  底部指示器的 Padding
indicator  指示器 decoration，例如边框等
indicatorSize  指示器大小计算方式，TabBarIndicatorSize.label 跟文 字等宽,TabBarIndicatorSize.tab 跟每个 tab 等宽
labelColor  选中 label 颜色
labelStyle 选中 label 的 Style
labelPadding  每个 label 的 padding 值
unselectedLabelColor  未选中 label 颜色
unselectedLabelStyle 未选中 label 的 Style

```
  bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "热门"),
                Tab(text: "推荐")
              ],
            ),

  body: TabBarView(
            children: <Widget>[
                ListView(),
               ListView(),
          ]


AppBar 中自定义 TabBar 实 现 Tabs 的另一种方法


class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void dispose() {   //生命周期函数
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {   //生命周期函数
    // TODO: implement initState
    super.initState();
    _tabController=new TabController(
      vsync: this,
      length: 2
    );
    // _tabController.addListener((){

    //   print(_tabController.index);     
    // });
  }  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TabBarControllerPage"),
        bottom: TabBar(
          controller: this._tabController,  //注意
          tabs: <Widget>[
            Tab(text:"热销"),
            Tab(text:"推荐"),
          ],
        ),
      ),
      body: TabBarView(
        controller: this._tabController,  //注意
        children: <Widget>[
          Center(child: Text("热销")),
          Center(child: Text("推荐"))
          
        ],
      ),
    );
  }
}
```

### Drawer
```
return Scaffold(
     appBar: AppBar(
         title: Text("Flutter App"),
        ),
      drawer: Drawer(
            child: Text('左侧边栏'),
        ),
        endDrawer: Drawer(
              child: Text('右侧侧边栏'),
       ),
);


DrawerHeader
decoration 设置顶部背景颜色
child 配置子元素
padding 内边距
margin 外边距

UserAccountsDrawerHeader
decoration 设置顶部背景颜色
accountName 账户名称
accountEmail 账户邮箱
currentAccountPicture 用户头像
otherAccountsPictures 用来设置当前账户其他账户头像
margin
```
### Button

RaisedButton :凸起的按钮，其实就是 Material Design 风格的 Button 
FlatButton :扁平化的按钮
OutlineButton:线框按钮
IconButton :图标按钮
ButtonBar:按钮组   

```
onPressed
child  Widget  文本控件
textColor Color  文本颜色
color  Color  按钮的颜色
disabledColor Color 按钮禁用时的颜色
disabledTextColor Color
splashColor  Color
点击按钮时水波纹的颜色
highlightColor  Color
点击(长按)按钮后按钮的颜色
elevation  double
阴影的范围，值越大阴影范围越大
padding  内边距
shape  设置按钮的形状
shape: RoundedRectangleBorder(
     borderRadius:
BorderRadius.circular(10),
)
shape: CircleBorder(
      side: BorderSide(
          color: Colors.white,
      )
)


FloatingActionButton:浮动按钮
child 子视图，一般为 Icon，不推荐使用文字
tooltip FAB 被长按时显示，也是无障碍功能
backgroundColor 背景颜色
elevation 未点击的时候的阴影
hignlightElevation  点击时阴影值，默认 12.0
onPressed 点击事件回调
shape 可以定义 FAB 的形状等
mini 是否是 mini 类型默认 false

floatingActionButton: Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: (){
               setState(() {  //改变状态
                    this._currentIndex=1;
                });

            },
            backgroundColor: this._currentIndex==1?Colors.red:Colors.yellow,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
```




### 表单

- TextField
```
  maxLines 设置此参数可以把文本框改为多行文本框
  onChanged 文本框改变的时候触发的事件
  decoration
      hintText 类似 html 中的 placeholder
      border  配置文本框边框 OutlineInputBorder 配合使用
      labelText  lable 的名称
      labelStyle 配置 lable 的样式
  obscureText 把文本框框改为密码框
  controller  controller 结合 TextEditingController()可以配置表单默认显示的内容
```
- Checkbox、CheckboxListTile
```
  Checkbox 常见属性
  value true 或者 false
  onChanged 改变的时候触发的事件
  activeColor 选中的颜色、背景颜色
  checkColor
  选中的颜色、Checkbox 里面对号的颜色
  
  
  CheckboxListTile 常见属性:
  value  true 或者 false
  onChanged 改变的时候触发的事件
  activeColor 选中的颜色、背景颜色
  title 标题
  subtitle  二级标题
  secondary  配置图标或者图片
  selected  选中的时候文字颜色是否跟着改变
```
- Radio、RadioListTile
```
  Radio 常用属性:
  value 单选的值
  onChanged 改变时触发
  activeColor 选中的颜色、背景颜色
  groupValue 选择组的值
  
  RadioListTile 常用属性:
  value true 或者 false
  onChanged 改变的时候触发的事件
  activeColor 选中的颜色、背景颜色
  title 标题
  subtitle 二级标题
  secondary 配置图标或者图片
  groupValue 选择组的值
```
- Switch
```
  value 单选的值
  onChanged 改变时触发
  activeColor 选中的颜色、背景颜色
```
### 日期组件
日期组件:
```
var _datetime=DateTime.now();
_showDatePicker() async{
    var date =await showDatePicker(
      context: context,
      initialDate: _datetime,
      firstDate:DateTime(1900),
      lastDate:DateTime(2050)
    );
    if(date==null) return;
    print(date);
    setState(() {
       _datetime=date;
    });
}
```
时间组件:
```
var _time=TimeOfDay(hour: 9,minute: 20);
_showTimePicker() async{
    var time =await showTimePicker(
      context: context,
      initialTime:  _time
    );
    if(time==null) return;
    print(time);
    setState(() {
       this._time=time;
    });
}
```

第三方库 date_format
formatDate(_datetime, [yyyy, '-', mm, '-',dd])
flutter_cupertino_date_picker  

- 日期国际化
```
  1、配置flutter_localizations依赖
  找到pubspec.yaml配置flutter_localizations
  
  dependencies:
    flutter:
      sdk: flutter
    flutter_localizations:
      sdk: flutter
  2、导入国际化的包 flutter_localizations
  import 'package:flutter_localizations/flutter_localizations.dart'; 
  3、设置国际化
  void main() {
    runApp(
      new MaterialApp(
        title: 'app',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new MyLoginWidget(),
        localizationsDelegates: [
          //此处
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          //此处
          const Locale('zh', 'CH'),
          const Locale('en', 'US'),
        ],
      ),
    );
  }
  4、要显示中文的控件设置：
  _showDatePicker() async{
      var date =await showDatePicker(
        context: context,
        initialDate: _datetime,
        firstDate:DateTime(1900),
        lastDate:DateTime(2050),
        locale: Locale('zh'),    
      );
      if(date==null) return;
      print(date);
      setState(() {
         _datetime=date;
      });
    }
```
### 轮播图

第三方组件
flutter_swiper

### Dialog
```
AlertDialog
SimpleDialog
showModalBottomSheet
showToast

自定义 Dialog

定时器
import 'dart:async';
_showTimer(context){
     var timer;
     timer = Timer.periodic(
          Duration(milliseconds: 1500), (t) {
}); }
print('执行'); Navigator.pop(context); t.cancel();
```
## 路由
```
路由跳转传值
onPressed: (){
   Navigator.of(context).push(MaterialPageRoute(
    builder: (BuildContext context){
         return SearchPage(title:"表单"); //传值 
    }
) );
},
```

命名路由  
```
//配置路由
final routes={
      '/':(context)=>Tabs(),
      '/form':(context)=>FormPage(),
      '/product':(context)=>ProductPage(),
      '/productinfo':(context,{arguments})=>ProductInfoPage(arguments:arguments),
      '/search':(context,{arguments})=>SearchPage(arguments:arguments),
};

// 统一处理
//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};

onPressed: (){ 
    Navigator.pushNamed(context, '/form',arguments: {
"id":20 });
}

3、接收参数
class FormPage extends StatelessWidget{ 
    final Map arguments;    
     FormPage({this.arguments});
@override
Widget build(BuildContext context) {
       return Scaffold( 
           appBar: AppBar(
                title: Text("搜索"), 
            ),
            body:Text("我是一个表单页面 ${arguments != null ? arguments['id'] : '0'}") );
 } 
}
```

路由替换  
Navigator.of(context).pushReplacementNamed('/registerSecond');  

返回到根路由  
```
Navigator.of(context).pushAndRemoveUntil(
         new MaterialPageRoute(builder: (context) => new Tabs(index:1)),
         (route) => route == null
);  
```
命名路由跳转传值

## 网络请求


http

Dio
dio 是一个强大的 Dart Http 请求库，支持 Restful API、FormData、拦截器、请
求取消、Cookie 管理、文件上传/下载、超时、自定义适配器等...

import 'dart:convert'
var mapData={"name":"张三","age":"20"};
var strData='{"name":"张三","age":"20"}'; print(json.encode(mapData)); //Map转换成Json字符串 print(json.decode(strData)); //Json 字符串转化成 Map 类型

//定时器
const timeout = const Duration(milliseconds: 500);
// Timer(timeout, (){
//    print('55');
// });
int count = 0;
Timer.periodic(timeout, (timer){
   count++;
   if(count>5){
     timer.cancel();
     timer = null;
   }else{
    print(count);
   }   
},);

### 下拉刷新 上拉分页加载更多

下拉刷新的组件 RefreshIndicator


上拉分页加载更多
_scrollController.position.pixels 滚动的距离
_scrollController.position.maxScrollExtent 总距离

### WebView 

flutter_inappbrowser 比 flutter_html 效果好

minSdkVersion 17

### 图片上传

image_picker 实现相机拍照 和相册选择
```
/*拍照*/
_takePhoto() async {
   var image = await ImagePicker.pickImage(source: ImageSource.camera);
   setState(() {
     _imgPath = image;
   });
}
/*相册*/ 
_openGallery() async {
   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
   setState(() {
     _imgPath = image;
   });
}
```
上传图片到服务器
```
 _uploadImage(_imageDir) async{
      FormData formData = new FormData.from({
        "name": "zhangsna 6666666666",
        "age": 20,
        "sex":"男",
        "file":new UploadFileInfo(_imageDir, "xxx.jpg"),
      });
      var response = await Dio().post("http://jd.itying.com/imgupload", data: formData);

      print(response);
  }
```
### 视频播放

video_player

chewie
chewie 是一个非官方的第三方视频播放组件，看起来好像是基于 HTML5 播放的组 件。chewie 相对 video_player 来说，有控制栏和全屏的功能。Chewie 使用 video_player 引 擎并将其包裹在友好的 Material 或 Cupertino UI 中!


### 检测网络连接 监听网络变化
```
connectivity

class _NetworkPageState extends State<NetworkPage> {

  var subscription;
  String _stateText;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {

       if(result==ConnectivityResult.wifi){
         setState(() {
          _stateText="处于wifi";
         });
       }else if(result==ConnectivityResult.mobile){
         setState(() {
            _stateText="处于手机网络";
        });
       }else{
        setState(() {
          _stateText="没有网络";
        });         
       }
      // Got a new connectivity status!
     });
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();  //注意

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("检测网络变化"),
      ),
      body:Center(
        child: Text("${_stateText}")
      ),
    );
  }
}
```
## 获取设备信息、获取地 理位置


Flutter 中获取设备信息
device_info
```
_getDevice() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('设备号 ${androidInfo.androidId}');  // e.g. "Moto G (4)"
  }
```

使用高德定位准备工作 获取 key

1、申请成为开发者
2、创建应用配置获取 Key (参考教程演示)


amap_location
```
1、配置安装依赖
 dependencies:
    amap_location: ^0.2.0

2、修改 你的项目目录/app/build.gradle 在 android/defaultConfig 节点修 改 manifestPlaceholders,新增高德地图 key 配置

android {
.... 你的代码
    defaultConfig {
        .....
manifestPlaceholders = [
AMAP_KEY : "aa9f0cf8574400f2af0078392c556e25", // 高德
地图 key ]
}
...你的代码 dependencies {
/// 注意这里需要在主项目增加一条依赖，否则可能发生编译不通过的 情况
        implementation 'com.amap.api:location:latest.integration'
import 'package:location_permissions/location_permissions.dart';
...你的代码 }

3、引入库使用

//授权
  PermissionStatus permission1 =
      await LocationPermissions().requestPermissions();

  //启动一下
    await AMapLocationClient.startup(new AMapLocationOption( desiredAccuracy:CLLocationAccuracy.kCLLocationAccuracyHundredMeters  ));  
    //获取地理位置
    var result = await AMapLocationClient.getLocation(true);

    print("经度:${result.longitude}");

    print("纬度:${result.latitude}");
```



## 本地存储

shared_preferences

1、设置值

SharedPreferences prefs = await SharedPreferences.getInstance();

prefs.setString(key, value);
 prefs.setBool(key, value) 
prefs.setDouble(key, value) 
prefs.setInt(key, value)
prefs.setStringList(key, value)

2、获取值
 SharedPreferences prefs = await SharedPreferences.getInstance(); 
var data=prefs.getString("name");

3、删除值
SharedPreferences prefs = await SharedPreferences.getInstance(); prefs.remove(key); //删除指定键
prefs.clear();//清空键值对


封装成一个类
```
class Storage{
  static Future<void> setString(key,value) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.setString(key, value);
  }
  static Future<String> getString(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       return sp.getString(key);
  }

  static Future<void> remove(key) async{
       SharedPreferences sp=await SharedPreferences.getInstance();
       sp.remove(key);
  }
}
```
## 调用原生硬件 Api 实现扫码

1、安装
 dependencies:
     qrscan: ^0.2.17

2、配置权限
AndroidManifest.xml

<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>

gradle.properties中添加:
android.useAndroidX=true
android.enableJetifier=true


使用
import 'package:qrscan/qrscan.dart' as scanner;

String cameraScanResult = await scanner.scan();

## App 自动升级、安装

1、获取本地版本号
2、请求服务器获取服务器版本号 
3、本地版本和服务器版本不一致提示升级，弹窗提示用户是否更新 
4、用户确定升级，调用文件传输方法下载 apk 文件 
5、监听下载进度
6、下载完成打开 Apk 进行安装

package_info
path_provider
flutter_downloader
open_file

## 调用 url_launcher 模块打开外部浏 览器 打开外部应用 拨打电话 发送短信

url_launcher 模块

https://pub.dev/packages/url_launcher

关于打开其他 app 请参考这个帖子
https://www.cflutter.com/topic/5d0853733b57e317a4d0af01

## 极光推送

jpush_flutter

### Android

### iOS

