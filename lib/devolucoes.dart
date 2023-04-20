import 'package:flutter/material.dart';
import 'package:meuapp/produtos_devolucao.dart';

class DevolucoesScreen extends StatefulWidget {
  final Dev? devolucaoSelecionada;

  const DevolucoesScreen({Key? key, this.devolucaoSelecionada})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DevolucoesScreenState createState() => _DevolucoesScreenState();
}

class _DevolucoesScreenState extends State<DevolucoesScreen> {
  final List<Devolucao> _devolucoes = [];

  final _nomeController = TextEditingController();
  final _quantidadeController = TextEditingController();

  String nome = '';
  String quantidade = '';

  @override
  @override
  void initState() {
    super.initState();
    if (widget.devolucaoSelecionada != null) {
      _nomeController.text = widget.devolucaoSelecionada!.devolucao;
      nome = widget.devolucaoSelecionada!.devolucao;
    }
  }

  void _adicionarDevolucao() {
    setState(() {
      _devolucoes.add(
        Devolucao(
          nome: _nomeController.text,
          quantidade: int.tryParse(_quantidadeController.text) ?? 0,
        ),
      );

      _nomeController.clear();
      _quantidadeController.clear();
    });
  }

  void _removerDevolucao(int index) {
    setState(() {
      _devolucoes.removeAt(index);
    });
  }

  void _salvarDevolucoes() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Devoluções salvas com sucesso!')),
    );
    Navigator.of(context).pushNamed('/home');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) {
      setState(() {
        _nomeController.text = args;
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
        title: const Text('Devoluções'),
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
            Expanded(
              child: ListView.builder(
                itemCount: _devolucoes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.delete),
                      title: Text(_devolucoes[index].nome),
                      subtitle:
                          Text('${_devolucoes[index].quantidade} unidades(s)'),
                      onTap: () => _removerDevolucao(index),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nova Devolução',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      onChanged: (text) {
                        nome = text;
                      },
                      controller: _nomeController,
                      decoration: InputDecoration(
                        labelText: 'Nome da devolução',
                        border: const OutlineInputBorder(),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/listdevolucao');
                          },
                          child: const Icon(Icons.list),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      onChanged: (text) {
                        quantidade = text;
                      },
                      controller: _quantidadeController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_validateFields() == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Devolução inserida com sucesso!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          _adicionarDevolucao();
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
                      child: const Text('Adicionar devolução'),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: _salvarDevolucoes,
                      child: const Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateFields() {
    if (nome.isEmpty || quantidade.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}

class Devolucao {
  final String nome;
  final int quantidade;

  Devolucao({
    required this.nome,
    required this.quantidade,
  });
}
