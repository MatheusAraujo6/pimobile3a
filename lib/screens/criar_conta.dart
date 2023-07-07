import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'package:alarme_pi/screens/login.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/botao_custom.dart';
import '../widgets/label_entrada.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:alarme_pi/state/user_store.dart';

class CriarConta extends StatefulWidget {
  const CriarConta({Key? key}) : super(key: key);

  static void navegar(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const CriarConta()),
    );
  }

  @override
  State<CriarConta> createState() => _CriarContaState();
}

class _CriarContaState extends State<CriarConta> {
  final key = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

  String? validarNome(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Nome é obrigatório";
    }

    if (valor.contains(RegExp(r'[0-9]'))) {
      return "Nome não pode conter números";
    }

    return null;
  }

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

  String? validarConfirmarSenha(String? valor) {
    if (valor == null || valor.isEmpty) {
      return "Confirmar a senha é obrigatório";
    }

    if (valor != senhaController.text) {
      return "A senha não corresponde a senha original.";
    }

    return null;
  }

  Future<void> enviarForm(BuildContext context) async {
    if (!key.currentState!.validate()) {
      return;
    }

    final response =
        await store.signUp(emailController.text, senhaController.text);

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
      appBar: AppBar(
        title: const Text("Criar conta"),
        leading: IconButton(
          onPressed: () => LoginTela.navegar(context),
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: Form(
        key: key,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Observer(builder: (_) {
                  return Text(
                    store.erroSignUp,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LabelEntrada(label: "Nome"),
                  CaixaEntradaTexto(
                    label: "Nome",
                    fieldValidator: validarNome,
                    controller: nomeController,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LabelEntrada(label: "Endereço de e-mail"),
                  CaixaEntradaTexto(
                    label: "Endereço de e-mail",
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
                    label: "Senha",
                    fieldValidator: validarSenha,
                    controller: senhaController,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //LabelEntrada(label: "Confirmar senha"),
                  CaixaEntradaTexto(
                    label: "Confirmar senha",
                    fieldValidator: validarConfirmarSenha,
                    controller: confirmarSenhaController,
                  ),
                ],
              ),
              SizedBox(
                width: 0.36 * width,
                height: 0.0625 * height,
                child: BotaoCustom(
                  label: "Confirmar",
                  funcionalidade: () => enviarForm(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
