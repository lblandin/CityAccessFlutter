import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Tuto(String image, String title, String description) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          image
        )
      )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Color(0xFFA1B6CC),
                ),
              ),
              Text(
                description,
                style: TextStyle(
                    fontSize: 50.0,
                    color: Color(0xFF3A342D),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Divider(color: Colors.black38),
            ],
          ),
        )
      ],
    ),
  );
}