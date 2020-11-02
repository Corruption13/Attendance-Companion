import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'storage.dart';


String urlBase = "http://192.168.1.10:8000/";   // Change this to the Django Device IP4 Address or API URL
// For Debug, run django using:
// python manage.py runserver 0.0.0.0:8000

/// TODO: SET urlBase to domain address on deployment.


Future login(String username, String password, String debugIP) async{

  if(debugIP != ""){
    urlBase = "http://" + debugIP ;
  }

  final http.Response response = await http.post(
    urlBase + 'login/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',

    },
    body: jsonEncode(<String, String>{
      "username": username,
      "password": password
    }),
  ).timeout(
    Duration(seconds: 3),
    onTimeout: () {
      print("Error Connecting to server ");
      return null;
    },
  );
  var values = json.decode(response.body);


  if (response.statusCode == 200) {
    print("Logged In");
    saveObject('token', values['token']);
    return values;
  }
  else if (response.statusCode == 404){
      print("Not Found!");
      return 1;

  }

  else {
    print("Error Connecting to server " + response.statusCode.toString());
    return -1;
  }

}

Future createRoomAPI(String name, String description, String debugIP) async {
  /*

    API Response Table:

    201 Return 0: Room Created
    400 Ret 1 : Invalid POST
    401 Ret 2 : User not logged in

  */

  if(debugIP != ""){
    urlBase = "http://" + debugIP ;
  }

  String token = await getObject('token');
  print("test" + debugIP);
  final http.Response response = await http.post(
    urlBase + 'create/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': token
    },
    body: jsonEncode(<String, String>{
      "room_name": name,
      "details": description
    }),
  );
  var values = json.decode(response.body);
  print("yes");

  if (response.statusCode == 201) {
    print("Ok");
    saveObject('room_id', values['room_id']);
    return values['room_id'];
  }
  else if (response.statusCode == 400) {
    print("Invalid POST");
    return 1;

  }
  else if (response.statusCode == 401) {
    print("User not Logged in");

    return 2;
  }
  else {
    print("Error");
    return -1;
  }
}


Future joinRoomAPI(String code, String debugIP) async {
  /*
    API Response Table:

    201 Return 0: User added to room
    400 Ret 1: User already in the room
    401 Ret 2: User not logged in
    404 Ret 3: Invalid room Code given.
 */



  if(debugIP != ""){
    urlBase = "http://" + debugIP ;
    print("DebugIP: " + debugIP);
  }
  print("Code:" + code);
  String token = await getObject('token');

  final http.Response response = await http.post(
    urlBase + 'join/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': token
    },
    body: jsonEncode(<String, String>{
      "room_id": code,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("Ok");
    return 0;
  }
  else if(response.statusCode ==400){
    print("User Already in Room");
    return 1;
  }
  else if(response.statusCode ==401){
    print("Please Log In");
    return 2;
  }
  else if(response.statusCode ==404){
    print("Invalid Room Code");
    return 3;
  }
  else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    return -1;
  }
}
