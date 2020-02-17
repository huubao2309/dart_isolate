import 'dart:isolate';

import 'package:flutter/material.dart';

class SumButtonNew2Port extends StatefulWidget {
  @override
  _SumButtonState createState() => _SumButtonState();
}

class _SumButtonState extends State<SumButtonNew2Port> {
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
    // One-Way
    var receivePort = ReceivePort();

    // main isolate
    Isolate.spawn(taskRunner, receivePort.sendPort);

    // listen result 2 Port
    receivePort.listen((msg) {
      print('Port 1: ' + msg[0].toString()); // Result of port 1
      if (msg[1] is SendPort) {
        msg[1].send('From Main Isolate'); // Send for port 2
      }
    });
  }

// 1. Static Function
  static void taskRunner(SendPort sendPort) {
    // two-way
    var receiverPort = ReceivePort();

    receiverPort.listen((data) {
      print('Port 2: $data');
    });

    // new isoLate
    var total = 0.0;
    for (var i = 0; i < 1000000000; i++) {
      total += i;
    }

    // Send 2 Port
    // sendPort.send(total);
    sendPort.send([total, receiverPort.sendPort]);
  }
}
