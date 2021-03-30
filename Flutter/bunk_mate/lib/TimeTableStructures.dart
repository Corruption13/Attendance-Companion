
class Subject{
  String name;
  String url;
  String faculty;
  String shortform;
  String attendancelink;
  Subject({this.name, this.url, this.faculty, this.shortform, this.attendancelink});

  Subject.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        url = json['url'],
        faculty = json['faculty'],
        shortform = json['shortform'],
        attendancelink = json['attendancelink'];
  // Converts a Json File Argument and assigns it to Subject Object

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
    'faculty': faculty,
    'shortform': shortform,
    'attendancelink': attendancelink
  };
  // Converts a Class Object to Json Object

}


class Period {
  String subject_name;
  String start_time;
  String end_time;
  String day;

  Period({this.subject_name, this.start_time, this.end_time, this.day});

  Period.fromJson(Map<dynamic, dynamic> json)
      : subject_name = json['subject_name'],
        start_time = json['start_time'],
        end_time = json['end_time'],
        day = json['day'];
          //attendancelink = json['attendancelink'];
    // Converts a Json File Argument and assigns it to Subject Object

    Map<String, dynamic> toJson() => {
      'subject_name': subject_name,
      'start_time': start_time,
      'end_time': end_time,
      'day': day,
      //'attendancelink': attendancelink
    };


}


class Capsule{

  Period period;
  Subject subject;
  Capsule({this.period, this.subject});

}