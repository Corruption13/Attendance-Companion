import 'package:flutter/material.dart';


void showAlert(BuildContext context, String header, String message, String buttonText) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(

      title: Text(header),
      content: Column(
        mainAxisSize: MainAxisSize.min  ,
        children: [
          Text(message),
          SizedBox(height: 20,),
          RaisedButton(
              child: Text("Okay"),
              onPressed: (){
                Navigator.pushNamed(context, "/home");
              }
          )
        ],
      ),
    ),

  );
}


void showAlertRedirect(BuildContext context, String header, String message, String buttonText, String redirect) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(

      title: Text(header),
      content: Column(
        mainAxisSize: MainAxisSize.min  ,
        children: [
          Text(message),
          SizedBox(height: 20,),
          RaisedButton(
              child: Text("Okay"),
              onPressed: (){
                Navigator.pushNamed(context, redirect);
              }
          )
        ],
      ),
    ),

  );
}


void showAlertSimple(BuildContext context, String header, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(

      title: Text(header),
      content: Column(
        mainAxisSize: MainAxisSize.min  ,
        children: [
          Text(message),
          SizedBox(height: 20,),
          RaisedButton(
              child: Text("Okay"),
              onPressed: (){
                Navigator.of(context, rootNavigator: true).pop('dialog');
              }
          )
        ],
      ),
    ),

  );
}




Future showAlertWidget(BuildContext context, String header, Widget widget) async{
  showDialog(
    context: context,
    builder: (context) => AlertDialog(

      title: Text(header),
      content: widget,
    ),

  );
}