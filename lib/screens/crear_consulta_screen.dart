import 'package:clinica/models/medico_model.dart';
import 'package:clinica/providers/providers.dart';
import 'package:clinica/services/medicos_service.dart';
import 'package:clinica/ui/input_decorations.dart';
import 'package:clinica/widgets/button_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class CrearConsultaScreen extends StatefulWidget {
  @override
  State<CrearConsultaScreen> createState() => _CrearConsultaScreenState();
}

class _CrearConsultaScreenState extends State<CrearConsultaScreen> {
  DateTime dateTime = DateTime.now();
  DateTime dateTimefin = DateTime.now();
  TextEditingController motivo = TextEditingController();

  String getText() {
    return DateFormat('yyyy/MM/dd HH:mm').format(dateTime);
  }

  String getText2() {
    return DateFormat('yyyy/MM/dd HH:mm').format(dateTimefin);
  }

  
  int _value = 1;
   List<DropdownMenuItem<int>> _menuItems = [];

  late List<MedicoModel> _medicos;

  @override
  void initState() {
    super.initState();
    
    MedicosService.getMedicos().then((medicos) {
      setState(() {
        _medicos = medicos;

        _menuItems = List.generate(
          _medicos.length,
          (i) => DropdownMenuItem(
            value: _medicos[i].id,
            child: Text("${_medicos[i].nombre}"),
          ),
        );
        
      });
    });

    
  }

  @override
  Widget build(BuildContext context) {
    final medicoProvider =
        Provider.of<MedicoProvider>(context, listen: false).medicos;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text('Creando Consulta'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: 'Motivo',
                    labelText: 'Motivo de la consulta',
                    prefixIcon: Icons.text_fields,
                  ),
                  onChanged: (value) => value,
                  validator: (value) {
                    return (value != null) ? null : 'Ingrese el motivo';
                  },
                  controller: motivo,
                ),
                const SizedBox(height: 30),
                ButtonHeaderWidget(
                  title: 'Inicio de la consulta',
                  text: getText(),
                  onClicked: () => pickDateTime(context),
                ),
                const SizedBox(height: 30),
                ButtonHeaderWidget(
                  title: 'Fin de la consulta',
                  text: getText2(),
                  onClicked: () => pickDateTime2(context),
                ),
                const SizedBox(height: 30),
                Text('Seleccione al médico',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                ),),
                DropdownButton<int>(
                  isExpanded: true,
                  items: _menuItems,
                  value: _value,
                  onChanged: (value) => setState(() {
                    _value = value!;
                    print(_value);
                  }),
                ),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.center,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.deepPurple,
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 70, vertical: 15),
                        child: const Text('Crear',
                            style: TextStyle(color: Colors.white))),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      // login(email.text, password.text, context, serverProvider);
                    }),
                ),
                
              ],
            ),
          ),
          const SizedBox(height: 50),
          // const Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // const SizedBox(height: 50),
        ],
      ),
    );
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future pickDateTime2(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final time = await pickTime(context);
    if (time == null) return;

    setState(() {
      dateTimefin = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future pickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  Future pickTime(BuildContext context) async {
    final newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute));

    if (newTime == null) return null;

    return newTime;
  }
}
