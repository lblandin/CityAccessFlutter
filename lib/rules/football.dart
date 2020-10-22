import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FootballPage extends StatefulWidget{
  @override
  _FootballPageState createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  @override
  Widget build(BuildContext context) {
//    Widget btnreturn = new Container(
//      padding: EdgeInsets.all(10),
//      child: GestureDetector(
//        child: Container(
//          padding: EdgeInsets.all(7),
//          decoration: BoxDecoration(
//            color: Color.fromRGBO(50, 75, 175, 1),
//            borderRadius: BorderRadius.circular(20),
//            boxShadow: <BoxShadow>[
//              BoxShadow(
//                color: Colors.black38,
//                offset: Offset(1.0, 2.0),
//                blurRadius: 3.0,
//              ),
//            ],
//          ),
//          child:
//          Icon(Icons.arrow_back, size: 22, color: Colors.white),
//        ),
//        onTap: () {
////          Navigator.push(context,
////              new MaterialPageRoute(builder: (context) => MyApp()));
//        },
//      ),
//    );
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Règles de football",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sodales auctor libero sit amet pulvinar. 
      Nulla facilisi. Vestibulum aliquam auctor aliquet. Quisque egestas ullamcorper venenatis. Aliquam condimentum tortor 
      eget dolor tempus, ut scelerisque nibh tristique. Pellentesque metus erat, dapibus nec sapien sit amet, congue rutrum 
      mi. Etiam ligula sapien, cursus interdum semper sit amet, mollis eu mauris. Integer nec egestas mauris, id scelerisque 
      libero. Ut nibh purus, accumsan id ultricies id, gravida nec turpis. Suspendisse et facilisis diam.''',
          style: new TextStyle(
            color: Colors.grey[850],
            fontSize: 16.0,
          )
      ),
    );
    final bottomSecondTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam sodales auctor libero sit amet pulvinar. 
      Nulla facilisi. Vestibulum aliquam auctor aliquet. Quisque egestas ullamcorper venenatis. Aliquam condimentum tortor 
      eget dolor tempus, ut scelerisque nibh tristique. Pellentesque metus erat, dapibus nec sapien sit amet, congue rutrum 
      mi. Etiam ligula sapien, cursus interdum semper sit amet, mollis eu mauris. Integer nec egestas mauris, id scelerisque 
      libero. Ut nibh purus, accumsan id ultricies id, gravida nec turpis. Suspendisse et facilisis diam.''',
          style: new TextStyle(
              color: Colors.grey[850],
              fontSize: 16.0
          )
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
        title: "",
        home: new Scaffold(
            body: new ListView(
              children: <Widget>[
                //You can add more widget bellow
                //btnreturn,
                titleSection,
                bottomTextSection,
                bottomSecondTextSection
              ],
            )
        )
    );//Widget with "Material design"
  }
}