import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer _timer;
  int _counter = 10;
  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (Timer timer) {
        setState(() {
          if(_counter <= 0) {
            _timer.cancel();
          }else   _counter--;
        });

    });
  }

  void _stopTimer(){
    _timer.cancel();
  }
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

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
            Text(
              '$_counter',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            RaisedButton(
              onPressed: () {
                if(_timer != null) _timer.cancel();
                _counter = 10;
                _startTimer();
                },
              elevation: 100,
              child: const Text("Start timer"),
            ),
            RaisedButton(
              onPressed: () => _stopTimer(),
              elevation: 100,
              child: Text("Stop timer"),
            )
          ],
        ),
      ),
    );
  }
}
