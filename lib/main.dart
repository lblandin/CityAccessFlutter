
import 'package:CityAccess/menu/mainMenu.dart';
import 'package:CityAccess/screen/onboarding_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu/add.dart';
import 'menu/home.dart';
import 'menu/listActu.dart';
import 'menu/listTerrain.dart';
import 'menu/profil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Access',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool checked;


  @override
  void initState(){
    getPref();
    super.initState();
  }

  getPref() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
      setState(() {
          checked = _prefs.getBool('check') == null ? false : _prefs.getBool('check');
      });
  }



  @override
  Widget build(BuildContext context) {
    return checked == false ? Start()
    : MainMenu();
  }
}


