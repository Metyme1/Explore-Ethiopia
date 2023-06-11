import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/data_model.dart';



class DataServices{
  String baseUrl="";
  Future<List<DataModel>>getInfo() async {
    var apiUrl= '/getPlaces';
    http.Response res = await http.get(Uri.parse((baseUrl+apiUrl)));

    try{
      if(res.statusCode==200){
        List<dynamic> list =json.decode(res.body);
        return list.map((e) =>DataModel.fromjson(e)).toList();
      }else{
        return <DataModel>[];
      }

    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
}