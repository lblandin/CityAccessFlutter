import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballPage extends StatefulWidget {
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  RulesModel rm1 = new RulesModel("5 vs 5", "assets/icon/team-bench.png",
      "Le foot à 5 se joue à 5 contre 5. Vous êtes libre de jouer à plus ou moins de joueurs sur le terrain.");
  RulesModel rm2 = new RulesModel("Auto arbitrage", "assets/icon/whistle.png",
      "Le five à pour principe l’auto-arbitrage. Chaque équipe doit donc faire acte de FAIR-PLAY, de COMPRÉHENSION et de RESPECT afin que les matchs se déroulent dans les meilleures conditions.");
  RulesModel rm3 = new RulesModel("Les contacts",
      "assets/icon/martial-arts.png", "Les charges et contacts sont à éviter.");
  RulesModel rm4 = new RulesModel(
      "Hors-jeu", "assets/icon/offside.png", "Il n’y a pas de hors jeu.");
  RulesModel rm5 = new RulesModel(
      "Corners", "assets/icon/soccer.png", "Il n’y a pas de corners.");
  RulesModel rm6 = new RulesModel("Le jeu", "assets/icon/football.png",
      "les panneaux de 1 mètre de haut entourant le terrain font partie du jeu. Dès que le ballon touche les filets latéraux ou de toit, il est remis en jeu par le gardien adverse.");
  RulesModel rm7 = new RulesModel("Le jeu au sol", "assets/icon/forbidden.png",
      "Le jeu au sol est interdit, chaque joueur doit rester sur ses appuis. Les tacles sont interdits.");
  RulesModel rm8 = new RulesModel("Durée de match",
      "assets/icon/chronometer.png", "La durée d’un match est d’une heure.");
  RulesModel rm9 = new RulesModel("Fautes", "assets/icon/yellow-card.png",
      "Les fautes simples sont sanctionnées par une relance du gardien adverse et d’un penalty au bout de trois fautes : tout accrochage aux filets et aux parois, faute de main involontaire, jeu à terre, obstruction/poussée. Les fautes graves sont sanctionnées par un penalty : tacles / jeu dangereux, provocation, antijeu.");
  RulesModel rm10 = new RulesModel(
      "Gardien du but",
      "assets/icon/goalkeeper.png",
      "La peut prendre le ballon à la main à l’intérieur de sa surface. Il ne peut cependant pas prendre le ballon à la main suite à une passe volontaire de son équipe. Le gardien ne peut pas sortir de sa surface pour jouer au pied = Pénalty ! ");
  RulesModel rm11 = new RulesModel(
      "Remise en jeu",
      "assets/icon/football-icon.png",
      "La remise en jeu suite à un but se fait du gardien.");

  List<RulesModel> footRules = [];

  @override
  void initState() {
    footRules.addAll([rm1, rm2, rm3, rm4, rm5, rm6, rm7, rm8, rm9, rm10, rm11]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: RulesWidget(context, "assets/stade.jpg", "Règles de Football",
            footRules)); //Widget with "Material design"
  }
}
