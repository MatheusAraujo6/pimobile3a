import 'package:flutter/material.dart';

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
        body: GestureDetector(
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! < 0) {
                Navigator.of(context).pop();
              }
            },
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 0.01 * height, horizontal: 0.01 * width),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.list,
                      size: 35,
                    ),
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
                          )),
                    ),
                  ],
                ))));
  }
}
