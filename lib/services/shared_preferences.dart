import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesMemory{
  SharedPreferencesMemory._privateConstructor();

  static final SharedPreferencesMemory _instancia = SharedPreferencesMemory._privateConstructor();

  factory SharedPreferencesMemory() {
    return _instancia;
  }

  late SharedPreferences prefs;

  init() async{
    prefs = await SharedPreferences.getInstance(); 
  }

  setearToken(String token) async{
    await prefs.setString('token', token);  
  }

  obtenerToken() {
    return prefs.getString('token');
  }

  setearId(int id) async{
    await prefs.setString('id', id.toString());  
  }

  obtenerId() {
    return prefs.getString('id');
  }
}