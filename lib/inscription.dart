import 'package:flutter/material.dart';
import 'package:parking_car/base_donnee_inscription/helpers1.dart';
import 'package:parking_car/base_donnee_inscription/login.dart';
import 'package:parking_car/base_donnee_inscription/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'dart:async';

class Inscription extends StatefulWidget {
  @override
  _Inscription createState() => _Inscription();
}
class _Inscription extends State<Inscription>{
  bool insertItem = false;
  final formKey = GlobalKey<FormState>();
  final teNomController = TextEditingController();
  final teEntrepriseController = TextEditingController();
  final tePassword1Controller = TextEditingController();
  final tePassword2Controller = TextEditingController();
  bool _isHidePassword = true;
  void _togglePasswordVisibility(){
    setState(() {
      _isHidePassword = ! _isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 80.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child:Container(
                child: Text('Creé votre compte', style: TextStyle(fontSize: 26, fontWeight:  FontWeight.bold,), ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(35),
              child: Image.asset("assets/logo2.png"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  // padding: EdgeInsets.all(20),
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.person),
                      contentPadding: EdgeInsets.only(left: 8),
                      //labelText: 'Nom utilisateur',
                      hintText: 'Nom Utilisateur',
                      hintStyle: TextStyle(fontSize: 16.0, fontWeight:  FontWeight.bold,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'champ obligation veillez le remplir..';
                      }
                    },
                    onSaved: (val) => teNomController.text = val,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  TextFormField(
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.business),
                      contentPadding: EdgeInsets.only(left: 8),
                      //labelText: 'Nom utilisateur',
                      hintText: 'Nom Garderie',
                      hintStyle: TextStyle(fontSize: 16.0, fontWeight:  FontWeight.bold,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'champ obligation veillez le remplir..';
                      }
                    },
                    onSaved: (val) => teEntrepriseController.text = val,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  TextFormField(
                    obscureText: _isHidePassword,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          _togglePasswordVisibility();
                        },
                        child: Icon(
                          _isHidePassword? Icons.visibility_off : Icons.visibility,
                      ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(left: 8),
                      //labelText: 'Nom utilisateur',
                      hintText: 'Mots de passe',
                      hintStyle: TextStyle(fontSize: 16.0, fontWeight:  FontWeight.bold,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'champ obligation veillez le remplir..';
                      }
                    },
                    onSaved: (val) => tePassword1Controller.text = val,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  TextFormField(
                    obscureText: _isHidePassword,
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          _togglePasswordVisibility();
                        },
                        child: Icon(
                          _isHidePassword? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.only(left: 8),
                      //labelText: 'Nom utilisateur',
                      hintText: 'Confirmer Mots de passe',
                      hintStyle: TextStyle(fontSize: 16.0, fontWeight:  FontWeight.bold,),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    validator: (val){
                      if(val.isEmpty){
                        return 'champ obligation veillez le remplir..';
                      }
                    },
                    onSaved: (val) => tePassword2Controller.text = val,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: size.width,
                    height: 50,
                    child: RaisedButton(
                      onPressed: (){
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                          _save();
                        }
                      },
                      elevation: 2,
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Text('CREE', style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _save() async {
    if (tePassword1Controller.text == tePassword2Controller.text) {
      Login login  = Login();
      login.nom = teNomController.text;
      login.garderie = teEntrepriseController.text;
      login.password1 = tePassword1Controller.text;
      login.password2 = tePassword2Controller.text;
      var helper = Helper();
      helper.insert(login).then((value) {
        teNomController.text = "";
        teEntrepriseController.text = "";
        tePassword1Controller.text = "";
        tePassword2Controller.text = "";
        // Navigator.of(context).pop();
        showtoast("Compte crée avec success");
        setState(() {
          insertItem = true;
        });
      });
      print('${login.nom}');
      print('${login.garderie}');
      print('${login.password1}');
      print('${login.password2}');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Erreur!!!", style: new TextStyle(
              color: Colors.red,
              fontSize: 20
              ,
              fontWeight: FontWeight.bold,
            )),
            content: new Text("Veulliez verifier votre mots de passe"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Fermer"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

