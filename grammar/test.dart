main() {
  var n = 'gg';

//var b = 'gg$n''o';

  var b = 'gg${n.toUpperCase()}o';
  var s = r'In a raw string, not even \n gets special treatment.';

  print(b);
  print(s);
}
