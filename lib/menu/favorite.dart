import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget{
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 125, 0, 1),
          toolbarHeight: 0,
        ),
        body: Container(
          child: Text("Favorite Page"),
        )
    );

  }

}