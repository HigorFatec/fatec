import 'package:flutter/material.dart';

class RecuperarSenhaPage extends StatefulWidget {
  const RecuperarSenhaPage({super.key});

  @override
  State<RecuperarSenhaPage> createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  String email = '';

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 160.0),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Card(
              child: Column(
                children: [
                  const Text(
                    'Informe o e-mail cadastrado para recuperar a senha',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (email.isEmpty) {
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
                        return;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Email enviado com sucesso para $email'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Recuperar senha'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
      ),
      body: Stack(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.height,
              child: Image.network(
                'lib/images/back.jpg',
                fit: BoxFit.cover,
              )),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          _body(),
        ],
      ),
    );
  }
}
