import 'package:alarme_pi/state/user_store.dart';
import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'criar_conta.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/label_entrada.dart';
import '../widgets/botao_custom.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  // <Widget> Form();
  // <Widget> TextFormField();

  String? validarEmail(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Email é obrigatório";
    }

    if (!valor.contains('@')) {
      return "Email inválido";
    }

    return null;
  }

  String? validarSenha(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Senha é obrigatória";
    }

    if (valor.length < 6) {
      return "Senha deve conter 6 caracteres";
    }

    return null;
  }

  Future<void> enviarForm(BuildContext context) async {
    if (!key.currentState!.validate()) {
      return;
    }

    final response =
        await store.login(emailController.text, senhaController.text);

    if (!response) {
      return;
    }

    if (context.mounted) {
      TelaPrincipal.navegar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Form(
        key: key,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
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
              Observer(builder: (_) {
                return Text(
                  store.erroLogin,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                );
              }),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LabelEntrada(label: 'Usuário'),
                  CaixaEntradaTexto(
                    label: 'Endereço de e-mail',
                    fieldValidator: validarEmail,
                    controller: emailController,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LabelEntrada(label: "Senha"),
                  CaixaEntradaTexto(
                    label: 'Senha',
                    isPassword: true,
                    fieldValidator: validarSenha,
                    controller: senhaController,
                  ),
                ],
              ),
              SizedBox(
                width: 0.36 * width,
                height: 0.0625 * height,
                child: BotaoCustom(
                  label: 'Entrar',
                  funcionalidade: () => enviarForm(context),
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
      ),
    );
  }
}
