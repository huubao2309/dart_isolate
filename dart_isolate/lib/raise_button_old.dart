import 'package:flutter/material.dart';

class SumButtonOld extends StatefulWidget {
  @override
  _SumButtonState createState() => _SumButtonState();
}

class _SumButtonState extends State<SumButtonOld> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RaisedButton(
        onPressed: () {
          sum().then((result) {
            print(result);
          });
        },
        child: Text('Click'),
      ),
    );
  }
}

Future<int> sum() async {
  var total = 0;
  for (var i = 0; i < 1000000000000; i++) {
    total += i;
  }
  return total;
}
