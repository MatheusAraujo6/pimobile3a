import 'package:alarme_pi/state/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';
import 'package:alarme_pi/screens/login.dart';

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final _service = FirebaseService();

  @observable
  String email = "";

  @observable
  String erroLogin = "";

  @observable
  String erroSignUp = "";

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

  @action
  Future<bool> login(String email, String senha) async {
    try {
      await _service.login(email, senha);
      this.email = email;
      erroLogin = "";
      return true;
    } catch (e) {
      erroLogin = e.toString();
      this.email = "";
      return false;
    }
  }

  @action
  Future<bool> signUp(String email, String senha) async {
    try {
      await _service.signUp(email, senha);
      this.email = email;
      erroSignUp = "";
      return true;
    } catch (e) {
      erroSignUp = e.toString();
      this.email = "";
      return false;
    }
  }

  @action
  void logout(BuildContext context) {
    () async {
      await _service.logout();
    };
    email = "";
    erroLogin = "";
    erroSignUp = "";
  }
}

UserStore store = UserStore(); // Instância única
