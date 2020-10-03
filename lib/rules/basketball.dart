import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketballPage extends StatefulWidget{
  @override
  _BasketballPageState createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text("Basketball rules Page"),
        )
    );
  }
}