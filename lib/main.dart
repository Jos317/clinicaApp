import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:clinica/providers/paciente_provider.dart';
import 'package:clinica/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

final keyNavegacionNotificacion = GlobalKey<NavigatorState>(debugLabel: 'Texto');
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  NotificationService().initNotificacion();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ServerProvider()),
        ChangeNotifierProvider(create: (_) => PacienteProvider())
      ],
      child: MaterialApp(
        navigatorKey: keyNavegacionNotificacion,
        debugShowCheckedModeBanner: false,
        title: 'ClinicaApp',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'home': (_) => HomeScreen(),
          'paciente': (_) => PacienteScreen(),
          'editar': (_) => EditarPerfilScreen(),
          'notificacion': (_) => NotificacionScreen(),
        },
        
        theme:
            ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.grey[300]),
        // home: JsonParseDemo(),
      ),
    );
  }
}
