import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_hud/progress_hud.dart';

final String tableClient = 'Client';
final String columnId = '_id';
final String columnNom = 'nom';
final String columnTel = 'tel';
final String columnCni = 'cni';
final String columnMarque = 'marque';
final String columnImatriculation = 'imatriculation ';
final String columnJour = 'jour';
final String columnPlace = 'place';
final String columnPrix = 'prix';
final String columnHeure = 'heure';

showtoast(String string) {
  Fluttertoast.showToast(
      msg: "$string",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 13.0);
}

showProgress() {
  return ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.black38,
    borderRadius: 9.0,
    text: 'Loading...',
  );
}