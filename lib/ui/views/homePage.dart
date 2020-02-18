import 'package:flutter/material.dart';
import 'package:flutter_api_json/ui/views/list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () => debugPrint("Recherche")
            ),
            IconButton(
                icon: Icon(
                  Icons.add,
                ),
                onPressed: () => debugPrint("Ajouter")
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("kevin Wilfried"),
                accountEmail: Text("kevineilboudo54@gmail.com"),
                decoration: BoxDecoration(
                  color: Colors.indigo
                ),
              ),

              ListTile(
                title: Text("Accueil"),
                leading: Icon(Icons.home),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),

              ListTile(
                title: Text("Ajouter"),
                leading: Icon(Icons.add),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),

              ListTile(
                title: Text("Titres"),
                leading: Icon(Icons.title),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),

              ListTile(
                title: Text("Liste"),
                leading: Icon(Icons.list),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),

              Divider(
                height: 5.0,
              ),

              ListTile(
                title: Text("Fermer"),
                leading: Icon(Icons.close),
                onTap: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        body: listPage(),
      ),
    );
  }
}
