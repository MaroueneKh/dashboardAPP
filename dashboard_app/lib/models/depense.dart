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


    tier = json['acteur']['fullName'];
    facture = json['factureCode'];
    designation = json['designation'];
    tva = json['montantTVA'];
    totalTTC = json['montantHT'];
    print('Depense');
   print(json['factureCode']);

  }
  Depense.fromJson2(Map<String, dynamic> json) {
    print("niiicee");


 facture = json['0'][0];

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