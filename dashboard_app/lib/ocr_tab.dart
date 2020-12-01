



import 'package:dashboard_app/controllers/produit_controller.dart';
import 'package:dashboard_app/models/depense.dart';
import 'package:dashboard_app/ocr2_tab.dart';
import 'package:dashboard_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
// import model
// import controller

import 'package:path/path.dart' as path;

import 'package:get/get.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

class OCRTab extends StatefulWidget {
  final PageController tabController ;
  OCRTab({this.tabController});
  @override
  _OCRTabState createState() => _OCRTabState();



}
  class _OCRTabState extends State<OCRTab> {

    @override
    void initState() {

      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body:Container(child: MyCustomForm(tabController: widget.tabController,),
          height: Get.height*0.65,
        )          );
  }

  }



class MyCustomForm extends StatefulWidget {
  final PageController tabController ;
  MyCustomForm({this.tabController});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> with SingleTickerProviderStateMixin {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.

  //final format = DateFormat("yyyy-MM-dd");
  bool _load  ;
  @override
  Future<void> initState() {
    _load = false ;



  }
  final _formKey = GlobalKey<FormState>();

  File file;




  Color mainColor =  Color.fromRGBO(211, 232, 213,1.0);
  Color secondColor = Color.fromRGBO(53, 46, 155,1.0);
   ProduitController ctrl = new ProduitController();



  Future<File> _choose(String nomm) async {
    var image  = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      file = image;

    });



    //file = await ImagePicker.pickImage(source: ImageSource.gallery);
  }
  Future<void> initPlatformState() async {
    String extractText;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      print("haw text");
      //String text = await TesseractOcr.extractText(file.path,language:'eng');
      print("haw text");
   //   print(text);
    } on PlatformException {
      extractText = 'Failed to extract text';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.

  }

  @override
  Widget build(BuildContext context) {


    // Build a Form widget using the _formKey created above.
    return
      ModalProgressHUD(
        color: Colors.white,
        inAsyncCall: _load,
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: Get.height*0.70,
                width: MediaQuery.of(context).size.width,
                child:Flex(
                  direction: Axis.vertical,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.white,
                              height: Get.height*0.15,
                            ),
                            file == null
                                ? Container(
                             height: Get.height*0.3,width: Get.width*0.5
                            )
                                : Image.file(file,height: Get.height*0.3,width: Get.width*0.5,),
                            Divider(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height/15,
                            ),
                            Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RawMaterialButton(

                                      fillColor: secondColor,
                                      splashColor: mainColor,
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const <Widget>[
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              "Choisir une image",
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

                                      await  _choose("aaa").whenComplete(() =>  print("ahawa"+file.path)) ;
                                      Get.snackbar('Merci ! ', 'Veuillez patientez',isDismissible: true,duration: Duration(seconds: 2));
                                       setState(() {
                                          _load = true;
                                        });
                                        Depense a = await  ctrl.VerifyOCR(file) ;

                                      setState(() {
                                        _load = false;
                                      });
                                   //   widget.tabController.jumpToPage(1);


                                        // Validate returns true if the form is valid, otherwise false.

                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            RawMaterialButton(

                              fillColor: secondColor,
                              splashColor: mainColor,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const <Widget>[
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      'Suivant',
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

                                widget.tabController.jumpToPage(1);
                                //   widget.tabController.jumpToPage(1);


                                // Validate returns true if the form is valid, otherwise false.

                              },
                            )

                            // Add TextFormFields and RaisedButton here.
                          ]
                      ),
                    )
                  ],
                ) ,

              ),
            )
        ),
      );
  }
}
// Define a corresponding State class.
// This class holds data related to the form.
