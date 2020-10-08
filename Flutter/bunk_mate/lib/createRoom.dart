import 'package:flutter/material.dart';
import 'API.dart';


class CreateRoomForm extends StatefulWidget {
  @override
  _CreateRoomFormState createState() => _CreateRoomFormState();
}

class _CreateRoomFormState extends State<CreateRoomForm> {

  String _name;
  String _description;
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

  Widget _buildLocalIP(){
    return TextFormField(
      decoration: InputDecoration(labelText: "#Debug: Django localIP:port:"),

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
                            Icons.whatshot,
                            color: const Color(0xFF000000),
                            size: 35.0),
                        SizedBox(width: 24,),
                        Text(
                          "Create Room",
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
                  _buildDescription(),
                  SizedBox(height: 75,),
                  RaisedButton(
                    color: Colors.amberAccent,
                    child:Text("Submit"),
                    onPressed:  () async{
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      _formKey.currentState.save();
                      var item = await sendRoomAPI(_name, _description, "user") ;

                      await Navigator.pushNamed(context, "created", arguments: item );
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


