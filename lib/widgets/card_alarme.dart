import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';
import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/state/user_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AlarmeCard extends StatelessWidget {
  final Alarme alarme;
  final bool modoExcluir;

  const AlarmeCard({super.key, required this.alarme, this.modoExcluir = false});

  Text textoCard(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () {
          if (!store.modoDeletar) {
            EditarAlarme.navegar(context, alarme: alarme);
          }
        },
        onLongPress: () {
          store.modoDeletar = true;
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textoCard(alarme.nome ?? "Sem nome"),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1,
                      color: alarme.cor,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${alarme.hora.hour.toString().padLeft(2, "0")}:${alarme.hora.minute.toString().padLeft(2, "0")}",
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  (modoExcluir)
                      ? const Text("") // Widget nulo
                      : Observer(
                          builder: (_) {
                            return Switch(
                              value: alarme.ativado,
                              thumbColor: const MaterialStatePropertyAll<Color>(
                                  Colors.white),
                              activeColor: Colors.blueGrey.shade50,
                              onChanged: (_) {
                                alarme.switchAtivado();
                                //unawaited(store.escanearAlarmes());
                              },
                            );
                          },
                        )
                ],
              ),
              textoCard(alarme.diasSemanaString()),
              //textoCard(alarme.invervalosString()),
            ],
          ),
        ),
      ),
    );
  }
}
