import 'package:clinica/providers/server_provider.dart';
import 'package:flutter/material.dart';
import 'package:clinica/providers/paciente_provider.dart';
import 'package:clinica/screens/screens.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServerProvider()),
        ChangeNotifierProvider(create: (_) => PacienteProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ClinicaApp',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'paciente': (_) => PacienteScreen(),
          'editar': (_) => EditarPerfilScreen(),
        },
        
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        // home: JsonParseDemo(),
      ),
    );
  }
}
