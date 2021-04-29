import 'package:CityAccess/model/rulesModel.dart';
import 'package:CityAccess/widget/rulesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VolleyballPage extends StatefulWidget{
  @override
  _VolleyballPageState createState() => _VolleyballPageState();
}

class _VolleyballPageState extends State<VolleyballPage> {

  RulesModel rm1 = new RulesModel("But du jeu", "assets/icon/volleyball.png",
      "Faire tomber la balle dans le camp adverse en 3 touches maximum, sans pour autant qu'elle ne revienne. L’équipe qui remporte l’échange marque un point.");
  RulesModel rm2 = new RulesModel("Gagner un set", "assets/icon/volleyball-with-hands.png",
      "Un set est gagné par l’équipe qui marque 25 points, avec un écart de 2 points");
  RulesModel rm3 = new RulesModel("Gagner le match", "assets/icon/beach-volleyball.png",
      "Le match est gagné par l’équipe qui remporte 3 sets. En cas d’égalité à 2 sets partout, le 5ème set (tie-break) est joué en 15 points avec 2 points d’écart.");
  RulesModel rm4 = new RulesModel("Frapper la balle", "assets/icon/volleyball_person.png",
      "On peut frapper la balle avec toutes les parties du corps (y compris le pied), sauf au service. 3 touches successives maximum par équipe.");
  RulesModel rm5 = new RulesModel("Service", "assets/icon/volleyball-player.png",
      "Le  serveur  attend  le  coup  de  sifflet  de  l’arbitre  pour  frapper la balle à une main. Il doit servir à son premier lancer de balle et ne peut  pas laisser tomber le ballon. Il peut servir sur toute la largeur du terrain, il doit être derrière la ligne sans marcher dessus avant la frappe. Le serveur a 8 secondes pour servir après le coup de sifflet.");
  RulesModel rm6 = new RulesModel("Au filet", "assets/icon/volleyball_aufilet.png",
      "On ne peut pas toucher le filet avec les mains.");
  RulesModel rm7 = new RulesModel("Les positions", "assets/icon/volleyball-position.png",
      "Les joueurs tournent au service (changent de place) dans le sens des aiguilles d’une montre. La position des joueurs est déterminée par leur numéro  de poste : "
          "- les avants (joueurs 2-3-4) "
          "- les arrières (joueurs 1-5-6)");
  RulesModel rm8 = new RulesModel("Les temps-morts", "assets/icon/referee.png",
      "Pour les sets 1 à 4 :"
          "- il y aura 2 temps-morts techniques automatiques de 60 secondes par set dès que la première des deux équipes atteint 8  puis 16 points."
      "- il y aura 2 temps-morts de 30 secondes possibles, choisis par le coach de chaque équipe."
      "Pour le set 5 : 2 temps- morts possibles de 30 secondes choisis par le coach de chaque équipe.  Pas de temps- morts techniques."
      "3 minutes de pause entre chaque set.");
  RulesModel rm9 = new RulesModel("Le libero", "assets/icon/libero.png",
      "Chaque  équipe peut éventuellement utiliser un joueur défensif spécifique : le LIBERO. Il porte un maillot distinctif.");

  List<RulesModel> volleyRules = [];

  @override
  void initState() {

    volleyRules.add(rm1);
    volleyRules.add(rm2);
    volleyRules.add(rm3);
    volleyRules.add(rm4);
    volleyRules.add(rm5);
    volleyRules.add(rm6);
    volleyRules.add(rm7);
    volleyRules.add(rm8);
    volleyRules.add(rm9);


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "",
        home: new Scaffold(
            body: RulesWidget(context, "assets/volleyball_court.jpg", "Règles de Volleyball", volleyRules)
        )
    );//Widget with "Material design"
  }
}