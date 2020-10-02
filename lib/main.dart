
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'menu/add.dart';
import 'menu/home.dart';
import 'menu/listActu.dart';
import 'menu/listTerrain.dart';
import 'menu/profil.dart';

//void main() {
//  runApp(MyApp());
//}

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
      home: MyHomePage(title: 'City Access Home Page'),
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
  int _pageIndex = 2;

  final HomePage homePage = new HomePage();
  final ListTerrainPage listTerrainPage = new ListTerrainPage();
  final ListActuPage listActuPage = new ListActuPage();
  final ProfilPage profilPage = new ProfilPage();
  final AddPage addPage = new AddPage();

  Widget _showPage = new HomePage();

  Widget _PageChooser(int page) {
    switch (page) {
      case 0:
        return listTerrainPage;
        break;
      case 1:
        return listActuPage;
        break;
      case 2:
        return homePage;
        break;
      case 3:
        return profilPage;
        break;
      case 4:
        return addPage;
        break;
      default:
        return new Container(
          child: new Center(
            child: new Text(
              "No Page Found "
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.white,
        height: 58,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        index: _pageIndex,
        items: <Widget>[
          Icon(Icons.dehaze, size: 25, color: Colors.white),
          Icon(Icons.library_books, size: 25, color: Colors.white),
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.person, size: 25, color: Colors.white),
          Icon(Icons.add, size: 25, color: Colors.white),
        ],
        onTap: (index) {
          debugPrint("Currend index is $index");
          setState(() {
            _showPage = _PageChooser(index);
          });
        },
      ),
    );
  }
}
