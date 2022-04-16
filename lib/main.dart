import 'package:flutter/material.dart';
import 'package:clinica/providers/usuarioprovider.dart';
import 'package:clinica/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ClinicaApp',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'pacientes': (_) => Paciente(),
        },
        
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        // home: JsonParseDemo(),
      ),
    );
  }
}