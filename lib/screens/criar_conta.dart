import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'package:alarme_pi/screens/login.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/botao_custom.dart';
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
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: const Text("Criar conta"),
          leading: IconButton(
            onPressed: () {
              store.erroSignUp = "";
              LoginTela.navegar(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.blueGrey.shade800,
        ),
        body: Form(
          key: key,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Observer(builder: (_) {
                  if (store.erroSignUp.isEmpty) {
                    return const Text("");
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Center(
                      child: Text(
                        store.erroSignUp,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CaixaEntradaTexto(
                    label: "Endereço de e-mail",
                    fieldValidator: validarEmail,
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CaixaEntradaTexto(
                    isPassword: true,
                    label: "Senha",
                    fieldValidator: validarSenha,
                    controller: senhaController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: CaixaEntradaTexto(
                    isPassword: true,
                    label: "Confirmar senha",
                    fieldValidator: validarConfirmarSenha,
                    controller: confirmarSenhaController,
                  ),
                ),
                UnconstrainedBox(
                  child: SizedBox(
                    width: 0.36 * width,
                    height: 0.0625 * 800,
                    child: BotaoCustom(
                      label: "Confirmar",
                      funcionalidade: () => enviarForm(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
