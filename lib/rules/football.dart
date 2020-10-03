import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballPage extends StatefulWidget{
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Text("Football rules Page"),
        )
    );
  }
}