import 'package:flutter/material.dart';
import 'card_alarme.dart';

class GerenciarAlarmes extends StatefulWidget {
  const GerenciarAlarmes({Key? key}) : super(key: key);

  @override
  State<GerenciarAlarmes> createState() => _GerenciarAlarmesState();
}

class _GerenciarAlarmesState extends State<GerenciarAlarmes> {
  void emptyMethod() {}

  void navegarTelaAnterior(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 0.01 * height, horizontal: 0.02 * width),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AlarmeCard(),
            const AlarmeCard(),
            SizedBox(
              width: 0.833 * width,
              height: 0.09 * height,
              child: ElevatedButton(
                onPressed: () => navegarTelaAnterior(context),
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blueGrey),
                child: const Text(
                  'Adicionar alarme',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
