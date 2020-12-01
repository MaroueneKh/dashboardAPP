import 'dart:async';
import 'dart:convert';

import 'package:dashboard_app/controllers/produit_controller.dart';
import 'package:dashboard_app/models/vente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VentesTab extends StatefulWidget {
  VentesTab({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _VentesTabState createState() => _VentesTabState();
}

class _VentesTabState extends State<VentesTab> {
  Color mainColor = Color.fromRGBO(236, 236, 236, 1.0);
  Color secondColor = Color.fromRGBO(53, 46, 155, 1.0);
  @override
  PageController _controller = PageController(
    initialPage: 0,
  );

  int _currentPage = 0;
  //Retourner les produits personnalises pour ce client

  @override
  Future<void> initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return (Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: Get.height * 0.03,),
                        child: Container(
                          child: Padding(
                            padding:  EdgeInsets.only(left: Get.width*0.4,top: Get.height*0.03),
                            child: Text("Ventes",style: TextStyle(color: Colors.white,fontSize: 18),),
                          ),
                          width: Get.width,
                          height: Get.height*0.2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [secondColor,secondColor.withOpacity(0.95),secondColor.withOpacity(0.8),secondColor.withOpacity(0.7), secondColor.withOpacity(0.6),secondColor.withOpacity(0.5),secondColor.withOpacity(0.4),secondColor.withOpacity(0.3),secondColor.withOpacity(0.2)]),
                          ),

                        )),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: Get.height*0.07),
                    child: Center(child: Produits()),
                  )
                ],
              ),

            ],
          ),
        ),
      ),
    ));

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
  }
}

class Produits extends StatefulWidget {
  @override
  _ProduitsState createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Color secondColor = Color.fromRGBO(53, 46, 155, 1.0);
    ProduitController ctrl = new ProduitController() ;
    return Container(
      width: Get.width,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: secondColor,
          hoverColor: secondColor,
        ),
        child: Column(
          children: [
            InteractiveViewer(
              scaleEnabled: true,
              panEnabled: true,
              child: Container(
                height: Get.height*0.85,
                width: Get.width*0.95,
                child: FutureBuilder(
                  future: ctrl.AfficherVentes(),
                  builder:(context,AsyncSnapshot snapshot){
                    if (snapshot.hasData)
                    {
                      List<Vente> data =
                      snapshot.data;
                      return    ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7),
                                    topRight: Radius.circular(7),
                                    bottomLeft: Radius.circular(7),
                                    bottomRight: Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: secondColor.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              height: Get.height * 0.12,
                              child: Padding(
                                padding:  EdgeInsets.only(left: Get.width*0.05),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(top: Get.height*0.015),
                                      child: Row(

                                        children: [Text(data[index].client,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),Padding(
                                          padding:  EdgeInsets.only(left: Get.width*0.08),
                                        ),Padding(
                                          padding:  EdgeInsets.only(left: Get.width*0.48),
                                          child: Text(data[index].ticket,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
                                        )],
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: Get.height*0.01),
                                      child: Row(
                                          children: [Text("Total :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),Padding(
                                            padding:  EdgeInsets.only(left: Get.width*0.35),
                                            child: Text(data[index].total,style: TextStyle(fontSize: 15)),
                                          )]
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(top: Get.height*0.01),
                                      child: Row(
                                          children: [Text("Ticket : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),Text(data[index].ticket,style: TextStyle(fontSize: 15)),Padding(
                                            padding:  EdgeInsets.only(left: Get.width*0.2),
                                            child: Text("Frais:",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                                          ),Text(data[index].frais,style: TextStyle(fontSize: 15))]
                                      ),
                                    )

                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );

                    }
                    else {

                      return LinearProgressIndicator() ;
                    }


                  } ,

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
  List<Vente> parseJosn(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.map<Vente>((json) => new Vente.fromJson(json)).toList();
  }
}
