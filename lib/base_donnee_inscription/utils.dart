import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_hud/progress_hud.dart';


final String tableLogin = 'Login';
final String columnId = '_id';
final String columnNom = 'nom';
final String columnGarderie = 'garderie';
final String columnPassword1 = 'password1';
final String columnPassword2 = 'password2';

showtoast(String string) {
  Fluttertoast.showToast(
      msg: "$string",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 8,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0);
}

showProgress() {
  return ProgressHUD(
    backgroundColor: Colors.black12,
    color: Colors.white,
    containerColor: Colors.black38,
    borderRadius: 5.0,
    text: 'Loading...',
  );
}