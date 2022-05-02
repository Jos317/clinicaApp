import 'package:clinica/providers/consulta_provider.dart';
import 'package:clinica/providers/providers.dart';
import 'package:clinica/services/notification_service.dart';
import 'package:clinica/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:clinica/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

final keyNavegacionNotificacion = GlobalKey<NavigatorState>(debugLabel: 'Texto');
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  await SharedPreferencesMemory().init();
  NotificationService().initNotificacion();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => ServerProvider()),
        ChangeNotifierProvider(create: (_) => PacienteProvider()),
        ChangeNotifierProvider(create: (_) => MedicoProvider()),
        ChangeNotifierProvider(create: (_) => ConsultaProvider()),
      ],
      child: MaterialApp(
        navigatorKey: keyNavegacionNotificacion,
        debugShowCheckedModeBanner: false,
        title: 'Nitabara',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'paciente': (_) => PacienteScreen(),
          'consulta': (_) => ConsultaScreen(),
          'crear': (_) => CrearConsultaScreen(),
          'notificacion': (_) => NotificacionScreen(),
        },
        // if(SharedPreferencesMemory().obtenerToken() != null)
        //     {
        //       return PacienteScreen();
        //     }else{
        //       return LoginScreen();
        //     }
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        
        // supportedLocales: [
        //   const Locale('en'), // English
        //   const Locale('es'), // Spanish
        //   const Locale('fr'), // French
        //   const Locale('zh'), // Chinese
        // ],
        // home: JsonParseDemo(),
      ),
    );
  }
}
