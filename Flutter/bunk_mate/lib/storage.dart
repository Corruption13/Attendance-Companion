import 'package:shared_preferences/shared_preferences.dart';


 Future saveObject(String keyArg, String valueArg) async{
    final prefs = await SharedPreferences.getInstance();
    final key = keyArg;
    final value = valueArg;
    prefs.setString(key, value);

}

Future getObject(String key) async{
  final prefs = await SharedPreferences.getInstance();
  String value = prefs.get(key) ?? -1;

  return value;
}
