import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'criar_conta.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/label_entrada.dart';
import '../widgets/botao_custom.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({Key? key}) : super(key: key);

  static void navegar(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginTela()),
    );
  }

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  final _key = GlobalKey<_LoginTelaState>();
  // <Widget> Form();
  // <Widget> TextFormField();

  String? _validarEmail(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Email é obrigatório";
    }

    if (!valor.contains('@')) {
      return "Email inválido";
    }

    return null;
  }

  String? _validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Senha é obrigatória";
    }

    if (valor.length < 8) {
      return "Senha deve conter 8 caracteres";
    }

    return null;
  }

  void _enviarForm(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
        padding: EdgeInsets.only(
            top: 0.0875 * height,
            left: 0.12 * width,
            right: 0.12 * width,
            bottom: 0.14 * height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.alarm,
              size: 150,
              color: Colors.white,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: 'Usuário'),
                CaixaEntradaTexto(label: 'Endereço de e-mail'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: "Senha"),
                CaixaEntradaTexto(label: 'Senha', isPassword: true),
              ],
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: BotaoCustom(
                label: 'Entrar',
                funcionalidade: () => TelaPrincipal.navegar(context),
              ),
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: BotaoCustom(
                label: 'Cadastre-se',
                funcionalidade: () => CriarConta.navegar(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
