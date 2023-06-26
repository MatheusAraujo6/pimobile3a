import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  @observable
  ObservableList<Alarme> alarmes = ObservableList();

  @observable
  ObservableList<AlarmeCard> cards = ObservableList();

  @action
  void criarAlarme(BuildContext context) {
    Alarme novoAlarme = Alarme();
    alarmes.add(novoAlarme);
    cards.add(AlarmeCard(alarme: novoAlarme));
    EditarAlarme.navegar(context, alarme: novoAlarme, criar: true);
  }
}

UserStore store = UserStore(); // Instância única
