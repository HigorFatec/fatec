import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Tema escolhido:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              ' Retorno de rotas',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0),
            Text(
              'Objetivo do aplicativo:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
                'Desenvolver um aplicativo que transforme o retorno de rotas manuscrito em digital.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center),
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('lib/images/higor.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Desenvolvido por Higor Machado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Image.network(
                'lib/images/fundosobre.jpg',
                fit: BoxFit.cover,
              )),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          body(),
        ],
      ),
    );
  }
}
