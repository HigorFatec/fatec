import 'package:flutter/material.dart';

class CadastrarPage extends StatefulWidget {
  const CadastrarPage({Key? key}) : super(key: key);

  @override
  State<CadastrarPage> createState() => _CadastrarPageState();
}

class _CadastrarPageState extends State<CadastrarPage> {
  String nome = '';
  String email = '';
  String password = '';
  String cargo = '';
  String matricula = '';

  final List<String> cargos = ['Administrador', 'Usuário'];

  Widget _body() {
    return ListView(
      children: [
        SizedBox(
          width: 170,
          height: 170,
          child: Image.network('lib/images/lgo.png'),
        ),
        Container(
          height: 20,
        ),
        Card(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 12),
            child: Column(
              children: [
                TextField(
                  onChanged: (text) {
                    nome = text;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nome',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    cargo = text;
                  },
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cargo',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    matricula = text;
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Matricula',
                  ),
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                TextField(
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_validateFields() == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Cadastro realizado com sucesso $nome !'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          Navigator.of(context).pushNamed('/');
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
                      child: const Text('Cadastrar'),
                    ),
                    const SizedBox(width: 185),
                    ElevatedButton(
                      child: const Text('Cancelar'),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.height,
            child: Image.network(
              'lib/images/back.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          _body(),
        ],
      ),
    );
  }

  bool _validateFields() {
    if (nome.isEmpty ||
        cargo.isEmpty ||
        matricula.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      return false;
    } else {
      Navigator.of(context).pushNamed('/');
      return true;
    }
  }
}
