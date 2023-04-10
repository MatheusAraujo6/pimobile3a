import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'gerenciar.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Color cinzaCustom = const Color.fromARGB(255, 163, 163, 163);

  void navegarGerenciarAlarmes(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GerenciarAlarmes()));
  }

  void navegarTelaAnterior(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: GestureDetector(
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              navegarGerenciarAlarmes(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(
                top: 0.05 * height,
                left: 0.05 * width,
                right: 0.05 * width,
                bottom: 0.01 * height),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.person, size: 50, color: Colors.white),
                const Text(
                  'Bom dia, Fulano.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Seu próximo alarme despertará em:',
                        style: TextStyle(color: cinzaCustom, fontSize: 24),
                      ),
                      const Text(
                        '8h27m',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 96,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '06:30',
                        style: TextStyle(color: cinzaCustom, fontSize: 27),
                      ),
                      Text('Programação em Dispositivos Móveis',
                          style: TextStyle(color: cinzaCustom, fontSize: 24)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => navegarTelaAnterior(context),
                        child: Text('Calendário →',
                            style:
                                TextStyle(color: cinzaCustom, fontSize: 18))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () => navegarGerenciarAlarmes(context),
                        child: Text('↓ Gerenciar alarmes ↓',
                            style: TextStyle(color: cinzaCustom, fontSize: 18)))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
