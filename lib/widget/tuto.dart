import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

Widget Tuto(
    String img,
    String title,
    String description,
    bool done,
    BuildContext context,
    Color color1,
    Color color2,
    Color color3,
    Color color4) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color1, color2, color3, color4])),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30),
                child: Image(
                  image: AssetImage(img),
                  width: MediaQuery.of(context).size.width * 0.3,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 30,
                height: 30,
                child: Divider(color: Colors.black),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        done
            ? Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Text(
                    "DONE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                ),
              )
            : Container(),
      ],
    ),
  );
}
