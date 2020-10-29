import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandballPage extends StatefulWidget{
  @override
  _HandballPageState createState() => _HandballPageState();
}

class _HandballPageState extends State<HandballPage> {

  RulesModel rm1 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm2 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm3 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm4 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm5 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");

  List<RulesModel> handRules = [];

  @override
  void initState() {

    handRules.add(rm5);
    handRules.add(rm4);
    handRules.add(rm3);
    handRules.add(rm2);
    handRules.add(rm1);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: "",
        home: new Scaffold(
            body: RulesWidget(context, "assets/stade.jpg", "Règles de Handball", handRules)
        )
    );//Widget with "Material design"
  }
}