import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:parking_car/base_donnee_clients/Clients.dart';
import 'package:parking_car/base_donnee_clients/utils.dart';
import 'package:parking_car/base_donnee_clients/helpers2.dart';
import 'package:flutter/rendering.dart';
import 'package:sqflite/sqflite.dart';


class liste extends StatefulWidget{
  @override
  _liste createState() => _liste();
}
class _liste extends State<liste> {
  Helper1 db = Helper1();
  ScrollController _scrollController;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<Client> items = new List();
  List<Client> values;
  bool descTextShowFlag = false;
  bool insertItem = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: getAllClients(),
    );
  }
  ///Get all produits
  getAllClients() {
    return FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return createListView(context, snapshot);
        });
  }
  ///Actualiser les données dans la bd
  Future<List<Client>> _getData() async {
    var dbHelper = Helper1();
    await dbHelper.getAllClients().then((value) {
      items = value;
      if (insertItem) {
        _listKey.currentState.insertItem(values.length);
        insertItem = false;
      }
    });

    return items;
  }
Widget createListView(BuildContext context, AsyncSnapshot snapshot){
  values = snapshot.data;
  if (values != null) {
    showProgress();
    return new AnimatedList(
        key: _listKey,
        controller: _scrollController,
        shrinkWrap: true,
        initialItemCount: values.length,
        itemBuilder: (BuildContext context, int index, animation) {
          return _buildItem(values[index], animation, index);
        });
  } else
    return Container();

 }
  Widget _buildItem(Client values, Animation<double> animation, int index){
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 5,
        child: ListTile(
          title: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/Manager.png"),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width - 200),
                          child: Text(
                            values.nom,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                            maxLines: 2,
                            softWrap: true,

                          ),
                        ),
                        onTap: (){
                          setState(() {
                            descTextShowFlag = !descTextShowFlag;
                          });
                        },

                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.phone),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: new Text(
                          values.tel.toString(),
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.credit_card),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.cni.toString(),
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 5.0)),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.slow_motion_video),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.marque.toString(),
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  new Row(
                    children: <Widget>[
                      Icon(Icons.place),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.place,
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.today),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.jour.toString(),
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),

                  new Row(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.prix.toString(),
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0)),
                      new InkWell(
                        child: Container(
                          constraints: new BoxConstraints(
                              maxWidth:
                              MediaQuery.of(context).size.width - 200),
                          child: new Text(
                            values.heure,
                            style:
                            TextStyle(fontSize: 18.0, color: Colors.black),
                            textAlign: TextAlign.left,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 10.0)),
                ],
              ),
            ],
          ),
          trailing: Column(
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: IconButton(
                    color: Colors.red,
                    icon: new Icon(Icons.delete),
                    onPressed: () => onDelete(values, index)),
              ),
            ],
          ),

        ),
      ),
    );
  }
  /// Delete Click and delete item
  onDelete(Client values, int index) {
    var id = values.id;
    var dbHelper = Helper1();
    dbHelper.delete(id).then((value) {
      Client removedItem = items.removeAt(index);

      AnimatedListRemovedItemBuilder builder = (context, animation) {
        return _buildItem(removedItem, animation, index);
      };
      _listKey.currentState.removeItem(index, builder);
    });
  }


}