import 'package:clinica/providers/paciente_provider.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/ui/input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarPerfilScreen extends StatefulWidget {
  EditarPerfilScreen() : super();

  @override
  State<EditarPerfilScreen> createState() => _EditarPerfilScreenState();
}

class _EditarPerfilScreenState extends State<EditarPerfilScreen> {
  late var serverProvider;
  late var paciente;
  @override
  void initState() {
    super.initState();
    serverProvider = Provider.of<ServerProvider>(context, listen: false);
    // Provider.of<PacienteProvider>(context, listen: false)
    //     .setPaciente(serverProvider.token);
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        // _dropdownValue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pacienteProvider =
        Provider.of<PacienteProvider>(context, listen: false).paciente;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Editar Perfil del Usuario'),
      ),
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
                  // Text(
                  //   "Editar Perfil del paciente",
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  // ),
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
                                    (value.paciente!.imagen != ''
                                        ? "${serverProvider.url}/${value.paciente!.imagen}"
                                        : 'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png'),
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
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
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
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.nombre,
                        labelText: 'Nombre',
                        prefixIcon: Icons.face_unlock_sharp,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.apellido,
                        labelText: 'Apellido',
                        prefixIcon: Icons.person,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.ci,
                        labelText: 'CI',
                        prefixIcon: Icons.credit_card,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.telefono,
                        labelText: 'Teléfono',
                        prefixIcon: Icons.phone,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.direccion,
                        labelText: 'Dirección',
                        prefixIcon: Icons.house,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  // DropdownButton(
                  //   items: [
                  //     DropdownMenuItem<String>(
                  //       child: Text((value.paciente!.sexo == 'M'
                  //           ? 'Masculino'
                  //           : 'Femenino')),
                  //       value: (value.paciente!.sexo),
                  //     ),
                  //     DropdownMenuItem<String>(
                  //       child: Text((value.paciente!.sexo == 'F'
                  //           ? 'Femenino'
                  //           : 'Masculino')),
                  //       value: (value.paciente!.sexo),
                  //     )
                  //   ],
                  //   value: _dropdownValue,
                  //   onChanged: dropdownCallback,
                  // ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: (value.paciente!.sexo == 'M'
                            ? 'Masculino'
                            : 'Femenino'),
                        labelText: 'Sexo',
                        prefixIcon: Icons.safety_divider,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.fechaNac,
                        labelText: 'Fecha de Nacimiento AAAA-MM-DD',
                        prefixIcon: Icons.calendar_month,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  TextFormField(
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecorations.authInputDecoration(
                        hintText: value.paciente!.email,
                        labelText: 'Email',
                        prefixIcon: Icons.alternate_email_sharp,
                      )),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlineButton(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {},
                        child: Text("CANCEL",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.black)),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.deepPurpleAccent,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
