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


  Future<Depense> VerifyOCR(File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url + '/predict'));
    String fileName = file.path.split('/').last;
    var multipartFile = await http.MultipartFile.fromPath("image", file.path,
        filename:(fileName));
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();

    response.stream.transform(utf8.decoder).listen((value) {
      Map<String, dynamic>  jsonResponse = json.decode(value);


      return  Depense.fromJson2(jsonResponse) ;
    });



  }




  Future<List<Vente>> AfficherVentes () async {

    final response =  await http.get(url+'/ventes') ;
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((job) => new Vente.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }

  }
  Future<List<Depense>> AfficherDepenses () async {
    final response =  await http.get(url+'/depenses') ;
    if (response.statusCode == 200) {
      print('depenses') ;
      List jsonResponse = json.decode(response.body);
      print(response.body);
      print(jsonResponse.length);
      return jsonResponse.map((job) => new Depense.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
void Ajouterdepense (String a,String b,String c ,String d ,String e ) async {
    print('kiko');
    //Get.snackbar('Produit Ajouté ', '',colorText: Colors.white,icon: Icon(Icons.shopping_cart),duration: Duration(seconds: 3),backgroundColor: Colors.green) ;
    final response =  await http.post(url+'/ajouterDepense',body:{'fullName':a,'factureCode':b,'designation':c,'montantTVA':d,'mttotal':e}) ;
    if (response.statusCode == 200) {
          print(response.body) ;
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






