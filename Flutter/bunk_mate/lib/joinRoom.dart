import 'package:flutter/material.dart';
import 'API.dart';




class JoinRoom extends StatefulWidget {
  JoinRoom({Key key}) : super(key: key);
  @override
  _JoinRoomState createState() => new _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {

  String _code;


  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body:
      new Container(
        child:
        new Center(
          child:
          new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  child:
                  new Text(

                    "Room ID",
                    style: new TextStyle(fontSize:42.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w900,
                        fontFamily: "Roboto"),
                  ),

                  padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 3.0),
                ),

                new Padding(
                  child:
                  new TextField(
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize:42.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto"),
                  ),

                  padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 24.0),
                )
              ]

          ),

        ),

        padding: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
      ),

      floatingActionButton: new FloatingActionButton(
          child: Text("Join"),
          onPressed: (){
            if(!_formKey.currentState.validate()){
              return;
            }
            _formKey.currentState.save();
            joinRoom(_code, "user");
          },),
    );
  }
  void fabPressed() {}

}