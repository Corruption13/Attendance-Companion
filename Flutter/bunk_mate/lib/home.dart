import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bunk Master"),),
      body: Container(
        child: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40,),
                MaterialButton(
                  onPressed: () => Navigator.pushNamed(context, "createRoom"),
                  child: Text("Create Room"),
                ),
                MaterialButton(
                  onPressed: () => print("Boop"),
                  child: Text("Join Room"),
                ),
              ],
            ),
            SizedBox(height: 100,),
            Container(
                child: Column(
                  children: <Widget>[
                    Text("Classes:"),
                    SizedBox(height: 50,),
                    Text("Class1"),
                    Text("Class2"),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}