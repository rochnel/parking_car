import 'package:parking_car/base_donnee_clients/utils.dart';

class Client{
  int id;
  String nom;
  String tel;
  String cni;
  String marque;
  String imatriculation;
  String jour;
  String place;
  String prix;
  String heure;

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      columnNom: nom,
      columnTel: tel,
      columnCni: cni,
      columnMarque: marque,
      columnImatriculation: imatriculation,
      columnJour: jour,
      columnPlace: place,
      columnPrix: prix,
      columnHeure: heure,

    };
    if(id != null){
      map[columnId] = id;
    }
    return map;
  }
  Client();
  Client.fromMap(Map<String, dynamic> map){
    id = map[columnId];
    nom = map[columnNom];
    tel = map[columnTel];
    cni = map[columnCni];
    marque = map[columnMarque];
    imatriculation = map[columnImatriculation];
    jour = map[columnJour];
    place = map[columnPlace];
    prix = map[columnPrix];
    heure = map[columnHeure];
  }
}
