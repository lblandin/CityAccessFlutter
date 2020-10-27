import 'dart:ui';

import 'package:CityAccess/maps.dart';
import 'package:CityAccess/model/news.dart';
import 'package:CityAccess/model/terrain.dart';
import 'package:CityAccess/rules/basketball.dart';
import 'package:CityAccess/rules/football.dart';
import 'package:CityAccess/rules/handball.dart';
import 'package:CityAccess/rules/volleyball.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Terrain> terrains = [];
  List<News> desNews = [];




  @override
  void initState() {
    DatabaseReference reference = FirebaseDatabase.instance.reference();

    reference.child('Terrain').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      terrains.clear();
      for (var key in keys) {
        Terrain terrain = new Terrain(
            data[key]["id"],
            data[key]["nom"],
            data[key]["description"],
            data[key]["adresse"],
            data[key]["cp"],
            data[key]["ville"],
            data[key]["etat"],
            data[key]["img"],
            data[key]["latitude"],
            data[key]["longitude"]);
        terrains.add(terrain);
      }
      if(mounted){
        setState(() {
          print('lenght terrains: ${terrains.length}');
        });
      }

    });

    reference.child('News').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      desNews.clear();
      for (var key in keys) {
        News news = new News(data[key]["auteur"], data[key]["contenu"],
            data[key]["date"], data[key]["id"], data[key]["titre"]);
        desNews.add(news);
      }
      if(mounted){
        setState(() {
          print('lenght actu: ${desNews.length}');
        });
      }

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      new Text("Trouve ton terrain",
                          style: new TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0)),
                      GestureDetector(
                        child: new Text(
                          "Tous les terrains ici",
                          style: new TextStyle(
                              color: Colors.grey[850], fontSize: 16.0),
                        ),
                        onTap: () {
                              setState(() {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (context) => MyHomePage()));
                              });
                          },
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 75, 175, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: Icon(Icons.location_on,
                          size: 22, color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => Map()));
                    },
                  )
                ],
              ),
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
            child: new Text(
              buttonTitle,
              style: new TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: tintColor),
            ),
          )
        ],
      );
    }

    Widget TerrainList(BuildContext context) {
      return terrains.length <= 0
          ? Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4,
                  vertical: MediaQuery.of(context).size.height * 0.055),
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: terrains.length == 0 ? Center(child: CircularProgressIndicator()) : Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          image: NetworkImage(terrains[index].img),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            terrains[index].nom,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                terrains[index].ville,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              Text(
                                terrains[index].adresse +
                                    " " +
                                    terrains[index].cp.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    }

    Widget ActuList(BuildContext context) {
      return desNews.length <= 0
          ? Container(
              height: MediaQuery.of(context).size.height * 0.20,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4,
                  vertical: MediaQuery.of(context).size.height * 0.055),
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: desNews.length >= 5 ? 5 : desNews.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.60,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(1.0, 3.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          image: new AssetImage('assets/news.jpg'),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                desNews[index].titre,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                desNews[index].date.substring(8, 10) +
                                    "/" +
                                    desNews[index].date.substring(5, 7) +
                                    "/" +
                                    desNews[index].date.substring(0, 4),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            desNews[index].auteur,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
    }

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0, left: 2, top: 3),
                child: Image(
                  image: AssetImage('assets/rules/foot_regles.png'),
                  width: 60,
                  height: 60,
                  color: Colors.black45,
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Image(
                    image: AssetImage('assets/rules/foot_regles.png'),
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => FootballPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0, left: 2, top: 3),
                child: Image(
                  image: AssetImage('assets/rules/basket_regles.png'),
                  width: 60,
                  height: 60,
                  color: Colors.black45,
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Image(
                    image: AssetImage('assets/rules/basket_regles.png'),
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => BasketballPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0, left: 2, top: 3),
                child: Image(
                  image: AssetImage('assets/rules/handball_regles.png'),
                  width: 60,
                  height: 60,
                  color: Colors.black45,
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Image(
                    image: AssetImage('assets/rules/handball_regles.png'),
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => HandballPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0, left: 2, top: 3),
                child: Image(
                  image: AssetImage('assets/rules/volley_regles.png'),
                  width: 60,
                  height: 60,
                  color: Colors.black45,
                ),
              ),
              Container(
                child: GestureDetector(
                  child: Image(
                    image: AssetImage('assets/rules/volley_regles.png'),
                    width: 60,
                    height: 60,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => VolleyballPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(15.0),
      //How to show long text ?
      child: new Text("Toutes les actualités ici",
          style: new TextStyle(color: Colors.grey[850], fontSize: 16.0)),
    );
    //build function returns a "Widget"
    return new MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 125, 0, 1),
          toolbarHeight: 0,
        ),
        body: new ListView(
          children: <Widget>[
            //You can add more widget bellow
            titleSection,
            TerrainList(context),
            fourButtonsSection,
            bottomTextSection,
            ActuList(context)
          ],
        ),
      ),
    ); //Widget with "Material design"
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
