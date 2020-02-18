
import 'package:flutter_api_json/core/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



Future<List<Data>> getAllData() async {
  var api = "https://jsonplaceholder.typicode.com/photos";
  var data = await http.get(api);
   var jsonData = json.decode(data.body);

   List<Data>listOf=[];

   for (var i in jsonData){
     Data data = Data(i["id"],i["title"],i["url"],i["thumbnailUrl"]);
     listOf.add(data);
   }

   return listOf;
}