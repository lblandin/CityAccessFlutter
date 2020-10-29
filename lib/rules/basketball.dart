import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketballPage extends StatefulWidget {
  @override
  _BasketballPageState createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {

  RulesModel rm1 = new RulesModel("First Rules", "assets/icon/basketball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm2 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm3 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm4 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");
  RulesModel rm5 = new RulesModel("First Rules", "assets/icon/volleyball.png", "lkjhgfvbnkiugvbn,lj");

  List<RulesModel> basketRules = [];

  @override
  void initState() {

    basketRules.add(rm5);
    basketRules.add(rm4);
    basketRules.add(rm3);
    basketRules.add(rm2);
    basketRules.add(rm1);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          /*body: new ListView(
              children: <Widget>[
                //You can add more widget bellow
                titleSection,
                bottomTextSection,
                bottomSecondTextSection
              ],
            )*/
          body: RulesWidget(context, "assets/bg_news.jpg", "Règles de Basketball", basketRules)
        )); //Widget with "Material design"
  }
  
}
