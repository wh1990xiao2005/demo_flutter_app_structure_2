import 'package:flutter/material.dart';
import 'embeddedUi.dart';
import 'counter.dart';

int _value;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp>
    implements OnFloatingActionButtonPressed {
  @override
  Widget build(BuildContext context) {
    return EmbeddedApp(this);
  }

  @override
  void onPressed() {
    setState(() {
      _value = incrementCounter();
    });
  }
}

/// 获取计数器的值
String getCounterValue() {
  if (_value == null) {
    _value = initCounter();
  }
  return "$_value";
}
