import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';
import 'package:alarme_pi/screens/login.dart';
import '../widgets/caixa_texto.dart';
import '../widgets/botao_custom.dart';
import '../widgets/label_entrada.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: "Nome"),
                CaixaEntradaTexto(label: "Nome"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: "Endereço de e-mail"),
                CaixaEntradaTexto(label: "Endereço de e-mail"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: "Senha"),
                CaixaEntradaTexto(label: "Senha"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //LabelEntrada(label: "Confirmar senha"),
                CaixaEntradaTexto(label: "Confirmar senha"),
              ],
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: BotaoCustom(
                label: "Confirmar",
                funcionalidade: () => TelaPrincipal.navegar(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
