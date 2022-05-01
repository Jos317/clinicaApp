import 'dart:convert';
import 'package:clinica/providers/server_provider.dart';
import 'package:clinica/services/shared_preferences.dart';
import 'package:clinica/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:clinica/ui/input_decorations.dart';
import 'package:clinica/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                    _LoginForm()
                  ],
                ),
              ),
              const SizedBox(height: 50),
          // const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 50),
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final loginForm = Provider.of<LoginFormProvider>(context);
    // final serverProvider = Provider.of<ServerProvider>(context);

    return Container(
      child: Form(
        // key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Email',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_sharp,
              ),
              onChanged: (value) => value,
              validator: (value) {
                // String pattern =
                //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                // RegExp regExp = new RegExp(pattern);
                // return regExp.hasMatch(value ?? '')
                //     ? null
                //     : 'El valor ingresado no luce como correo';
                if (value!.isEmpty) {
                  return 'Ingrese el correo del usuario';
                }
                return null;
              },
              controller: email,
            ),
            const SizedBox(height: 30),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Password',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: (value) => value,
              validator: (value) {
                return (value != null)
                    ? null
                    : 'Ingrese la contraseña del correo';
              },
              controller: password,
            ),
            const SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: const Text('Ingresar',
                        style: TextStyle(color: Colors.white))),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  login(email.text, password.text, context);
                }

                // onPressed: loginForm.isLoading
                //     ? null
                //     : () async {
                //         FocusScope.of(context).unfocus();
                //         if (!loginForm.isValidForm()) return;
                //         loginForm.isLoading = true;
                //         await Future.delayed(Duration(seconds: 2));
                //         //TODO:validar si el login es correcto
                //         loginForm.isLoading = false;
                //         Navigator.pushReplacementNamed(context, 'proveedores');
            ),
          ],
        ),
      ),
    );
  }

  login(String email, String password, BuildContext context) async {
    mostrarLoading(context);
    final url = ServerProvider().url;
    final response = await http.post(
        Uri.parse(url+'/api/login'),
        body: {'email': email, 'password': password});
    final respuesta = jsonDecode(response.body);
    // print(respuesta);
    Navigator.pop(context);
    if (200 == response.statusCode) {
      // serverProvider.token = respuesta['token'];
      SharedPreferencesMemory().setearId(respuesta['data']['id']);
      SharedPreferencesMemory().setearToken(respuesta['token']);
      Navigator.pushReplacementNamed(context, 'paciente');
    } else {
      final mensajeErroneo = jsonEncode(respuesta['mensaje']);
      mostrarAlerta(context, 'Error', mensajeErroneo);
      // return ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Row(
      //       children: [
      //         const Icon(Icons.close),
      //         const SizedBox(width: 20),
      //         Expanded(child: Text(mensajeErroneo))
      //       ],
      //     ),
      //   ),
      // );
    }
  }
}
