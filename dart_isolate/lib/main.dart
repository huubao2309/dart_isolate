import 'package:dart_isolate/raise_button_new.dart';
import 'package:dart_isolate/raise_button_old.dart';
import 'package:dart_isolate/rotate_animation.dart';
import 'package:dart_isolate/send_isolate_two_ways.dart';
import 'package:flutter/material.dart';

import 'compute_isolate.dart';
import 'kill_isolate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo IsoLate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo Dart IsoLate"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RotateAnimation(),
              SumButtonComputeNewIsolate(),
            ],
          ),
        ),
      ),
    );
  }
}
