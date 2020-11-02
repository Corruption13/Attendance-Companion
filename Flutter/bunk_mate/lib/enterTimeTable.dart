import 'package:flutter/material.dart';
import 'AlertFunctions.dart';
import 'TimeTableStructures.dart';
import 'storage.dart';
import 'dart:convert';
import 'dart:math';

Subject GlobalTemp;


class TimeTableForm extends StatefulWidget {

  final List<Subject> subjectCards;
  TimeTableForm({Key key, @required this.subjectCards}) : super(key: key);
  @override
  _TimeTableFormState createState() => _TimeTableFormState(subjectCards);
}

class _TimeTableFormState extends State<TimeTableForm> {
  @override
  List<Subject> subjectCards;
  _TimeTableFormState(this.subjectCards);



  List<Subject> da  = [] ;

  Future<List<Subject>> loadsubjects() async{


    List<Subject> da = [] ;


    String subjectString = await getObject("subjects");


    if(subjectString != null){

      var subjects = json.decode(subjectString);
      for(int i = 0; i < subjects.length; i++){
        Subject temp = Subject.fromJson(subjects[i]);
        da.add(temp); 
      }
    }

    return da;
  }


  Widget build(BuildContext context) {




    return FutureBuilder<List<Subject>>(
    future: loadsubjects(),
    builder: (context, AsyncSnapshot<List<Subject>> snapshot) {
      if (snapshot.hasData) {
        return Scaffold(
          appBar: AppBar(title: Text("Create Time Table"),),
          body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      children: [

                        Column(
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(vertical: 20.0),
                                height: 200.0,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    for (var i in snapshot.data)  SubjectCard(details: i)
                                  ],
                                ),

                            )
                          ],
                        ),

                        SizedBox(height: 20, width: 20,),

                        RaisedButton(
                          child: Text("new subject"),
                          onPressed: () async{
                            //var item = showAlertWidget(context, "Enter Details", CreateSubject());

                            Navigator.pushNamed(context, "createSubject", arguments: snapshot.data);

                          },
                        ),

                      ],
                    ),


                  ),
                ),
              ),
            ),
          );
      } else {
        return CircularProgressIndicator();
        }
    }
    );


  }

}





class SubjectCard extends StatefulWidget {
  final Subject details;
  SubjectCard({Key key, @required this.details}) : super(key: key);

  @override
  _SubjectCardState createState() => _SubjectCardState(details);
}

class _SubjectCardState extends State<SubjectCard> {
  Subject details;
  var color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.25);
  _SubjectCardState(this.details);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 1),
      child: Card(
        color: color,
        child: Center(
          child: Container(
            color: color,
            constraints: BoxConstraints(
                minHeight: 100, minWidth: 100),
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text(details.name ?? "", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 30,),
                  Text(details.shortform ?? " "),
                  SizedBox(height: 10,),
                  Text(details.url ?? " "),
                  SizedBox(height: 10,),
                  Text(details.faculty ?? " ")
                ],
              ),
            ),
          ),
        ),

      ),
    );
  }
}


// for (var i in snapshot.data)  SubjectCard(details: i)



