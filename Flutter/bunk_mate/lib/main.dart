import 'package:flutter/material.dart';
import 'home.dart';
import 'createRoom.dart';
import 'joinRoom.dart';
import 'myRooms.dart';
import 'roomCreated.dart';

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
        "createRoom": (context) => CreateRoomForm(),
        "joinRoom": (context) => JoinRoom(),
        "myRooms": (context) => MyRooms(),
        "created": (context) => RoomID(),
      },
    );
  }
}



// Refer to API.dart for debug details.