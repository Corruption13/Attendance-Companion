import 'package:flutter/material.dart';
//import 'dart:async';





class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() =>  _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:
      Container(

        child:
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                          Icons.whatshot,
                          color: const Color(0xFF000000),
                          size: 48.0),
                      SizedBox(width: 24,),
                      Text(
                        "Bunk Mate",
                        style:  TextStyle(fontSize:44.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(24.0),
                      )
                    ]

                ),
                SizedBox(height: 20,),
                Divider(),
                SizedBox(height: 20,),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "createRoom"),
                  child: Text(
                    "Create Room",
                    style: TextStyle(fontSize: 23),
                  ),
                  color: Colors.amberAccent,
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "joinRoom"),
                  child: Text(
                      "Join Room",
                      style: TextStyle(fontSize: 23),
                    ),
                  color: Colors.lightBlue[100],

                ),
                SizedBox(height: 35,),
                RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, "myRooms"),
                  child: Text(
                      "My Rooms",
                      style: TextStyle(fontSize: 23),
                  ),
                  color: Colors.greenAccent,
                ),

              ]

          ),
        ),

        padding: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
      ),

    );
  }
  void fabPressed() {}

}



