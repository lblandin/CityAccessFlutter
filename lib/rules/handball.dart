import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandballPage extends StatefulWidget{
  @override
  _HandballPageState createState() => _HandballPageState();
}

class _HandballPageState extends State<HandballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text("Handball rules Page"),
        )
    );
  }
}