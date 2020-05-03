import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            color: Colors.blueGrey,
            child: Center(
              child: Image(
                image: AssetImage('images/welcome.png'),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text('Rich kid')),
          backgroundColor: Colors.black,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.airplanemode_active),
        ),
      ),
    );
  }
}
