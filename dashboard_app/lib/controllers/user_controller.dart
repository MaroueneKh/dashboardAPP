import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:dashboard_app/constants.dart';
class UserController extends GetxController{
  UserController();


  Future<bool> Login  (String mail,String password ) async {
    //var url = 'http://8a8f1c94fea0.ngrok.io/';
    //var response = await http.get(url,headers:{"Content-type": "application/json"});
    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
    var response = await http.post(url+'/clientsignin',body:{'email':mail,'pwd':password});
//check if mail is correct
    if (response.statusCode!=200)
    {
      return false ;
    }
    //if mail is correct check if password is correct
    else{
      if(response.body.toString() == "mot de passe invalide")
      {
        return false ;
      }
      else
      {
        var parsedJson = json.decode(response.body.toString());
        if(parsedJson != 'mot de passe invalide'){
          var response = await http.post(url+'/UtilisateurToken',body:{'token':parsedJson});
          print('User') ;
          /*save into shared pref*/
          print(response.body) ;
          var parsedBody = jsonDecode(response.body);
          print(parsedBody);
          var email = parsedBody['data']['email'];
          var pwd = parsedBody['data']['pwd'];
          var userId = parsedBody['data']['userId'];
          var nom = parsedBody['iss'];
          final prefs = await SharedPreferences.getInstance();
          print('sololololololololololo');
          print(nom);
          prefs.setString('email',email) ;
          prefs.setString('pwd',pwd) ;
          prefs.setString('userId',userId) ;
          prefs.setString('prenomUser',nom);
          /*save into shared pref*/
          //redirection after login
          return true ;
          //redirection after login
          //}else{
          //  print('wrong login credentials');
        }
        else{
          return false ;
        }
      }
    }

    //JSON DECODER
    //   });
    // LOGIN GET REQUEST IS HERE
  }

}