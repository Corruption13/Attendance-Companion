import 'package:flutter/material.dart';
import 'API.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {

  String _username;
  String _password;
  String _debugLocalIP;

  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Username*"),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Username Required";
        }

      },
      onSaved: (String value){
        _username = value;
      },

    );
  }

  Widget _buildPassword(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),

      onSaved: (String value){
        _password = value;
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
                  _buildPassword(),
                  SizedBox(height: 75,),
                  RaisedButton(
                    color: Colors.amberAccent,
                    child:Text("Submit"),
                    onPressed:  () async{
                      if(!_formKey.currentState.validate()){
                        return;
                      }
                      _formKey.currentState.save();

                      var item = await login(_username, _password, _debugLocalIP) ;

                      //await Navigator.pushNamed(context, "created", arguments: item );
                      print(item['token']);
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