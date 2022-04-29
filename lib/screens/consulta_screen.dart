import 'package:clinica/models/consulta_model.dart';
import 'package:clinica/screens/nav_bar.dart';
import 'package:clinica/services/consultas_service.dart';
import 'package:flutter/material.dart';

class ConsultaScreen extends StatefulWidget {
  @override
  State<ConsultaScreen> createState() => _ConsultaScreenState();
}

class _ConsultaScreenState extends State<ConsultaScreen> {
  List<ConsultaModel> _consultas = [];

  @override
  void initState() {
    super.initState();
    ConsultasService.getConsultas().then((consultas) {
      setState(() {
        _consultas = consultas;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(
              Icons.playlist_add_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'crear');
            },
          ),
        ],
        centerTitle: true,
        title: const Text('Consultas'),
      ),
      drawer: NavBar(),
      body: Container(
        height: 700,
        child: ListView.builder(
          itemCount: _consultas.length,
          itemBuilder: (ctx, index) {
            ConsultaModel consulta = _consultas[index];
            return Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                        Colors.white,
                        Colors.lightBlueAccent.withOpacity(0.2)
                      ])),
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 15,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 133, 119, 119)
                                      .withOpacity(0.3),
                                  spreadRadius: 1.2,
                                  blurRadius: 7,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.local_hospital,
                              color: Colors.purple[400],
                            ),
                          ),
                          padding: EdgeInsets.all(5),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: Text(
                                "${consulta.motivo}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Médico',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${consulta.inicio}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                              // 'From: ' +
                              //     DateFormat.yMMMd()
                              //         .format(widget.offers[index].dateFrom),
                              // style: TextStyle(
                              //   color: Colors.grey,
                              // ),
                            ),
                            Text(
                              "${consulta.fin}",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  label: const Text('Eliminar'),
                                  icon: const Icon(Icons.delete),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.red[700])),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
