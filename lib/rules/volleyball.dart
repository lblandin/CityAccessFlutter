import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolleyballPage extends StatefulWidget{
  @override
  _VolleyballPageState createState() => _VolleyballPageState();
}

class _VolleyballPageState extends State<VolleyballPage> {

  RulesModel rm1 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm2 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm3 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm4 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm5 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");

  List<RulesModel> volleyRules = [];

  @override
  void initState() {

    volleyRules.add(rm5);
    volleyRules.add(rm4);
    volleyRules.add(rm3);
    volleyRules.add(rm2);
    volleyRules.add(rm1);


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            body: RulesWidget(context, "assets/bg_news.jpg", "Règles de Volleyball", volleyRules)
        )
    );//Widget with "Material design"
  }
}