import 'package:CityAccess/maps.dart';
import 'package:CityAccess/rules/basketball.dart';
import 'package:CityAccess/rules/football.dart';
import 'package:CityAccess/rules/handball.dart';
import 'package:CityAccess/rules/volleyball.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Trouve ton terrain",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      )),
                ),
                //Need to add space below this Text ?
                new Text("Tout les terrains ici",
                  style: new TextStyle(
                      color: Colors.grey[850],
                      fontSize: 16.0
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text(buttonTitle, style: new TextStyle(fontSize: 16.0,
                fontWeight: FontWeight.w600, color: tintColor),),
          )
        ],
      );
    }
    Widget ButtonsMapSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => Map()
              ));
            }
          )
        ],
      ),
    );
    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => HandballPage()
              ));
            }
          ),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => FootballPage()
                ));
              }
          ),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => BasketballPage()
                ));
              }
          ),
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => VolleyballPage()
                ));
              }
          ),
        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text(''' Toutes les actualités ici ''',
          style: new TextStyle(
              color: Colors.grey[850],
              fontSize: 16.0
          )
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            body: new ListView(
              children: <Widget>[
                //You can add more widget bellow
                titleSection,
                ButtonsMapSection,
                fourButtonsSection,
                bottomTextSection
              ],
            )
        )
    );//Widget with "Material design"
  }
}

//class _HomePageState extends State<HomePage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Container(
//      child:
//      IconButton(
//        icon: Icon(Icons.map),
//        onPressed: () {
//          Navigator.push(context, new MaterialPageRoute(
//              builder: (context) => Map()
//          ));
//        }
//      ),
//      )
//    );
//  }
//}