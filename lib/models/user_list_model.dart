class UserListModel {
  int? id;
  String? ime;
  String? prezime;
  String? telefon;
  String? mobilni;
  String? slikaPutanja;

  UserListModel(
      {this.id,
      this.ime,
      this.prezime,
      this.telefon,
      this.mobilni,
      this.slikaPutanja});

  UserListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ime = json['ime'];
    prezime = json['prezime'];
    telefon = json['telefon'];
    mobilni = json['mobilni'];
    slikaPutanja = json['slikaPutanja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ime'] = ime;
    data['prezime'] = prezime;
    data['telefon'] = telefon;
    data['mobilni'] = mobilni;
    data['slikaPutanja'] = slikaPutanja;
    return data;
  }
}
