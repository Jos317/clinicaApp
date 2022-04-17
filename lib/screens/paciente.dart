import 'package:flutter/material.dart';
import 'package:clinica/providers/paciente_provider.dart';
import 'package:provider/provider.dart';
// import 'Services.dart';

class Paciente extends StatefulWidget {
  Paciente() : super();

  @override
  State<StatefulWidget> createState() => _PacienteState();
}

class _PacienteState extends State<Paciente> {
  // List<Proveedor> _proveedores = [];

  @override
  void initState() {
    super.initState();
    // Services.getProveedores().then((proveedores) {
    //   setState(() {
    //     _proveedores = proveedores;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final pacienteProvider = Provider.of<PacienteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pacienteProvider.token),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          // itemCount: _proveedores.length,
          itemCount: 10,
          itemBuilder: (context, index) {
            // Proveedor proveedor = _proveedores[index];
            return const Card(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                // child: Text(
                //   "${proveedor.nombre}\n${proveedor.correo}\n${proveedor.telefono}",
                //   style: TextStyle(fontSize: 22.0),
                // ),
                child: Text("Hola", style: TextStyle(fontSize: 22.0)),
              ),
            );
          },
        ),
      ),
    );
  }
}
