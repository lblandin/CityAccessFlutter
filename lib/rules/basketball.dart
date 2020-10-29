import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasketballPage extends StatefulWidget {
  @override
  _BasketballPageState createState() => _BasketballPageState();
}

class _BasketballPageState extends State<BasketballPage> {

  RulesModel rm1 = new RulesModel("3v3 ou 5v5", "assets/icon/basketball-court.png", "Le basket peut se jouer en 3v3 ou 5v5");
  RulesModel rm2 = new RulesModel("Marcher", "assets/icon/marcher.png",
      "Vous ne pouvez pas faire plus de 2 pas au basket sous peine de faire un marcher");
  RulesModel rm3 = new RulesModel("Durée", "assets/icon/chronometer.png",
      "La durée d'un match est divisé en 4 quart-temps de 10min ou en 3v3 une partie dure 10min");
  RulesModel rm4 = new RulesModel("Les points", "assets/icon/points.png",
      "Un point derrière l'arc vaut 3 points sinon il vaut 2 points et un lancer-franc en vaut 1. En 3x3 le panier derrière l'arc vaut 2 et sinon 1 point");
  RulesModel rm5 = new RulesModel("Les contacts", "assets/icon/martial-arts.png", "Les contacts sont à éviter sous peines de fautes");
  RulesModel rm6 = new RulesModel("Retour en zone", "assets/icon/basketball.png",
      "Après avoir passé la moitué de terrain on ne peut plus retourner dans notre moitié de terrain");
  RulesModel rm7 = new RulesModel("3 sec dans la raquette", "assets/icon/basketball_ball.png",
      "Il est interdit de rester plus de 3 secondes dans la raquette");
  RulesModel rm8 = new RulesModel("Reprise de dribble", "assets/icon/balle.png",
      "Il est interdit de, après avoir commencé à drobbler, stopper son dribble et de le reprendre ensuite");
  RulesModel rm9 = new RulesModel("Portée de balle", "assets/icon/balle.png", "Il est interdit de porter la balle");
  RulesModel rm10 = new RulesModel("Le 3v3", "assets/icon/basketball.png",
      "A savoir, en 3v3 les règles sont souvent maison en fonction du terrain et des joueurs");

  List<RulesModel> basketRules = [];

  @override
  void initState() {

    basketRules.add(rm1);
    basketRules.add(rm2);
    basketRules.add(rm3);
    basketRules.add(rm4);
    basketRules.add(rm5);
    basketRules.add(rm6);
    basketRules.add(rm7);
    basketRules.add(rm8);
    basketRules.add(rm9);
    basketRules.add(rm10);

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
