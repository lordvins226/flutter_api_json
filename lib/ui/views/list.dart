import 'package:flutter/material.dart';
import 'package:flutter_api_json/core/services/api.dart';
import 'package:flutter_api_json/ui/views/detail.dart';

class listPage extends StatefulWidget {
  @override
  _listPageState createState() => _listPageState();
}

class _listPageState extends State<listPage> {
  List<MaterialColor> _color = [
    Colors.indigo,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 250.0,
          margin: EdgeInsets.all(10.0),
          child: FutureBuilder(
            future: getAllData(),
            builder: (BuildContext c, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.indigo)),
                );
              } else {
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext c, int index) {
                      MaterialColor myColor = _color[index % _color.length];
                      return Card(
                        elevation: 10.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.network(snapshot.data[index].url,
                                height: 150.0, width: 150.0, fit: BoxFit.cover),
                            SizedBox(
                              height: 7.0,
                            ),
                            Container(
                              height: 50.0,
                              margin: EdgeInsets.all(6.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: myColor,
                                      foregroundColor: Colors.white,
                                      child: Text(
                                        snapshot.data[index].id.toString(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.0,
                                  ),
                                  Container(
                                    width: 80.0,
                                    child: Text(
                                      snapshot.data[index].title,
                                      maxLines: 1,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }
            },
          ),
        ),
        SizedBox(
          height: 7.0,
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10.0),
            child: FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.indigo)),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext c, int index) {
                      return Card(
                        elevation: 7.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                snapshot.data[index].url,
                                height: 100.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                child: Text(
                                  snapshot.data[index].title,
                                  maxLines: 2,
                                ),
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext c) =>
                                          DetailPage(snapshot.data[index])));
                                },
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ))
      ],
    );
  }
}
