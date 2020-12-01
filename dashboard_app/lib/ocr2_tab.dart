

import 'package:dashboard_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

// import controller


import 'package:get/get.dart';

class OCR2TAB extends StatefulWidget {

  @override
  _OCR2TABState createState() => _OCR2TABState();
}
class _OCR2TABState extends State<OCR2TAB> {
  Color secondColor = Color.fromRGBO(53, 46, 155,1.0);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              onPressed: Get.back,
              icon: Icon(Icons.arrow_back),
              color: secondColor,
            ),
            title: Text('Détails',
              style: TextStyle(
                  color: secondColor
              ),
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[

            ]
        ),

        body: MyCustomForm());

  }
}


class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController tierController = TextEditingController();
  TextEditingController factureController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController tvaController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  bool mail = false ;
  bool pwd = false ;
  @override
  void initState() {
    // TODO: implement initState
    factureController.value = TextEditingValue(
      text: Utils.facture,
      selection: TextSelection.fromPosition(
        TextPosition(offset: Utils.facture.length),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color secondColor = Color.fromRGBO(53, 46, 155,1.0);
    Color mainColor =  Colors.white;


    // Build a Form widget using the _formKey created above.
    return
      SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Container(
                color: Colors.white,
                height: Get.height*0.6,
                width: MediaQuery.of(context).size.width*(0.90),
                child:Flex(
                  direction: Axis.vertical,
                  children: [
                    Column(
                        children: <Widget>[
                          Divider(
                            height: MediaQuery.of(context).size.height*0.1,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 300,
                                maxWidth: 300,
                              ),
                              child :
                              TextFormField(
                                controller: tierController,
                                cursorColor:  secondColor,
                                decoration: InputDecoration(
                                  fillColor: mainColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondColor,
                                    ),
                                    borderRadius: BorderRadius.circular(33.0),
                                  ),
                                  hasFloatingPlaceholder: true,
                                  prefixIcon: Icon(Icons.person,
                                      color: secondColor),
                                  alignLabelWithHint: true,
                                  hintText: "Tier",
                                  hintStyle: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                keyboardType: TextInputType.text,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez verifier votre nom';
                                  }
                                  return null;
                                },
                              )
                          )
                          ,
                          Divider(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height/35,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 300,
                                maxWidth: 300,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: factureController,
                                cursorColor:  secondColor,
                                obscureText: false,
                                decoration: InputDecoration(
                                  fillColor: mainColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondColor,
                                    ),
                                    borderRadius: BorderRadius.circular(33.0),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: secondColor),
                                  alignLabelWithHint: true,
                                  hintText: "Facture",
                                  hintStyle: TextStyle(
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez insérer votre prénom';
                                  }
                                  return null;
                                },
                              )
                          ),
                          Divider(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height/35,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 300,
                                maxWidth: 300,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: desController,
                                cursorColor:  secondColor,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: mainColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondColor,
                                    ),
                                    borderRadius: BorderRadius.circular(33.0),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: secondColor),
                                  alignLabelWithHint: true,
                                  hintText: "Designation",
                                  hintStyle: TextStyle(
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez insérer votre prénom';
                                  }
                                  return null;
                                },
                              )
                          ),
                          Divider(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height/35,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 300,
                                maxWidth: 300,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: tvaController,
                                cursorColor:  secondColor,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: mainColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondColor,
                                    ),
                                    borderRadius: BorderRadius.circular(33.0),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: secondColor),
                                  alignLabelWithHint: true,
                                  hintText: "Tva",
                                  hintStyle: TextStyle(
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez insérer votre prénom';
                                  }
                                  return null;
                                },
                              )
                          ),
                          Divider(
                            color: Colors.white,
                            height: MediaQuery.of(context).size.height/35,
                          ),
                          ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: 300,
                                maxWidth: 300,
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: totalController,
                                cursorColor:  secondColor,
                                obscureText: true,
                                decoration: InputDecoration(
                                  fillColor: mainColor,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: secondColor,
                                    ),
                                    borderRadius: BorderRadius.circular(33.0),
                                  ),
                                  prefixIcon: Icon(Icons.person,
                                      color: secondColor),
                                  alignLabelWithHint: true,
                                  hintText: "Total TTC",
                                  hintStyle: TextStyle(
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez insérer votre prénom';
                                  }
                                  return null;
                                },
                              )
                          )
                          // Add TextFormFields and RaisedButton here.
                        ]
                    )
                  ],
                ) ,

              )
          ),
        ),
      );
  }
}
