import 'package:flutter/material.dart';
import 'package:meuapp/sobre.dart';

void main() {
  runApp(const AppWidget(title: 'Conferência Retorno de Rotas'));
}

class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
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
        title: const Text('Retorno De Rotas '),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const SobrePage()));
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("lib/images/cargopolo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed('/dados_motorista');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.person),
                        SizedBox(width: 20),
                        Text(
                          'Dados Motorista',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/devolucoes');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.reply),
                        SizedBox(width: 20),
                        Text(
                          'Devolução',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 05,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.add),
                      SizedBox(width: 20),
                      Text(
                        'Sobra',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.remove),
                      SizedBox(width: 20),
                      Text(
                        'Falta',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.swap_horiz),
                      SizedBox(width: 20),
                      Text(
                        'Troca',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.warning),
                      SizedBox(width: 20),
                      Text(
                        'Avarias',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.local_shipping),
                      SizedBox(width: 20),
                      Text(
                        'Caixas',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
