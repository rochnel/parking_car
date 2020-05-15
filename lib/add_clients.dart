import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:parking_car/base_donnee_clients/helpers2.dart';
import 'package:parking_car/base_donnee_clients/Clients.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/animation/animation.dart';
import 'dart:async';
import 'base_donnee_clients/utils.dart';


class add extends StatefulWidget {
  @override
  _add createState() => _add();
}
//List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
DateTime now = DateTime.now();
String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
class Info{
  String name = '';
  String tel = '';
  String cni = '';
  String marque = '';
  String imatriculation = '';
  String jour = '';
  String place = '';
  String prix = '';
  String time = formattedDate;

}
class _add extends State<add>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new StepperBody(),
    );
  }
}
class StepperBody extends StatefulWidget{
  @override
  _StepperBodyState createState() => _StepperBodyState();
}
class _StepperBodyState extends State<StepperBody>{
  bool insertItem = false;
  int currStep = 0;
  //bool _autoValidate = false;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  static Info data = new Info();

  List<Step> steps = [
    new Step(
        title: const Text('Info client'),
        isActive: true,
        state: StepState.editing,
        content: new SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new TextFormField(
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    data.name = value;
                  },
                  maxLines: 1,
                  validator: (value) {
                    if (value.isEmpty || value.length < 1) {
                      return 'Please enter name';
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: 'Entrer le nom du client',
                      hintText: 'nom client',
                      //filled: true,
                      icon: const Icon(Icons.person),
                      labelStyle:
                      new TextStyle(decorationStyle: TextDecorationStyle.solid)),
                ),
                new TextFormField(
                  keyboardType: TextInputType.phone,
                  autocorrect: false,
                  onSaved: (String value) {
                    data.tel = value;
                  },
                  maxLines: 1,
                  validator: (value) {
                    if (value.isEmpty || value.length < 1) {
                      return 'numero du client svp';
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: 'Entrer numero du client',
                      hintText: 'numero client',
                      //filled: true,
                      icon: const Icon(Icons.phone),
                      labelStyle:
                      new TextStyle(decorationStyle: TextDecorationStyle.solid)),
                ),
                new TextFormField(
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                  onSaved: (String value) {
                    data.cni = value;
                  },
                  maxLines: 1,
                  validator: (value) {
                    if (value.isEmpty || value.length < 1) {
                      return 'Please enter name';
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: 'Entrer lnum de cni du client',
                      hintText: 'cni client',
                      //filled: true,
                      icon: const Icon(Icons.credit_card),
                      labelStyle:
                      new TextStyle(decorationStyle: TextDecorationStyle.solid)),
                )
              ],
            )
        )

    ),
    new Step(
        title: const Text('Info Vehicule'),
        isActive: true,
        state: StepState.indexed,
        content: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.marque = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'marque du vehicule svp';
                  }
                },
                decoration: new InputDecoration(
                    labelText: 'Entrer marque du vehicule',
                    hintText: 'marque du vehicule',
                    //filled: true,
                    icon: const Icon(Icons.slow_motion_video),
                    labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.imatriculation = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'marque du vehicule svp';
                  }
                },
                decoration: new InputDecoration(
                    labelText: 'Entrer plaque imatriculation du vehicule',
                    hintText: 'imatriculation du vehicule',
                    //filled: true,
                    icon: const Icon(Icons.confirmation_number),
                    labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
            ],
          ),
        )
    ),
    new Step(
        title: const Text('Gestion'),
        isActive: true,
        state: StepState.complete,
        content: new SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.phone,
                autocorrect: false,
                onSaved: (String value) {
                  data.jour = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'marque du vehicule svp';
                  }
                },
                decoration: new InputDecoration(
                    labelText: 'Entrer le numbre de jour',
                    hintText: 'numbre de jour',
                    //filled: true,
                    icon: const Icon(Icons.today),
                    labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String value) {
                  data.place = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'place du vehicule svp';
                  }
                },
                decoration: new InputDecoration(
                    labelText: 'Entrer la place de stationnement',
                    hintText: 'place de stationnement',
                    //filled: true,
                    icon: const Icon(Icons.place),
                    labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
              ),
              new TextFormField(
                keyboardType: TextInputType.phone,
                autocorrect: false,
                onSaved: (String value) {
                  data.prix = value;
                },
                maxLines: 1,
                validator: (value) {
                  if (value.isEmpty || value.length < 1) {
                    return 'marque le prix svp';
                  }
                },
                decoration: new InputDecoration(
                    labelText: 'Entrer prix stationnement',
                    hintText: 'prix stationnement',
                    //filled: true,
                    icon: const Icon(Icons.monetization_on),
                    labelStyle:
                    new TextStyle(decorationStyle: TextDecorationStyle.solid)),
              )
            ],
          ),
        )
    ),
  ];
  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold
          .of(context)
          .showSnackBar( SnackBar(content:  Text(message)));
    }

    void _submitDetails() {
      final FormState formState = _formKey.currentState;

      if (!formState.validate()) {
        showSnackBarMessage('Le formulaire n''a ete completement ramplir');
      } else {
        formState.save();
        Client client = Client();
        client.nom = data.name;
        client.tel = data.tel;
        client.cni = data.cni;
        client.marque = data.marque;
        client.imatriculation = data.imatriculation;
        client.jour = data.jour;
        client.place = data.place;
        client.prix = data.prix;
        client.heure = data.time;
        var helper1 = Helper1();
        helper1.insert(client).then((value){
          data.name = "";
          data.tel = "";
          data.cni = "";
          data.marque = "";
          data.imatriculation = "";
          data.jour = "";
          data.place = "";
          data.prix = "";
          //data.time = "";
          showtoast("client ajouter impression du ticker en cour..");
          setState(() {
            insertItem = true;
          });
        });
        showDialog(
            context: context,
            child: new AlertDialog(
              title: new Text("Details"),
              //content: new Text("Hello World"),
              content: new SingleChildScrollView(
                child: new ListBody(
                  children: <Widget>[
                    new Text("Name : " + client.nom),
                    new Text("Phone : " + client.tel),
                    new Text("CNI : " + client.cni),
                    new Text("marque : " + client.marque),
                    new Text(client.heure)
                    // new Text(client.heure),
                  ],
                ),
              ),
              actions: <Widget>[
                new FlatButton(
                  child: new Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));

      }
    }

    return  Container(
        child:  Form(
          key: _formKey,
          // autovalidate: _autoValidate,
          child:  ListView(children: <Widget>[
            Stepper(
              steps: steps,
              type: StepperType.vertical,
              currentStep: this.currStep,
              onStepContinue: () {
                setState(() {
                  if (currStep < steps.length - 1) {
                    currStep = currStep + 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepCancel: () {
                setState(() {
                  if (currStep > 0) {
                    currStep = currStep - 1;
                  } else {
                    currStep = 0;
                  }
                });
              },
              onStepTapped: (step) {
                setState(() {
                  currStep = step;
                });
              },
            ),
            RaisedButton(
              child:  Text(
                'Valider',
                style:  TextStyle(color: Colors.white),
              ),
              onPressed: _submitDetails,
              color: Colors.blue,
            ),
          ]),
        ));
  }
}

