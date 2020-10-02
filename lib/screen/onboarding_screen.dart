import 'package:CityAccess/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';

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
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final pageDecoration = PageDecoration(
    titleTextStyle:
    PageDecoration().titleTextStyle.copyWith(color: Colors.black),
    bodyTextStyle: PageDecoration().bodyTextStyle.copyWith(color: Colors.black),
    contentPadding: const EdgeInsets.all(10),
  );

  List<PageViewModel> getPages() {
    return [
      PageViewModel(
          image: Image.asset("assets/illustration.png"),
          title: "Un système de recherche élaboré",
          body: "Plusieurs moyens de recherches sont mis à votre disposition.",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/illustration.png"),
          title: "Trouvez le terrain idéal",
          body: "Trouvez facilement un terrain de sport proche de chez vous.",
          decoration: pageDecoration),
      PageViewModel(
          image: Image.asset("assets/illustration.png"),
          title: "Jouer avec n'importe qui",
          body: "C'est le moment de faire des rencontres et de découvrir d'autres sports.",
          decoration: pageDecoration),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        pages: getPages(),
        done: Text(
          "Done",
          style: TextStyle(color: Colors.black),
        ),
        onDone: () {
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => MyHomePage()
          ));
        },
      ),
    );
  }
}