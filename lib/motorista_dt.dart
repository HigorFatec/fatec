import 'package:flutter/material.dart';

class Motorista {
  final String motorista;
  final String dt;
  final String placa;

  Motorista({
    required this.motorista,
    required this.dt,
    required this.placa,
  });
}

final List<Motorista> motoristas = [
  Motorista(motorista: 'Marcio', dt: '001', placa: 'EBC1234'),
  Motorista(motorista: 'Fernando', dt: '002', placa: 'DEF5678'),
  Motorista(motorista: 'José', dt: '003', placa: 'GHI9012'),
  Motorista(motorista: 'Pedro', dt: '004', placa: 'JKL3456'),
];

class MotoristasScreen extends StatefulWidget {
  const MotoristasScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MotoristasScreenState createState() => _MotoristasScreenState();
}

class _MotoristasScreenState extends State<MotoristasScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motoristas'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Buscar por nome',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: motoristas.length,
                itemBuilder: (BuildContext context, int index) {
                  final motorista = motoristas[index];
                  if (_searchText.isNotEmpty &&
                      !motorista.motorista
                          .toLowerCase()
                          .contains(_searchText.toLowerCase())) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/dados_motorista',
                        arguments: motorista,
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(motorista.motorista),
                            subtitle: Text(
                                'DT: ${motorista.dt}, Placa: ${motorista.placa}'),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
