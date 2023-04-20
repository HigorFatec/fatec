import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'motorista_dt.dart';

class DadosMotoristaScreen extends StatefulWidget {
  const DadosMotoristaScreen({Key? key}) : super(key: key);

  @override
  State<DadosMotoristaScreen> createState() => _DadosMotoristaScreenState();
}

class _DadosMotoristaScreenState extends State<DadosMotoristaScreen> {
  String dt = '';
  String km = '';
  String motorista = '';
  String placa = '';
  String data = '';
  String horario = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Motorista?;
    if (args != null) {
      setState(() {
        dt = args.dt;
        motorista = args.motorista;
        placa = args.placa;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('lib/images/logo.png'),
              ),
              accountEmail: Text('higor.machado'),
              accountName: Text('Higor Machado'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              subtitle: const Text('Tela Inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Dados do Motorista'),
              subtitle: const Text('Inserir os dados'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/dados_motorista');
              },
            ),
            ListTile(
              leading: const Icon(Icons.reply),
              title: const Text('Devoluções'),
              subtitle: const Text('Devolução de produtos'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/devolucoes');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logoff'),
              subtitle: const Text('finaliza a sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Dados Motorista'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                Card(
                  child: TextFormField(
                    initialValue: dt,
                    onChanged: (text) {
                      setState(() {
                        dt = text;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Número da DT',
                      border: const OutlineInputBorder(),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/dts');
                        },
                        child: const Icon(Icons.list),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  child: TextFormField(
                    initialValue: motorista,
                    onChanged: (text) {
                      motorista = text;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Motorista',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  child: TextFormField(
                    onChanged: (text) {
                      km = text;
                    },
                    decoration: const InputDecoration(
                      labelText: 'KM',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.directions_car),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  child: TextFormField(
                    initialValue: placa,
                    onChanged: (text) {
                      placa = text;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Placa',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.directions_car),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  color: Colors.grey[400],
                  child: TextFormField(
                    initialValue: getCurrentDate(),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Data',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Card(
                  color: Colors.grey[400],
                  child: TextFormField(
                    initialValue: getCurrentTime(),
                    enabled: false,
                    decoration: const InputDecoration(
                      labelText: 'Hora',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (_validateFields() == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Dados do Motorista $motorista Preenchidos com Sucesso !'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                      Navigator.of(context).pushNamed('/home');
                    } else {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Campos incompletos'),
                          content: const Text(
                              'Por favor, preencha todos os campos.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: const Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validateFields() {
    if (dt.isEmpty ||
        motorista.isEmpty ||
        km.isEmpty ||
//        data.isEmpty ||
        placa.isEmpty) {
//        horario.isEmpty
      return false;
    } else {
      Navigator.of(context).pushNamed('/');
      return true;
    }
  }

  String getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return formattedDate;
  }

  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm:ss').format(now);
    return formattedTime;
  }
}
