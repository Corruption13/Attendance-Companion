import 'package:flutter/material.dart';
import 'home.dart';
import 'createRoom.dart';
import 'joinRoom.dart';
import 'myRooms.dart';
import 'roomCreated.dart';
import 'login.dart';
import 'enterTimeTable.dart';
import 'createSubject.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => Home(),
        "login": (context) => Login(),
        "createRoom": (context) => CreateRoomForm(),
        "joinRoom": (context) => JoinRoom(),
        "myRooms": (context) => MyRooms(),
        "created": (context) => RoomID(),
        "timeTableForm": (context) => TimeTableForm(),
        "createSubject": (context) => CreateSubject(),
      },
    );
  }
}



// Refer to API.dart for debug details.