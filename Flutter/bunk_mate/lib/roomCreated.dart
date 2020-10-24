import 'package:flutter/material.dart';

class RoomID extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments;
    String id = data;
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(

          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 100, 0, 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                            Icons.whatshot,
                            color: const Color(0xFF000000),
                            size: 35.0),
                        SizedBox(width: 24,),
                        Text(
                          "Room Details",
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

                  SizedBox(height: 75,),
                  Text("Share this roomcode with friends: "),
                  SizedBox(height: 20,),
                  Stack(
                    children: <Widget>[
                      // Stroked text as border.
                      Text(
                        id,
                        style: TextStyle(
                          fontSize: 40,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 6
                            ..color = Colors.green[900],
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        id,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.grey[200],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  RaisedButton(
                    color: Colors.amberAccent,
                    child:Text("Go Back"),
                    onPressed:  (){


                      Navigator.pushNamed(context, "home" );
                    },

                  ),
                  SizedBox(height:20),



                ],
              ),

          ),
        ),
      ),
    );
  }
}

