import 'package:CityAccess/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(Start());
}

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

class _tuto extends StatefulWidget{
  @override
  OnboardingScreen createState() => OnboardingScreen();

}

class OnboardingScreen extends State<_tuto> {
  List<String> desBg = [
    "assets/tuto1.jpg",
    "assets/tuto2.jpg",
    "assets/tuto3.jpg",
  ];

  LiquidController liquidController;



  @override
  initState(){
    liquidController = new LiquidController();
    super.initState();
  }

  final pages = [
    Container(
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
                  "Planet",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFFA1B6CC),
                  ),
                ),
                Text(
                  "Mercury",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFF3A342D),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Divider(color: Colors.black38),
                Text(
                  "The smallest and fastest planet,\nMercury is the "
                      "closest planet to the Sun \nand whips around it "
                      "every \n88 Earth days",
                  style: TextStyle(
                      color: Color(0xFFA1B6CC),
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(
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
                  "Planet",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFFA1B6CC),
                  ),
                ),
                Text(
                  "Venus",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFFE8BB57),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Divider(color: Color(0xFFE8BB57)),
                Text(
                  "Spinning in the opposite direction \n"
                      "to most planets, Venus is the  \n"
                      "hottest planet, and one of the"
                      "and one of the \n"
                      "brightest objects in the sky",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    ),
    Container(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Planet",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Color(0xFFA1B6CC),
                  ),
                ),
                Text(
                  "Earth",
                  style: TextStyle(
                      fontSize: 50.0,
                      color: Color(0xFF888C76),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Divider(color: Colors.blueGrey),
                Text(
                  "The place we call home, \nEarth is the third rock\n"
                      "from the sun and the only planet\n"
                      "with known life on it",
                  style: TextStyle(
                      color: Color(0xFFD4D4D2),
                      fontWeight: FontWeight.w300,
                      fontSize: 16.0),
                )
              ],
            ),
          )
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        child: LiquidSwipe(
          liquidController: liquidController,
          initialPage: 0,
          pages: pages,
          enableLoop: false,
          fullTransitionValue: 600,
          enableSlideIcon: true,
          waveType: WaveType.circularReveal,

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
