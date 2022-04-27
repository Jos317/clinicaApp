import 'package:clinica/screens/nav_bar.dart';
import 'package:flutter/material.dart';

class ConsultaScreen extends StatelessWidget {
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
          itemBuilder: (ctx, index) {
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
                                'Motivo Motivo Motiv o Motivo Motivo',
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
                              'HoraInicio',
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
                              'HoraFin',
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
                          padding: EdgeInsets.all(12.0),
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
          itemCount: 5,
        ),
      ),
    );
  }
}
