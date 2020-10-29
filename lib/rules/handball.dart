import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandballPage extends StatefulWidget{
  @override
  _HandballPageState createState() => _HandballPageState();
}

class _HandballPageState extends State<HandballPage> {

  RulesModel rm1 = new RulesModel("Les arbitres", "assets/icon/referee.png",
      "Arbitrage en double conseillé. Les arbitres sont maîtres du jeu et doivent être respectés de tous.");
  RulesModel rm2 = new RulesModel("Les joueurs", "assets/icon/soccer-player.png",
      "6 joueurs de champ plus un gardien de but. Les changements de joueurs se font par le centre du terrain.");
  RulesModel rm3 = new RulesModel("Le but", "assets/icon/jumping.png",
      "Le ballon doit avoir entièrement dépassé la ligne de but. Quand il y a but, l’arbitre de zone siffle 2 fois");
  RulesModel rm4 = new RulesModel("La conduite du ballon", "assets/icon/handball_ball.png",
      "3 pas sont autorisés. Le dribble doit être dirigé du haut vers le bas.");
  RulesModel rm5 = new RulesModel("La remise en jeu", "assets/icon/handball-court.png",
      "Le joueur qui fait la remise en jeu doit avoir un pied sur la ligne. Il peut shooter directement. L’adversaire doit être à 3 m du ballon.");
  RulesModel rm6 = new RulesModel("Le jet franc", "assets/icon/handball_jet.png",
      "Correspond au lanc-franc du football");
  RulesModel rm7 = new RulesModel("Le jet de 7 mètres", "assets/icon/handball_player.png",
      "Penalty");


  List<RulesModel> handRules = [];

  @override
  void initState() {

    handRules.add(rm1);
    handRules.add(rm2);
    handRules.add(rm3);
    handRules.add(rm4);
    handRules.add(rm5);
    handRules.add(rm6);
    handRules.add(rm7);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        title: "",
        home: new Scaffold(
            body: RulesWidget(context, "assets/handball_court.jpg", "Règles de Handball", handRules)
        )
    );//Widget with "Material design"
  }
}