part of 'helpers.dart';

mostrarLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const AlertDialog(
            title: Text('Espere...'),
            content: LinearProgressIndicator(),
          ));
}

mostrarAlerta(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    // Navigator.of(context).pop();
                    Navigator.pop(context);
                  })
            ],
          ));
}

showAlertDialog2(BuildContext context, int id) async {
  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Eliminar"),
    onPressed: () {
      FocusScope.of(context).unfocus();
      eliminar(context, id);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Eliminar Consulta"),
    content: Text("Está de acuerdo en eliminar esta consulta?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

eliminar(BuildContext context, int id) async {
  mostrarLoading(context);
  final token = SharedPreferencesMemory().obtenerToken();
  final url = ServerProvider().url;
  final response = await http.post(Uri.parse(url + '/api/eliminarConsulta'),
      headers: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({'id': id.toString()}));
  final respuesta = jsonDecode(response.body);
  // print(respuesta);
  Navigator.pop(context);
  if (200 == response.statusCode) {
    // serverProvider.token = respuesta['token'];
    Provider.of<ConsultaProvider>(context, listen: false).consultas = null;
    Navigator.pushReplacementNamed(context, 'consulta');
  } else {
    final mensajeErroneo = jsonEncode(respuesta['mensaje']);
    mostrarAlerta(context, 'Error', mensajeErroneo);
  }
}
