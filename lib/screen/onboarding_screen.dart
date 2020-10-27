import 'package:CityAccess/main.dart';
import 'package:CityAccess/menu/mainMenu.dart';
import 'package:CityAccess/widget/tuto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main() {
// runApp(Start());
//}

class Start extends StatelessWidget {
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
      home: _tuto(),
    );
  }
}

class _tuto extends StatefulWidget {
  @override
  OnboardingScreen createState() => OnboardingScreen();
}

class OnboardingScreen extends State<_tuto> {
  LiquidController liquidController;

  bool _checked = false;


  @override
  initState() {
    liquidController = new LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Tuto(
          "assets/icon/football.png",
          "Un système de recherche élaboré",
          "Plusieurs moyens de recherche sont mis à votre disposition pour trouver le terrain idéal",
          context,
          Color.fromRGBO(94, 255, 137, 1),
          Color.fromRGBO(61, 219, 104, 1),
          Color.fromRGBO(35, 186, 76, 1),
          Color.fromRGBO(13, 145, 49, 1)),
      Tuto(
          "assets/icon/volleyball.png",
          "Trouver le terrain idéal",
          "Trouver facilement et rapidement un terrain de sport près de chez vous",
          context,
          Color.fromRGBO(64, 220, 255, 1),
          Color.fromRGBO(41, 193, 227, 1),
          Color.fromRGBO(19, 160, 191, 1),
          Color.fromRGBO(6, 124, 150, 1)),

      Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color.fromRGBO(255, 245, 61, 1),
                      Color.fromRGBO(245, 234, 44, 1),
                      Color.fromRGBO(230, 218, 28, 1),
                      Color.fromRGBO(217, 205, 11, 1)])),
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
                          image: AssetImage("assets/icon/basketball.png"),
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          "Jouer avec n'importe qui",
                          style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        child: Divider(color: Colors.black, thickness: 1),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          "C'est le moment de faire des rencontres et de découvrir d'autres sports",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.55,
                  child: CheckboxListTile(
                    title: Text("Ne plus afficher"),
                    activeColor: Colors.transparent,
                    checkColor: Colors.white,
                    value: _checked,

                    onChanged: (bool value) {
                      setState((){
                          _checked = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.35,
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    child: Text(
                      "DONE",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                      _prefs.setBool('check', _checked);

                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainMenu()));
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      )

    ];
    return Scaffold(
      body: pages.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: LiquidSwipe(
                liquidController: liquidController,
                pages: pages,
                enableLoop: false,
                fullTransitionValue: 600,
                enableSlideIcon: true,
                waveType: WaveType.circularReveal,
                slideIconWidget: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
    );
  }
}
//  List<PageViewModel> getPages(BuildContext context) {
//    return [
//      PageViewModel(
//        titleWidget: Container(
//          height: MediaQuery.of(context).size.height * 0.6,
//          alignment: Alignment.bottomCenter,
//          child: Text(
//            "Un système de recherche élaboré",
//            style: TextStyle(
//                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//            textAlign: TextAlign.center,
//          ),
//        ),
//        bodyWidget: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Container(
//              alignment: Alignment.center,
//              child: Text(
//                "Plusieurs moyens de recherches sont mis à votre disposition.",
//                style: TextStyle(color: Colors.white),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          ],
//        ),
//        decoration: PageDecoration(
//          boxDecoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("assets/tuto1.jpg"),
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//      ),
//      PageViewModel(
//        titleWidget: Container(
//          height: MediaQuery.of(context).size.height * 0.6,
//          alignment: Alignment.bottomCenter,
//          child: Text(
//            "Trouvez le terrain idéal",
//            style: TextStyle(
//                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//            textAlign: TextAlign.center,
//          ),
//        ),
//        bodyWidget: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Container(
//              alignment: Alignment.center,
//              child: Text(
//                "Trouvez facilement un terrain de port proche de chez vous.",
//                style: TextStyle(color: Colors.white),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          ],
//        ),
//        decoration: PageDecoration(
//          boxDecoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("assets/tuto2.jpg"),
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//      ),
//      PageViewModel(
//        titleWidget: Container(
//          height: MediaQuery.of(context).size.height * 0.6,
//          alignment: Alignment.bottomCenter,
//          child: Text(
//            "Jouez avec n'importe qui",
//            style: TextStyle(
//                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//            textAlign: TextAlign.center,
//          ),
//        ),
//        bodyWidget: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//            Container(
//              alignment: Alignment.center,
//              child: Text(
//                "C'est le moment de faire des rencontres et de découvrir d'autres sports.",
//                style: TextStyle(color: Colors.white),
//                textAlign: TextAlign.center,
//              ),
//            ),
//          ],
//        ),
//        decoration: PageDecoration(
//          boxDecoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("assets/tuto3.jpg"),
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//      ),
//    ];
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: IntroductionScreen(
//        globalBackgroundColor: Colors.transparent,
//        pages: getPages(context),
//        skipFlex: 0,
//        nextFlex: 0,
//        dotsDecorator: DotsDecorator(
//          activeColor: Colors.white,
//          activeSize: Size.square(15.0),
//          size: Size.square(10.0),
//          color: Colors.black87,
//        ),
//        done: Text(
//          "Done",
//          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//        ),
//        onDone: () {
//          Navigator.push(context,
//              new MaterialPageRoute(builder: (context) => MyHomePage()));
//        },
//      ),
//    );
