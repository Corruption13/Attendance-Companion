import 'package:bunk_mate/storage.dart';
import 'package:flutter/material.dart';
import 'TimeTableStructures.dart';
import 'package:bunk_mate/HelperFunctions.dart';
import 'dart:convert';

class CreateSubject extends StatefulWidget {
  @override
  _CreateSubjectState createState() => _CreateSubjectState();
}

class _CreateSubjectState extends State<CreateSubject> {




  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context).settings.arguments;
    List<Subject> da = data;
    print(da.runtimeType);

    Subject temp = Subject();


    final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

    Widget _buildClassName(){
      return TextFormField(
        decoration: InputDecoration(
            labelText: "Subject Name",
            hintText: "Name"
        ),

        onSaved: (String value){
          temp.name = value ;
        },
      );
    }

    Widget _buildURL(){
      return TextFormField(
        decoration: InputDecoration(
          labelText: "Online Class URL",
          hintText: "http://meet.google.com/XYZ",

        ),

        onSaved: (String value){
          temp.url = value ;
        },
      );
    }
    Widget _buildFaculty(){
      return TextFormField(
        decoration: InputDecoration(
          labelText: "Faculty Name",
          hintText: "",

        ),

        onSaved: (String value){
          temp.faculty = value ;
        },
      );
    }

    Widget _buildShortForm(){
      return TextFormField(
        decoration: InputDecoration(
          labelText: "Subject Short Form",
          hintText: "",

        ),

        onSaved: (String value){
          temp.shortform = value ;
        },
      );
    }

    Widget _buildAttendanceLink(){
      return TextFormField(
        decoration: InputDecoration(
          labelText: "Attendance Link URL",
          hintText: "Moodle/G-Class",

        ),

        onSaved: (String value){
          temp.attendancelink = value ;
        },
      );
    }

    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(42.0),
          child: Form(
            key: _formKey,
            child:
            Column(
              children: [
                _buildClassName(),
                _buildShortForm(),
                _buildURL(),
                _buildAttendanceLink(),
                _buildFaculty(),

                RaisedButton(
                  child: Text("Create Subject"),
                  onPressed: () async{
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                    _formKey.currentState.save();



                    da.add(temp);
                    String savedSubjects = json.encode(da);
                    await saveObject("subjects", savedSubjects);
                    var count = await getObject("subjectCount");
                    if(count == null) count = "0";
                    int countInt = int.parse(count) + 1;
                    await saveObject( "subjectCount" , countInt.toString());

                    print("2nd: " + temp.toJson().toString());
                    print(count);
                    print(countInt);


                    Navigator.pushReplacementNamed(context, "timeTableForm", arguments: da);
                  },
                )
              ],
            ),



          ),
        ),
      ),
    );


  }
}