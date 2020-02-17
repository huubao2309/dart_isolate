import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SumButtonComputeNewIsolate extends StatefulWidget {
  @override
  _SumButtonState createState() => _SumButtonState();
}

class _SumButtonState extends State<SumButtonComputeNewIsolate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () {
          demoCompute();
        },
        child: Text('Click'),
      ),
    );
  }

  Future<void> demoCompute() async {
    // Calculate a new value
    var result = await compute(calutate, 5);
    print(result);
  }

  static int calutate(int number) {
    return number * 10;
  }
}
