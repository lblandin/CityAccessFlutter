import 'package:CityAccess/model/news.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'detailActu.dart';

class ListActuPage extends StatefulWidget{
  ListActuPage({this.app});

  final FirebaseApp app;

  @override
  _ListActuPageState createState() => _ListActuPageState();
}

class _ListActuPageState extends State<ListActuPage> {
  List<News> desNews = [];

  @override
  void initState() {
    DatabaseReference reference = FirebaseDatabase.instance.reference();
    reference.child('News').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      desNews.clear();
      for (var key in keys) {
        News news = new News(
            data[key]["auteur"],
            data[key]["contenu"],
            data[key]["date"],
            data[key]["id"],
            data[key]["titre"]);
        desNews.add(news);
      }
      setState(() {
        print('lenght : ${desNews.length}');
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: desNews.length == 0
            ? Center(
          child: Text("Loading..."),
        )
            : CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            actions: [
              Icon(
                Icons.search,
              ),
              SizedBox(width: 10,)
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Liste des Actualités",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              background: Image.asset(
                "assets/bg_news.jpg",
                color: Colors.black54,
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: GestureDetector(
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    desNews[index].titre,
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(desNews[index].date.substring(8, 10) +
                                      "/" +
                                      desNews[index].date.substring(5, 7) +
                                      "/" +
                                      desNews[index].date.substring(0, 4)),
                                  Text(desNews[index].auteur),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailActuPage(id: index)));
                    },
                ),
              ),
              childCount : desNews.length,
            ),
          )
        ]));
  }
}
