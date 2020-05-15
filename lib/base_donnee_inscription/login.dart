import 'package:parking_car/base_donnee_inscription/utils.dart';

class Login{
  int id;
  String nom;
  String garderie;
  String password1;
  String password2;

  Login();

  Login.fromMap(Map<String, dynamic> map){
    id = map[columnId];
    nom = map[columnNom];
    garderie = map[columnGarderie];
    password1 = map[columnPassword1];
    password2 = map[columnPassword2];
  }
  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      columnNom: nom,
      columnGarderie: garderie,
      columnPassword1: password1,
      columnPassword2: password2
    };
    if (id != null){
      map[columnId] = id;
    }
    return map;
  }
}