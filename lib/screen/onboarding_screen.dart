import 'package:CityAccess/main.dart';
import 'package:CityAccess/widget/tuto.dart';
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

//final pages = [
//  Tuto("assets/tuto1.jpg", "Un système de recherche élaboré", "Plusieurs moyens de recherches sont mis à votre disposition"),
//  Tuto("assets/tuto2.jpg", "Un système de recherche élaboré", "Plusieurs moyens de recherches sont mis à votre disposition"),
//  Tuto("assets/tuto3.jpg", "Un système de recherche élaboré", "Plusieurs moyens de recherches sont mis à votre disposition"),
//];

class OnboardingScreen extends State<_tuto> {

//  LiquidController liquidController;
//
//
//  int index = 1;
//
//  @override
//  initState() {
//    liquidController = new LiquidController();
//    index = 1;
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: Container(
//        child: LiquidSwipe(
//          liquidController: liquidController,
//          initialPage: 0,
//          pages: pages,
//          enableLoop: false,
//          fullTransitionValue: 600,
//          enableSlideIcon: true,
//          waveType: WaveType.circularReveal,
//
//        ),
//      ),
//    );
//  }
//
//  changeIndex() {
//    setState(() {
//      index = liquidController.currentPage;
//    });
//  }

  List<PageViewModel> getPages(BuildContext context) {
    return [
      PageViewModel(
        titleWidget: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.6,
          alignment: Alignment.bottomCenter,
          child: Text(
            "Un système de recherche élaboré",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Plusieurs moyens de recherches sont mis à votre disposition.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tuto1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.6,
          alignment: Alignment.bottomCenter,
          child: Text(
            "Trouvez le terrain idéal",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "Trouvez facilement un terrain de port proche de chez vous.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tuto2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      PageViewModel(
        titleWidget: Container(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.6,
          alignment: Alignment.bottomCenter,
          child: Text(
            "Jouez avec n'importe qui",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                "C'est le moment de faire des rencontres et de découvrir d'autres sports.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: PageDecoration(
          boxDecoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/tuto3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        pages: getPages(context),
        skipFlex: 0,
        nextFlex: 0,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          activeSize: Size.square(15.0),
          size: Size.square(10.0),
          color: Colors.black87,
        ),
        done: Text(
          "Done",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onDone: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => MyHomePage()));
        },
      ),
    );
  }
}
//}