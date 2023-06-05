import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';
import 'package:flutter/material.dart';

class GlobalState {
  GlobalState._privateConstructor();

  static final GlobalState instance = GlobalState._privateConstructor();

  List<Alarme> alarmes = [];
}

List<AlarmeCard> gerarAlarmeCard() {
  List<AlarmeCard> cards = [];

  for (var alarme in GlobalState.instance.alarmes) {
    cards.add(AlarmeCard(alarme: alarme));
  }

  return cards;
}

void criarAlarme(BuildContext context) {
  Alarme novoAlarme = Alarme();
  GlobalState.instance.alarmes.add(novoAlarme);
  EditarAlarme.navegar(context, criar: true, alarme: novoAlarme);
}
