import 'TimeTableStructures.dart';
import 'dart:convert';

String clean(String source, [String remove = "|" , String replace = ""]){
      return source.replaceAll(remove, replace);

}


String ListSubjecttoString(List<Subject> subjects){
      return json.encode(subjects);
}

List<dynamic> StringtoListSubjects(String subjectString){
          return json.decode(subjectString);
}


/*
int main(){

  Subject A = Subject(name: "Apple", shortform: "ApL", faculty: "Jaya");
  Subject B = Subject(name: "Banana", shortform: "Bnan", faculty: "Pilla");

  List<Subject> list = [A, B];



  String x = ListSubjecttoString(list);

  print(x);

  var newlist = StringtoListSubjects(x);

  print(ListSubjecttoString(newlist));



}
*/



