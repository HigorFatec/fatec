import 'package:flutter/material.dart';
import 'package:meuapp/login_page.dart';
import 'package:meuapp/recuperar_senha.dart';
import 'package:meuapp/sobre.dart';

import 'app_controller.dart';
import 'cadastrar.dart';
import 'dados_motorista.dart';
import 'devolucoes.dart';
import 'home_page.dart';
import 'motorista_dt.dart';
import 'produtos_devolucao.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            '/home': (context) => const HomePage(),
            '/cadastrar': (context) => const CadastrarPage(),
            '/recuperar_senha': (context) => const RecuperarSenhaPage(),
            '/dados_motorista': (context) => const DadosMotoristaScreen(),
            '/sobre': (context) => const SobrePage(),
            '/dts': (context) => const MotoristasScreen(),
            '/devolucoes': (context) => const DevolucoesScreen(),
            '/listdevolucao': (context) => const DevolucaoScreen(),
          },
        );
      },
    );
  }
}
