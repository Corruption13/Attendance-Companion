import 'package:flutter/material.dart';
import 'API.dart';
import 'AlertFunctions.dart';

class JoinRoom extends StatefulWidget {
  @override
  _JoinRoomState createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {

  String _code;
  String _debugLocalIP;

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
        _code = value;
      },

    );
  }



  Widget _buildLocalIP(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: "#Debug: Django server computer's localIP:port:",
          hintText: "192.168.X.Y:8000/"
      ),
      initialValue: "192.168.1.2:8000/",
      onSaved: (String value){
        _debugLocalIP = value;
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 0, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                            Icons.create,
                            color: const Color(0xFF000000),
                            size: 35.0),
                        SizedBox(width: 24,),
                        Text(
                          "Join Room",
                          style:  TextStyle(fontSize:30.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(24.0),
                        )
                      ]

                  ),
                  _buildName(),

                  SizedBox(height: 75,),
                  RaisedButton(
                    color: Colors.amberAccent,
                    child:Text("Submit"),
                    onPressed:  () async{
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      _formKey.currentState.save();
                      print("debug");

                      var item = await joinRoomAPI(_code, _debugLocalIP);
                      print("ITEM: " + item);
                      if(item == -1){
                        showAlertSimple(context, "Error", "API could not be reached");
                      }
                      else if(item==3){
                        showAlertSimple(context, "Error", "Invalid Code");
                      }

                      else if(item==1){
                        showAlertSimple(context, "Error", "Already in Room");
                      }
                      else{
                        print(item);
                        Navigator.pushNamed(context, "created", arguments: item );
                      }

                    },

                  ),
                  SizedBox(height:20),
                  _buildLocalIP(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}