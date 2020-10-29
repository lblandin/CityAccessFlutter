import 'dart:io';
import 'dart:math';

import 'package:CityAccess/model/terrain.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String _nom;
  String _ville;
  String _adresse;
  String _description;
  int _cp;
  int _etat;
  double _longitude;
  double _latitude;
  String img;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final DatabaseReference database =
  FirebaseDatabase.instance.reference().child("Terrain");

  File _image;

  String imageUrl;

  List<Terrain> terrains = [];


  @override
  initState() {
    imageUrl = null;

    DatabaseReference reference = FirebaseDatabase.instance.reference();
    reference.child('Terrain').once().then((DataSnapshot snapshot) {
      var keys = snapshot.value.keys;
      var data = snapshot.value;
      terrains.clear();
      for (var key in keys) {
        Terrain terrain = new Terrain(
            data[key]["id"],
            data[key]["nom"],
            data[key]["description"],
            data[key]["adresse"],
            data[key]["cp"],
            data[key]["ville"],
            data[key]["etat"],
            data[key]["img"],
            data[key]["latitude"],
            data[key]["longitude"]);
        terrains.add(terrain);
      }
      setState(() {
        print('lenght terrains: ${terrains.length}');
      });
    });

    super.initState();
  }

  double lat = Random.secure().nextDouble() * (49 - 47) + 47;
  double lng = Random.secure().nextDouble() * (-0.5 - (-1.5)) + 1.5;

  int index;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = _image.path;
    StorageReference firebaseStorageRef =
    FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;


    _formKey.currentState.save();

    print(_nom);
    print(_ville);
    print(_adresse);
    print(_cp);
    print(_description);
    print(_etat);
    print(_longitude);
    print(_latitude);
    print(imageUrl);

    //Send to Database
    setState(() {
      index = terrains.length + 1;
    });

    database.push().set({
      'id': index,
      'nom': _nom,
      'description': _description,
      'adresse': _adresse,
      'cp': _cp,
      'ville': _ville,
      'etat': _etat,
      'latitude': _latitude,
      'longitude': _longitude,
      'img': await taskSnapshot.ref.getDownloadURL(),

    });
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));

  }

  Widget _buildNom() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Nom'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Nom is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _nom = value;
      },
    );
  }

  Widget _buildVille() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ville'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Ville is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _ville = value;
      },
    );
  }

  Widget _buildAdresse() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Adresse'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Adresse is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _adresse = value;
      },
    );
  }

  Widget _buildCP() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'CP'),
      maxLength: 5,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'CP is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _cp = int.parse(value);
      },
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Description'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Description is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _description = value;
      },
    );
  }

  Widget _buildEtat() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Etat'),
      maxLength: 1,
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Etat is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _etat = int.parse(value);
      },
    );
  }

  Widget _buildLongitude() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Longitude'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Longitude is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _longitude = double.parse(value);
      },
    );
  }

  Widget _buildLatitude() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Latitude'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Latitude is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _latitude = double.parse(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNom(),
              _buildAdresse(),
              _buildCP(),
              _buildDescription(),
              _buildVille(),
              _buildEtat(),
              _buildLongitude(),
              _buildLatitude(),
              Container(
                child: MaterialButton(
                  color: Colors.deepPurple,
                  child: Text(
                    "Image",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: getImage,
                ),
              ),
              SizedBox(height: 100),
              RaisedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }
                  uploadPic(context);


                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
