import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListActuPage extends StatefulWidget{
  ListActuPage({this.app});

  final FirebaseApp app;

  @override
  _ListActuPageState createState() => _ListActuPageState();
}

class _ListActuPageState extends State<ListActuPage> {
  final refDatabase = FirebaseDatabase.instance;

  final ActuName = 'nom';
  DatabaseReference _actuRef;

  @override
  void initState() {
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _actuRef = database.reference().child("News");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: FirebaseAnimatedList(
              shrinkWrap: true,
              query: _actuRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return new Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.value['titre'],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              snapshot.value['auteur'],
                            ),
                            Text(
                              snapshot.value['date']
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _actuRef.child(snapshot.key).remove(),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}