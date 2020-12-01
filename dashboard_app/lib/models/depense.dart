import 'package:dashboard_app/utils.dart';

class Depense {
  String tier;
  String facture;
  String designation;
  String tva;
  String totalTTC;
  Depense(
      {
        this.tier,
        this.facture,
        this.designation,
        this.tva,
        this.totalTTC});

  Depense.fromJson(Map<String, dynamic> json) {


    tier = 'Tier';
    facture = json['factureCode'];
    designation = json['designation'];
    tva = json['montantTVA'];
    totalTTC = json['montantHT'];


  }
  Depense.fromJson2(Map<String, dynamic> json) {
    print("niiicee");


    tier = json['0'][0];
   Utils.tier = tier ;
    totalTTC = json['1'][0];
    Utils.total = totalTTC ;
    tva = json['2'][0];
    Utils.tva = tva ;

  }

}

class Id {
  String oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}