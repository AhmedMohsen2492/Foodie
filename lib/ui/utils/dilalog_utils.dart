import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
    return AlertDialog(
      content: Row(
        children: [
          Text("Loading.."),
          Spacer(),
          CircularProgressIndicator(),
        ],
      )
    );
  });
}

void hideLoading(BuildContext context){
  Navigator.pop(context);
}

void showErrorDialog(BuildContext context,String message){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          title: Text("Error!!"),
            content: Text(message),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("OK"))
          ],
        );
      });
}