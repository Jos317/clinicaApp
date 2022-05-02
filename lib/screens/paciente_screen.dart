import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/ui/input_decorations.dart';
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
    serverProvider = ServerProvider();
    Provider.of<PacienteProvider>(context, listen: false).setPaciente();
  }

  @override
  Widget build(BuildContext context) {
    final pacienteProvider =
        Provider.of<PacienteProvider>(context, listen: false).paciente;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        centerTitle: true,
        title: const Text('Clínica Nitabara'),
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
          if (value.paciente == null) {
            return CircularProgressIndicator();
          }
          return Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Text(
                    "Perfil del paciente",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10))
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    (value.paciente!.imagen != '' ? "${serverProvider.url}/${value.paciente!.imagen}":'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png'),
                                  )
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Nombre:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.nombre,
                        prefixIcon: Icons.face_unlock_sharp,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Apellido:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.apellido,
                        prefixIcon: Icons.person,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('CI:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.ci,
                        prefixIcon: Icons.credit_card,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Teléfono:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.telefono,
                        prefixIcon: Icons.phone,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Dirección:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.direccion,
                        prefixIcon: Icons.house,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Sexo:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: (value.paciente!.sexo == 'M' ? 'Masculino':'Femenino'),
                        prefixIcon: Icons.safety_divider,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Fecha de Nacimiento:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.fechaNac,
                        prefixIcon: Icons.calendar_month,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Text('Email:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  TextFormField(
                      enabled: false,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: '',
                        labelText: value.paciente!.email,
                        prefixIcon: Icons.alternate_email_sharp,
                      )),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
