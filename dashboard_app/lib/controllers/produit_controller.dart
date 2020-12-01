import 'dart:io';


import 'package:dashboard_app/models/depense.dart';
import 'package:dashboard_app/models/vente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
// import model

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dashboard_app/constants.dart';

class ProduitController extends GetxController {
  ProduitController();
  int a = 0;


  Future<Depense> VerifyOCR(String image) async {
    print('VerifyOCR');

    Map<String, String> queryParams = {
      'image': image,
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var requestUrl = url+'/predict' + '?' + queryString; // result - https://www.myurl.com/api/v1/user?param1=1&param2=2

    var response = await http.post(requestUrl, headers: {
      "Accept": "application/json"
    },);

    Map<String, dynamic>  jsonResponse = json.decode(response.body);

   return  Depense.fromJson2(jsonResponse) ;
  }




  Future<List<Vente>> AfficherVentes () async {

    final response =  await http.get(url+'/ventes') ;
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse.length);
      return jsonResponse.map((job) => new Vente.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }

  }
  Future<List<Depense>> AfficherDepenses () async {

    final response =  await http.get(url+'/depenses') ;
    if (response.statusCode == 200) {
      print('hne') ;
      List jsonResponse = json.decode(response.body);
      print(jsonResponse.length);
      return jsonResponse.map((job) => new Depense.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }

  }


 /* Future<List<Depense>>AfficherDepenses (String id) async {
    final response =  await http.post(url+'/listeByProduit',body:{'idliste':id}) ;
    print('ahayaaa l a');
    print(a++) ;
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print(jsonResponse.length);
      return jsonResponse.map((job) => new Produit.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
*/







  }






