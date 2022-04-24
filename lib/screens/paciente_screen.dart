import 'package:clinica/models/paciente_model.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/screens/editar_perfil_screen.dart';
import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/services/paciente_service.dart';
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
    serverProvider = Provider.of<ServerProvider>(context, listen: false);
    Provider.of<PacienteProvider>(context, listen: false)
        .setPaciente(serverProvider.token);
  }

  @override
  Widget build(BuildContext context) {
    final pacienteProvider =
        Provider.of<PacienteProvider>(context, listen: false).paciente;
    print(pacienteProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'editar');
            },
          ),
        ],
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
      body: Container(
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
                              color: Theme.of(context).scaffoldBackgroundColor),
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
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blueAccent,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TextFormField(
                  enabled: false,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Password',
                    labelText: (pacienteProvider?.nombre == ''
                        ? 'No hay informacion'
                        : '${pacienteProvider?.nombre}'),
                    prefixIcon: Icons.face_unlock_sharp,
                  )),
              SizedBox(
                height: 35,
              ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.apellido}',
              //     prefixIcon: Icons.person,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.ci}',
              //     prefixIcon: Icons.credit_card,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.telefono}',
              //     prefixIcon: Icons.phone,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.direccion}',
              //     prefixIcon: Icons.house,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: pacienteProvider.sexo == 'M' ? 'Masculino' : 'Femenino',
              //     prefixIcon: Icons.safety_divider,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.fechaNac}',
              //     prefixIcon: Icons.calendar_month,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // TextFormField(
              //   enabled: false,
              //   decoration: InputDecorations.authInputDecoration(
              //     hintText: 'Password',
              //     labelText: '${pacienteProvider.email}',
              //     prefixIcon: Icons.alternate_email_sharp,
              //   )
              // ),
              // SizedBox(
              //   height: 35,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     OutlineButton(
              //       padding: EdgeInsets.symmetric(horizontal: 50),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //       onPressed: () {},
              //       child: Text("CANCEL",
              //           style: TextStyle(
              //               fontSize: 14,
              //               letterSpacing: 2.2,
              //               color: Colors.black)),
              //     ),
              //     RaisedButton(
              //       onPressed: () {},
              //       color: Colors.deepPurpleAccent,
              //       padding: EdgeInsets.symmetric(horizontal: 50),
              //       elevation: 2,
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20)),
              //       child: Text(
              //         "SAVE",
              //         style: TextStyle(
              //             fontSize: 14,
              //             letterSpacing: 2.2,
              //             color: Colors.white),
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Consumer<PacienteProvider>(builder: (context, value, child) {
      //     if(value.paciente == null){
      //       return CircularProgressIndicator();
      //     }
      //     return Text(value.paciente!.email);
      //   }),
      // ),
    );
  }
}
