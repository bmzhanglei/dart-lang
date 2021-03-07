## core
```dart

123.456.toStringAsFixed(2) == '123.46'
123.456.toStringAsPrecision(2) == '1.2e+2'
'Never odd or even'.contains('odd')
'Never odd or even'.startsWith('Never')
'Never odd or even'.endsWith('even')
'Never odd or even'.indexOf('odd') == 6
'Never odd or even'.substring(6, 9) == 'odd'
'structured web apps'.split(' ')
'Never odd or even'[0] == 'N'  //true

for (var char in 'hello'.split('')) {
  print(char);
}

var codeUnitList =
    'Never odd or even'.codeUnits.toList();
assert(codeUnitList[0] == 78);

toUpperCase()
toLowerCase()
trim()
isNotEmpty
replaceAll(RegExp('NAME'), 'Bob')

var sb = StringBuffer();

sb
  ..write('Use a StringBuffer for ')
  ..writeAll(['efficient', 'string', 'creation'], ' ')
  ..write('.');

var fullString = sb.toString();
var reg = RegExp(r'\d+');
reg.hasMatch(str)  //true

for (var match in reg.allMatches(str)) {
  print(match.group(0)); // 15, then 20
}
```

## Collections
```dart
//Lists

    var list = List<String>();

    add(),addAll([]),indexOf(),removeAt(index)

    clear(),isEmpty,

     list.sort((a, b) => a.compareTo(b));

//Sets

var set = Set();

      addAll([]),add(),remove(),contains(),

      containsAll([]),contains()

      Set.from(['xenon', 'argon'])

      set1.intersection(set2) //交集

//Map

    var map = Map<int, String>();

    containsKey(key),remove(key),

    map.keys.values,

    map.forEach((k, v) {})

//Iterables提供map()方法

   where(),any(),every()
```

## URIs

特殊含义的字符（例如/ ， : ， & # ） 以外的字符进行编码和解码

```dart

var encoded = Uri.encodeFull(uri);
decodeFull(encoded);
Uri.encodeComponent(uri)
Uri.decodeComponent(encoded)

var uri = Uri.parse('http://example.org:8080/foo/bar#frag');
assert(uri.scheme == 'http');
assert(uri.host == 'example.org');
assert(uri.path == '/foo/bar');
assert(uri.fragment == 'frag');
assert(uri.origin == 'http://example.org:8080');

var uri = Uri(
    scheme: 'http',
    host: 'example.org',
    path: '/foo/bar',
    fragment: 'frag');
assert(
    uri.toString() == 'http://example.org/foo/bar#frag');
```
## Dates and times

```dart
var now = DateTime.now();
var y2k = DateTime(2000); // January 1, 2000
y2k = DateTime(2000, 1, 2); // January 2, 2000
y2k = DateTime.utc(2000); // 1/1/2000, UTC

//毫秒数转化日期
y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
y2k = DateTime.parse('2000-01-01T00:00:00Z');

//1970 至今的毫秒数
 DateTime.utc(2000).millisecondsSinceEpoch
Duration类来计算两个日期之间的差

var y2k = DateTime.utc(2000);
// Add one year.

var y2001 = y2k.add(Duration(days: 366));
var december2000 = y2001.subtract(Duration(days: 30));

var duration = y2001.difference(y2k);

duration.inDays   //返回多少天

duration.inHours 
```