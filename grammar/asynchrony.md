Future或Stream对象的函数.属于异步的函数

要使用await ，代码必须位于async函数中-标记为async的函数

```dart
Future<String> lookUpVersion() async => '1.0.0';
Future checkVersion() async {
  var version = await lookUpVersion();
  // Do something with version
}
```

如果在实现异步for循环时遇到编译时错误，请确保await for位于async函数中. 例如，要在应用程序的main()函数中使用异步for循环，必须将main()的main()标记为async ：

```dart
Future main() async {
  // ...
  await for (var request in requestServer) {
    handleRequest(request);
  }
  // ...
}
```