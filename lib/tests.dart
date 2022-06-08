import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  final _myStream = StreamController<String>.broadcast();

  Home() {
    print(3333333333);
  }


  @override
  Widget build(BuildContext context) {
    print(222222222);
    _myStream.stream.listen((event) {
      print(event);
    });
    return Center(
      child: TextButton(
        onPressed: () {
          _myStream.sink.add("111111111111");
        },
        child: const Text("Press"),
      ),
    );
  }
}
