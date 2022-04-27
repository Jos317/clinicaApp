import 'package:clinica/providers/paciente_provider.dart';
import 'package:clinica/providers/server_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final pacienteProvider = Provider.of<PacienteProvider>(context, listen: false).paciente;
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${pacienteProvider!.nombre}'),
            // accountName: Text('${pacienteProvider!.nombre} ${pacienteProvider.email}'),
            accountEmail: Text(pacienteProvider.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: (pacienteProvider.imagen == '' ? 
                  Image.network('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  ):
                  Image.network('${ServerProvider().url}/${pacienteProvider.imagen}',
                    fit: BoxFit.cover,
                    width: 90,
                    height: 90,
                  )
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')
              ),
            ),
          ),
           ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () => Navigator.pushReplacementNamed(context, 'paciente'),
          ),
          ListTile(
            leading: const Icon(Icons.terminal),
            title: const Text('Consultas'),
            onTap: () => Navigator.pushReplacementNamed(context, 'consulta'),
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Request'),
            onTap: () => {
              Navigator.pushReplacementNamed(context, 'notificacion')
            },
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}