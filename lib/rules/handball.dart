import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HandballPage extends StatefulWidget{
  @override
  _HandballPageState createState() => _HandballPageState();
}

class _HandballPageState extends State<HandballPage> {
  @override
  Widget build(BuildContext context) {
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
                  child: new Text("Règles de handball",
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
                titleSection,
                bottomTextSection,
                bottomSecondTextSection
              ],
            )
        )
    );//Widget with "Material design"
  }
}