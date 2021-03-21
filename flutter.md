## Flutter
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
快捷引入:fim  
常用的属性:  
home(主页) title(标题) color(颜色) theme(主题) routes(路由) ...

## Scaffold
Scaffold 是 Material Design 布局结构的基本实现。此类提供了用于显示 drawer、snackbar 和底部 sheet 的 API。  
Scaffold 有下面几个主要属性:  
appBar - 显示在界面顶部的一个 AppBar。 
body - 当前界面所显示的主要内容   
Widget。 drawer - 抽屉菜单控件。  
...

## Widget
### Container
```dart
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
###	Text
	Image
	ListView
	GridView
	Layout
		Padding
		Row
		Column
		Expanded
		Stack
		AspectRatio
		Card
		Wrap
	StatefulWidget
	BottomNavigationBar
	AppBar、Tab
	Drawer
	Button
	表单
		TextField
		Checkbox、CheckboxListTile
		Radio、RadioListTile
		Switch
	日期组件
		日期国际化
	轮播图
	Dialog

路由

网络请求
	下拉刷新 上拉分页加载更多
	WebView 
	图片上传
	视频播放
	检测网络连接 监听网络变化

获取设备信息、获取地 理位置
MaterialApp

Scaffold

Widget
	Container
	Text
	Image
	ListView
	GridView
	Layout
		Padding
		Row
		Column
		Expanded
		Stack
		AspectRatio
		Card
		Wrap
	StatefulWidget
	BottomNavigationBar
	AppBar、Tab
	Drawer
	Button
	表单
		TextField
		Checkbox、CheckboxListTile
		Radio、RadioListTile
		Switch
	日期组件
		日期国际化
	轮播图
	Dialog

路由

网络请求
	下拉刷新 上拉分页加载更多
	WebView 
	图片上传
	视频播放
	检测网络连接 监听网络变化

获取设备信息、获取地 理位置

本地存储

调用原生硬件 Api 实现扫码

App 自动升级、安装

调用 url_launcher 模块打开外部浏 览器 打开外部应用 拨打电话 发送短信

极光推送
	Android
	iOS

本地存储

调用原生硬件 Api 实现扫码

App 自动升级、安装

调用 url_launcher 模块打开外部浏 览器 打开外部应用 拨打电话 发送短信

极光推送
	Android
	iOS
