import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_car/add_clients.dart';
import 'package:parking_car/liste_clients.dart';

class home extends StatefulWidget {
  @override

  _home createState() => _home();
}
class _home extends State<home>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.perm_contact_calendar,), text: "Client",),
              Tab(icon: Icon(Icons.add_circle_outline,), text: "Nouveau client",),
            ],
          ),
          title: Text("Garderie Kamdem",), centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: (){

              },
            )
          ],
        ),
        body: TabBarView(
          children: <Widget>[
            liste(),
            add(),
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }


}
class MyDrawer extends StatelessWidget{
  final Function onTap;
  MyDrawer({
    this.onTap
});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.8,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/Manager.png"),
                      ),
                    ),
                    SizedBox(height: 10,),
                   RichText(
                     text: TextSpan(
                       children: [
                         TextSpan( text:
                           'Garderie Kamdem',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                           ),
                         ),
                         WidgetSpan(
                           child: Padding(padding: const EdgeInsets.symmetric(horizontal: 2.0),
                             child: Icon(Icons.verified_user, color: Colors.green, ),

                           )
                         )
                         ]
                     ),
                   )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Parametre'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('Rapport'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Manuel D''utilisation'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.announcement),
              title: Text('A Propos De Parking Car'),
              onTap: (){

              },
            )
          ],
        ),
      ),
    );
  }
}
