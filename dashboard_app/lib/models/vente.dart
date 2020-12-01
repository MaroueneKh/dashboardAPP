class Vente {
  String ticket;
  String date;
  String client;
  String frais;
  String total;
  String trc;
  Vente(
      {
        this.ticket,
        this.date,
        this.client,
        this.frais,
        this.total,
        this.trc
      });

  Vente.fromJson(Map<String, dynamic> json) {

    ticket = json['operation'];
    date = json['date'];
    client = 'client';
    frais = json['fraisService'];
    total = json['total'];
    trc = json['totalTax'];
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