import 'package:flutter/material.dart';
import 'gerenciar_lista.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({Key? key}) : super(key: key);

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  void emptyMethod() {}

  TextField caixaEntradaTexto(String label, bool isPassword) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade600)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey.shade600)),
      style: const TextStyle(color: Colors.white),
    );
  }

  ElevatedButton botaoLogin(String label, void Function() funcionalidade) {
    return ElevatedButton(
        onPressed: () => funcionalidade(),
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(), backgroundColor: Colors.blueGrey),
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ));
  }

  void navegarTelaPrincipal(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const TelaPrincipal()),
    );
  }

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
            bottom: 0.1675 * height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.alarm,
              size: 150,
              color: Colors.white,
            ),
            caixaEntradaTexto('Usuário', false),
            caixaEntradaTexto('Senha', true),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: botaoLogin('Entrar', () => navegarTelaPrincipal(context)),
            ),
            SizedBox(
              width: 0.36 * width,
              height: 0.0625 * height,
              child: botaoLogin('Criar conta', emptyMethod),
            ),
          ],
        ),
      ),
    );
  }
}
