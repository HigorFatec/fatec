import 'package:flutter/material.dart';

import 'devolucoes.dart';

class Dev {
  final String devolucao;
  final String codigo;

  Dev({
    required this.devolucao,
    required this.codigo,
  });
}

final List<Dev> devolucoes = [
  Dev(devolucao: 'Heineken 600ml', codigo: '001'),
  Dev(devolucao: 'Amstel 600ml', codigo: '002'),
  Dev(devolucao: 'Itubaina 350ml lt', codigo: '003'),
  Dev(devolucao: 'Heineken 330ml ln', codigo: '004'),
];

class DevolucaoScreen extends StatefulWidget {
  const DevolucaoScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DevolucaoScreenState createState() => _DevolucaoScreenState();
}

class _DevolucaoScreenState extends State<DevolucaoScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Devoluções'),
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
                      hintText: 'Buscar por nome do Produto',
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
                itemCount: devolucoes.length,
                itemBuilder: (BuildContext context, int index) {
                  final devolucao = devolucoes[index];
                  if (_searchText.isNotEmpty &&
                      !devolucao.devolucao
                          .toLowerCase()
                          .contains(_searchText.toLowerCase())) {
                    return const SizedBox.shrink();
                  }
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DevolucoesScreen(
                            devolucaoSelecionada: devolucao,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(devolucao.devolucao),
                            subtitle: Text('Codigo: ${devolucao.codigo}'),
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
