import 'dart:isolate';

import 'package:flutter/material.dart';

class SumButtonKillNewIsolate extends StatefulWidget {
  @override
  _SumButtonState createState() => _SumButtonState();
}

class _SumButtonState extends State<SumButtonKillNewIsolate> {
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

  void createNewIsolate() async {
    // One-Way
    var receivePort = ReceivePort();

    // main isolate
    var newIsolate = await Isolate.spawn(taskRunner, receivePort.sendPort);

    // After 1s will kill isolate
    Future.delayed(Duration(seconds: 1), () {
      newIsolate.kill(priority: Isolate.immediate);
      newIsolate = null;
      print('Isolate is killed after 1s!');
    });

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

    // if you don't want to listen stream => Close Stream
    //receiverPort.close();

    // new isoLate with run on 2s
    var total = 0.0;
    for (var i = 0; i < 100000000000000; i++) {
      total += i;
    }

    // Send 2 Port
    // sendPort.send(total);
    sendPort.send([total, receiverPort.sendPort]);
  }
}
