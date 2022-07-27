import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp();
//runApp(MyApp());
//}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          accentColor: Colors.cyan),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nom = 'hh', prenom = 'hh', mail = "hh", numtel = '0646256';

  // _MyAppState(this.nom, this.prenom, this.mail, this.numtel);

  getNom(nom) {
    this.nom = nom;
  }

  getPrenom(prenom) {
    this.prenom = prenom;
  }

  getMail(mail) {
    this.mail = mail;
  }

  getNumtel(numtel) {
    this.numtel = numtel;
  }

  createData() {
    print("Ajouter");

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("stagieres").doc(nom);

    //create Map
    Map<String, dynamic> stagiaire = {
      "Nom": nom,
      "Prénom": prenom,
      "Mail": mail,
      "Numtel": numtel
    };
    documentReference.set(stagiaire).whenComplete(() {
      print("$nom ajouter");
    });
  }

  updateData() {
    print("Editer");
  }

  deleteData() {
    print("Supprimer");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suivi des stagiaires"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Nom",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String nom) {
                  getNom(nom);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Prénom",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String Prenom) {
                  getPrenom(prenom);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Mail",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String mail) {
                  getMail(mail);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    labelText: "Num tel",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue, width: 2.0))),
                onChanged: (String numtel) {
                  getNumtel(numtel);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Ajouter"),
                  textColor: Colors.white,
                  onPressed: () {
                    createData();
                  },
                ),
                RaisedButton(
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Editer"),
                  textColor: Colors.white,
                  onPressed: () {
                    updateData();
                  },
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Text("Supprimer"),
                  textColor: Colors.white,
                  onPressed: () {
                    deleteData();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
