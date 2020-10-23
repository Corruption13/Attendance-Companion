import 'package:http/http.dart' as http;
import 'dart:convert';

String urlBase = "http://192.168.1.10:8000/";   // Change this to the Django Device IP4 Address or API URL
// For Debug, run django using:
// python manage.py runserver 0.0.0.0:8000

/// TODO: SET urlBase to domain address on deployment.


Future sendRoomAPI(String name, String description, String user, String debugIP) async {

  if(debugIP != ""){
    urlBase = "http://" + debugIP ;
  }
  print("test" + debugIP);
  final http.Response response = await http.post(
    urlBase + 'create/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "room_name": name,
      "details": description
    }),
  );
  var values = json.decode(response.body);


  if (response.statusCode == 201) {
    print("Ok");
    print(values);
    return values;
  } else {
    print("Error");
    return -1;
  }
}


Future joinRoom(String code, String user) async {


  final http.Response response = await http.post(
    urlBase + 'join/',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "room_code": code,
      "user": user,

    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("Ok");
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
