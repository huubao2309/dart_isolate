import 'dart:isolate';

import 'package:flutter/material.dart';

class SumButtonNew extends StatefulWidget {
  @override
  _SumButtonState createState() => _SumButtonState();
}

class _SumButtonState extends State<SumButtonNew> {
  double resultValue = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () {
          createNewIsolate();
        },
        child: Text('Click'),
      ),
    );
  }

  void createNewIsolate() {
    // entryPoint can be:
    // 1. static function: in class with keywork: "static"
    // 2. top function: level as main()

    // Receive Port
    var receivePort = ReceivePort();

    // main isolate
    Isolate.spawn(taskRunner, receivePort.sendPort);

    // listen result Port
    receivePort.listen((data) {
      resultValue = data;
      print(data);
    });
  }

// 1. Static Function
  static void taskRunner(SendPort sendPort) {
    // new isoLate
    var total = 0.0;
    print('total: $total');
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }

    // Send Port
    sendPort.send(total);
  }
}
