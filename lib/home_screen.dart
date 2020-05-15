import 'package:flutter/material.dart';
import 'package:parking_car/base_donnee_inscription/helpers1.dart';
import 'package:parking_car/home.dart';
import 'base_donnee_inscription/login.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}
class _HomeScreen extends State<HomeScreen>{
  final formKey = GlobalKey<FormState>();
  String username1;
  String password2;
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
                  child: Text('Acceder A Votre Compte', style: TextStyle(fontSize: 26, fontWeight:  FontWeight.bold, ), ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(35),
                child: Image.asset("assets/logo2.png"),
              ),
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
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
                      onSaved: (val) => username1 = val,
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
                      onSaved: (val) => password2 = val,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16.0, bottom: 5.0),
                      child: Center(
                        child: Text(
                          "Mots de passe oublier?",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 14.0
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                    ),
                    Container(
                      width: size.width,
                      height: 50,
                      child: RaisedButton(
                        onPressed: (){
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            _read(context);
                          }
                        },
                        elevation: 2,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)
                        ),
                        child: Text('CONNEXION', style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
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
        )
    );
  }
  _read(BuildContext context) async{
    int id = 1;
    Helper helper = Helper.internal();
    Login login = await helper.getRegistre(id);
    print('${login.nom}');
    print('${login.password2}');
    if((password2 == '${login.password1}') && (username1 == '${login.nom}')){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => home()));
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
            content: new Text("Mots de passe incorrete"),
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