import 'package:alarme_pi/state/user_store.dart';
import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'criar_conta.dart';
import '../widgets/caixa_texto.dart';
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
      store.carregarAlarmes();
      TelaPrincipal.navegar(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Form(
          key: key,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 0.0875 * height,
              left: 0.12 * width,
              right: 0.12 * width,
              //bottom: 0.14 * height),
            ),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Icon(
                    Icons.alarm,
                    size: 150,
                    color: Colors.white,
                  ),
                ),
                Observer(builder: (_) {
                  if (store.erroLogin.isEmpty) {
                    return const Text("");
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Center(
                        child: Text(
                          store.erroLogin,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CaixaEntradaTexto(
                    label: 'Endereço de e-mail',
                    fieldValidator: validarEmail,
                    controller: emailController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 35),
                  child: CaixaEntradaTexto(
                    label: 'Senha',
                    isPassword: true,
                    fieldValidator: validarSenha,
                    controller: senhaController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: UnconstrainedBox(
                    child: SizedBox(
                      width: 0.36 * width,
                      height: 0.0625 * 800,
                      child: BotaoCustom(
                        label: 'Entrar',
                        funcionalidade: () => enviarForm(context),
                      ),
                    ),
                  ),
                ),
                UnconstrainedBox(
                  child: SizedBox(
                    width: 0.36 * width,
                    height: 0.0625 * 800,
                    child: BotaoCustom(
                      label: 'Cadastre-se',
                      funcionalidade: () {
                        store.erroLogin = "";
                        CriarConta.navegar(context);
                      },
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
