import 'package:flutter/material.dart';
import 'package:flutter_api_json/core/models/model.dart';

class DetailPage extends StatefulWidget {
  DetailPage detail;
  Data data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: Text("Details"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    widget.data.url,
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: CircleAvatar(
                            child: Text(
                              widget.data.id.toString()
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.0,
                        ),

                        Expanded(
                          flex: 2,
                          child: Text(
                            widget.data.title
                          ),
                        ),


                      ],
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
}
