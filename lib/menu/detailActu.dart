// import 'package:CityAccess/Other/FadeAnimation.dart';
// import 'package:CityAccess/model/news.dart';
// import 'package:CityAccess/model/terrain.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class DetailActuPage extends StatefulWidget {
//   DetailActuPage({this.app, this.id});
//
//   final FirebaseApp app;
//   int id;
//
//   @override
//   _DetailActuPage createState() => _DetailActuPage();
// }
//
// class _DetailActuPage extends State<DetailActuPage> {
//   List<News> desNews = [];
//
//   @override
//   void initState() {
//     DatabaseReference reference = FirebaseDatabase.instance.reference();
//     reference.child('News').once().then((DataSnapshot snapshot) {
//       var keys = snapshot.value.keys;
//       var data = snapshot.value;
//       desNews.clear();
//       for (var key in keys) {
//         News news = new News(
//             data[key]["auteur"],
//             data[key]["contenu"],
//             data[key]["date"],
//             data[key]["id"],
//             data[key]["titre"]);
//         desNews.add(news);
//       }
//       setState(() {
//         print('lenght : ${desNews.length}');
//       });
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height * 0.4,
//                 decoration: BoxDecoration(
//                   //borderRadius: BorderRadius.circular(30.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       offset: Offset(0.0, 2.0),
//                       blurRadius: 6.0,
//                     ),
//                   ],
//                 ),
//                 child: Hero(
//                     tag: "assets/bg_news.jpg",
//                     child: ClipRRect(
//                       //borderRadius: BorderRadius.circular(30.0),
//                       child: ColorFiltered(
//                         colorFilter:
//                         ColorFilter.mode(Colors.black38, BlendMode.darken),
//                         child: Image(
//                           image: AssetImage("assets/bg_news.jpg"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     )),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       iconSize: 30.0,
//                       color: Colors.white,
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     Row(
//                       children: <Widget>[
//                         IconButton(
//                           icon: Icon(Icons.search),
//                           iconSize: 30.0,
//                           color: Colors.white,
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.favorite),
//                           iconSize: 25.0,
//                           color: Colors.white,
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.arrow_back),
//                           iconSize: 25.0,
//                           color: Colors.white,
//                           onPressed: () => Navigator.pop(context),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 left: 20.0,
//                 bottom: 20.0,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       desNews[widget.id].titre,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 35.0,
//                         fontWeight: FontWeight.w600,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                     Row(
//                       children: <Widget>[
// //                        Icon(
// //                          Icons.location_on,
// //                          size: 15.0,
// //                          color: Colors.white70,
// //                        ),
//                         SizedBox(width: 5.0),
//                         Text(
//                             desNews[widget.id].date.substring(8, 10) +
//                                 "/" +
//                                 desNews[widget.id].date.substring(5, 7) +
//                                 "/" +
//                                 desNews[widget.id].date.substring(0, 4),
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 20.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
// //              Positioned(
// //                right: 20.0,
// //                bottom: 20.0,
// //                child: Icon(
// //                  Icons.location_on,
// //                  color: Colors.white70,
// //                  size: 25.0,
// //                ),
// //              ),
//             ],
//           ),
//           Expanded(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           child: Row(
//                             children: <Widget>[
//                               Text(
//                                 "Contenu : ",
//                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                               ),
//                               Text(
//                                 desNews[widget.id].contenu,
//                                 style: TextStyle(fontSize: 24),
//                               ),
//                             ]
//                           ),
//                           ),
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Text(
//                           "Auteur : ",
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
//                       ),
//                       Text(
//                         desNews[widget.id].auteur,
//                         style: TextStyle(fontSize: 18),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
