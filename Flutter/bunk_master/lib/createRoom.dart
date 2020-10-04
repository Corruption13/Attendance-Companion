import 'package:flutter/material.dart';
//import 'package:http/http.dart';
import 'dart:convert';

var urlBase = "localhost:700";

class CreateRoomForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Class Room"),),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Container(

          child: Column(
            children: [

              Text("Room Name"),
              TextField(),
              SizedBox(height: 20,),
              Text("Details"),
              TextField(),

            ],
          ),
        ),
      ),
    );
  }
}


Future scrape() async{
  //String url = "https://kerala.gov.in/gos/circulars?p_p_id=GovernmentResolutions_WAR_ssdgportlet_INSTANCE_lQv99fpalK7U&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_GovernmentResolutions_WAR_ssdgportlet_INSTANCE_lQv99fpalK7U_myaction=grResults";

  //("Query-> $data");
  //List orders = [];
  //Response response = await post(url);
  //var decoded = utf8.decode(response.bodyBytes);
  // print(decoded) ;

  //list1.addAll(list2);

  //return orders;

}