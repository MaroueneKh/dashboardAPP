

import 'package:dashboard_app/controllers/produit_controller.dart';
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

        body: SingleChildScrollView(child: MyCustomForm()));

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
  ProduitController ctrl = new ProduitController() ;
  bool mail = false ;
  bool pwd = false ;
  @override
  void initState() {
    // TODO: implement initState
    tierController.value = TextEditingValue(
      text: Utils.tier,
      selection: TextSelection.fromPosition(
        TextPosition(offset: Utils.tier.length),
      ),
    );
    totalController.value = TextEditingValue(
      text: Utils.total,
      selection: TextSelection.fromPosition(
        TextPosition(offset: Utils.total.length),
      ),
    );
    tvaController.value = TextEditingValue(
      text: Utils.tier,
      selection: TextSelection.fromPosition(
        TextPosition(offset: Utils.tva.length),
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
                height: Get.height*0.80,
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
                                    return 'Veuillez inserer le tier';
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
                                  hintStyle: TextStyle(
                                    color: secondColor,
                                  ),
                                  //    labelText: 'Mail',
                                  //  labelStyle: TextStyle(color: secondColor
                                  //  ,fontSize: 20),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Veuillez insérer la facture';
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
                                    return 'Veuillez insérer la designation';
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
                                    return 'Veuillez insérer lt tva';
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
                                    return 'Veuillez insérer le total';
                                  }
                                  return null;
                                },
                              )
                          ),
                          RawMaterialButton(
                            fillColor: secondColor,
                            splashColor: mainColor,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children:  <Widget>[
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Ajouter une facture',
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.white,fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                //  await viewController.Login(mailController.text, passwordController.text).then((value) =>
                                //    _toggle(value)
                                  ctrl.Ajouterdepense(tierController.text,factureController.text,desController.text,tvaController.text,totalController.text) ;
                                //  );
                              }



                            },
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
