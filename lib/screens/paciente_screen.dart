import 'package:clinica/models/paciente_model.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/services/paciente_service.dart';
import 'package:flutter/material.dart';
import 'package:clinica/providers/paciente_provider.dart';
import 'package:provider/provider.dart';
// import 'Services.dart';

class PacienteScreen extends StatefulWidget {
  PacienteScreen() : super();

  @override
  State<StatefulWidget> createState() => _PacienteState();
}

class _PacienteState extends State<PacienteScreen> {
  late var serverProvider;
  late var paciente;
  @override
  void initState() {
    super.initState();
    serverProvider = Provider.of<ServerProvider>(context, listen: false);
    Provider.of<PacienteProvider>(context, listen: false).setPaciente(serverProvider.token);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Clinica App'),
      ),
      drawer: NavBar(),
      // body: Center(
      //   child: FutureBuilder(
      //     future: Provider.of<PacienteProvider>(context, listen: false).setPaciente(serverProvider.token),
      //     builder: (context, snapshot) {
      //       if(snapshot.connectionState == ConnectionState.done)
      //       {
      //         return Text(Provider.of<PacienteProvider>(context).paciente!.email);
      //       }
      //       return CircularProgressIndicator();
      //   },),
      // ),
      body: Center(
        child: Consumer<PacienteProvider>(builder: (context, value, child) {
          if(value.paciente == null){
            return CircularProgressIndicator();
          }
          return Text(value.paciente!.email);
        }),
      ),
    );
  }
}
