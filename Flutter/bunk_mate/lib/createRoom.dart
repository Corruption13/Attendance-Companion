import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




var urlBase = "http://192.168.1.10:8000/";   // Change this to the Django Device IP4 Address or API URL
// For Debug, run django using:
// python manage.py runserver 0.0.0.0:8000


Future sendRoomAPI(String name, String description) async {
  final http.Response response = await http.post(
    urlBase + 'create/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "room_name": name,
      "details": description
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("Ok");
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


class CreateRoomForm extends StatelessWidget {
  @override
  String _name;
  String _description;
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Room Name*"),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
            return "Name Required";
        }

      },
      onSaved: (String value){
        _name = value;
      },

    );
  }
  Widget _buildDescription(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Room Description"),

      onSaved: (String value){
        _description = value;
      },
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Class Room"),),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(

          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildName(),
                _buildDescription(),
                RaisedButton(
                  child:Text("Submit"),
                  onPressed: (){
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                    _formKey.currentState.save();
                    sendRoomAPI(_name, _description);
                  },

                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


