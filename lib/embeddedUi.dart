import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class EmbeddedApp extends StatelessWidget {
  EmbeddedApp(this.onFloatingActionButtonPressed);

  final OnFloatingActionButtonPressed onFloatingActionButtonPressed;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return _AndroidApp(onFloatingActionButtonPressed);
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return _IOSApp(onFloatingActionButtonPressed);
    } else {
      return null;
    }
  }
}

class _AndroidApp extends StatefulWidget {
  _AndroidApp(this.onFloatingActionButtonPressed);

  final OnFloatingActionButtonPressed onFloatingActionButtonPressed;

  @override
  State<StatefulWidget> createState() {
    return _AndroidAppState();
  }
}

class _AndroidAppState extends State<_AndroidApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: _AndroidScaffold(
            title: 'Flutter Demo Home Page',
            onFloatingActionButtonPressed:
                widget.onFloatingActionButtonPressed));
  }
}

class _AndroidScaffold extends StatefulWidget {
  _AndroidScaffold({Key key, this.title, this.onFloatingActionButtonPressed})
      : super(key: key);

  final OnFloatingActionButtonPressed onFloatingActionButtonPressed;

  final String title;

  @override
  _AndroidScaffoldState createState() => _AndroidScaffoldState();
}

class _AndroidScaffoldState extends State<_AndroidScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(getCounterValue(),
                style: Theme.of(context).textTheme.display1),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: widget.onFloatingActionButtonPressed.onPressed,
          tooltip: 'Increment',
          child: Icon(Icons.add)),
    );
  }
}

class _IOSApp extends StatefulWidget {
  _IOSApp(this.onFloatingActionButtonPressed);

  final OnFloatingActionButtonPressed onFloatingActionButtonPressed;

  @override
  State<StatefulWidget> createState() {
    return _IOSAppState();
  }
}

class _IOSAppState extends State<_IOSApp> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        title: 'Flutter Demo',
        home: _IOSScaffold(
            title: 'Flutter Demo Home Page',
            onFloatingActionButtonPressed:
                widget.onFloatingActionButtonPressed));
  }
}

class _IOSScaffold extends StatefulWidget {
  _IOSScaffold({Key key, this.title, this.onFloatingActionButtonPressed})
      : super(key: key);

  final OnFloatingActionButtonPressed onFloatingActionButtonPressed;

  final String title;

  @override
  _IOSScaffoldState createState() => _IOSScaffoldState();
}

class _IOSScaffoldState extends State<_IOSScaffold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text(widget.title)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              Text(getCounterValue(),
                  style: Theme.of(context).textTheme.display1),
              CupertinoButton(
                  child: Text("Increment"),
                  onPressed: widget.onFloatingActionButtonPressed.onPressed)
            ],
          ),
        ));
  }
}

abstract class OnFloatingActionButtonPressed {
  void onPressed();
}
