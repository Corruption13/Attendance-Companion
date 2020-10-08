import 'package:flutter/material.dart';


class MyRooms extends StatefulWidget {
  MyRooms({Key key}) : super(key: key);
  @override
  _MyRoomsState createState() =>  _MyRoomsState();
}

class _MyRoomsState extends State<MyRooms> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
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

                       Text(
                        "My Rooms",
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