import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 20, bottom: 12),
                  child: Column(children: [
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
                            if (email == 'admin@admin' && password == 'admin') {
                              Navigator.of(context).pushNamed(
                                  '/home'); //pushReplacementNamed para não voltar para a tela de login
                            } else {
                              _showErrorDialog(
                                  'Login inválido'); //mostrar um dialog
                            }
                          },
                          child: const Text('Entrar'),
                        ),
                        const SizedBox(width: 185),
                        ElevatedButton(
                            child: const Text('Cadastrar'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/cadastrar');
                            }),
                      ],
                    ),
                    GestureDetector(
                      onTap: _irParaRecuperarSenha,
                      child: Column(
                        children: const [
                          Text(
                            'Esqueceu a senha?',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  appBar: AppBar(
        //    title: const Text('Login'),
        //  ),
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
    ));
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _irParaRecuperarSenha() {
    Navigator.of(context).pushNamed('/recuperar_senha');
  }
}
