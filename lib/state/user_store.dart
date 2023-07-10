import 'dart:async';
import 'dart:io';

import 'package:alarme_pi/state/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:alarme_pi/data/alarme.dart';
import 'package:alarme_pi/widgets/card_alarme.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'user_store.g.dart';

class UserStore = UserStoreBase with _$UserStore;

abstract class UserStoreBase with Store {
  final _service = FirebaseService();

  @observable
  String display = "";

  @observable
  int dummy = 0;

  @observable
  bool loading = false;

  @observable
  bool modoDeletar = false;

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
  void alterarDummy() {
    dummy += 1;
  }

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
    //email = "";
    //erroLogin = "";
    //erroSignUp = "";
  }

  void carregarAlarmes() async {
    loading = true;
    final url = Uri.https("backend-alarme-default-rtdb.firebaseio.com",
        "${store.email.replaceAll(".", "")}.json");
    final response = await http.get(url);
    final data = json.decode(response.body) as Map<String, dynamic>;
    data.forEach((key, value) {
      final novoAlarme = Alarme();
      final novoCardAlarme = AlarmeCard(alarme: novoAlarme);

      novoAlarme.nome = value["nome"];
      novoAlarme.cor = Color(int.parse(value["cor"]));
      novoAlarme.hora = TimeOfDay(
        hour: int.parse(value["hora"]),
        minute: int.parse(value["minuto"]),
      );
      novoAlarme.diasSemana[0] = value["dom"] == "true" ? true : false;
      novoAlarme.diasSemana[1] = value["seg"] == "true" ? true : false;
      novoAlarme.diasSemana[2] = value["ter"] == "true" ? true : false;
      novoAlarme.diasSemana[3] = value["qua"] == "true" ? true : false;
      novoAlarme.diasSemana[4] = value["qui"] == "true" ? true : false;
      novoAlarme.diasSemana[5] = value["sex"] == "true" ? true : false;
      novoAlarme.diasSemana[6] = value["sab"] == "true" ? true : false;
      novoAlarme.soneca = int.parse(value["soneca"]);
      novoAlarme.sonecaStr = AlarmeBase.sonecas[novoAlarme.soneca];
      novoAlarme.toqueMusical = value["toqueMusical"];
      novoAlarme.toqueAtivado = value["toqueAtivado"] == "true" ? true : false;
      novoAlarme.vibracaoAtivada =
          value["vibracaoAtivada"] == "true" ? true : false;
      novoAlarme.key = key;

      alarmes.add(novoAlarme);
      cards.add(novoCardAlarme);
    });
    loading = false;
    //unawaited(escanearAlarmes());
  }

  Future<void> salvarAlarme(Alarme alarme) async {
    final url = Uri.https("backend-alarme-default-rtdb.firebaseio.com",
        "${store.email.replaceAll(".", "")}.json");
    final response = await http.post(url,
        body: json.encode(
          {
            'nome': alarme.nome,
            'cor': alarme.cor.value.toString(),
            'hora': alarme.hora.hour.toString(),
            'minuto': alarme.hora.minute.toString(),
            'dom': alarme.diasSemana[0] ? 'true' : 'false',
            'seg': alarme.diasSemana[1] ? 'true' : 'false',
            'ter': alarme.diasSemana[2] ? 'true' : 'false',
            'qua': alarme.diasSemana[3] ? 'true' : 'false',
            'qui': alarme.diasSemana[4] ? 'true' : 'false',
            'sex': alarme.diasSemana[5] ? 'true' : 'false',
            'sab': alarme.diasSemana[6] ? 'true' : 'false',
            'soneca': alarme.soneca.toString(),
            'toqueMusical': alarme.toqueMusical,
            'toqueAtivado': alarme.toqueAtivado ? 'true' : 'false',
            'vibracaoAtivada': alarme.vibracaoAtivada ? 'true' : 'false',
          },
        ),
        headers: {'Content-type': 'application/json'});
    final data = json.decode(response.body) as Map<String, dynamic>;
    alarme.key = data['name'];
    //print(store.email);
    //print(data.toString());
  }

  Future<void> removerAlarmeFirestore(Alarme alarme) async {
    final url = Uri.parse(
        'https://backend-alarme-default-rtdb.firebaseio.com/${store.email.replaceAll(".", "")}/${alarme.key}.json');
    await http.delete(url);
  }

  Future<void> escanearAlarmes() async {
    bool nenhumAlarme = true;
    for (var alarme in store.alarmes) {
      if (alarme.ativado) {
        nenhumAlarme = false;
        break;
      }
    }

    if (nenhumAlarme) {
      display = "Nenhum alarme foi ativado.";
      return;
    }

    var agora = DateTime.now();
    int? menorTempo;
    Alarme? menorAlarme;

    for (var alarme in store.alarmes) {
      if (!alarme.ativado) {
        continue;
      }

      for (int i = 0; i < 7; i++) {
        if (!alarme.diasSemana[i]) {
          continue;
        }

        var diaAlarme = DateTime(
          agora.year,
          agora.month,
          agora.day + ((i != 0) ? (i - agora.weekday) : (7 - agora.weekday)),
          alarme.hora.hour,
          alarme.hora.minute,
        );

        var diferenca = agora.difference(diaAlarme).inMinutes;
        if (menorTempo == null) {
          menorTempo = diferenca;
          menorAlarme = alarme;
        } else if ((diferenca < menorTempo) && (diferenca > 0)) {
          menorTempo = diferenca;
          menorAlarme = alarme;
        }
      }
    }

    if (menorTempo != null) {
      int horas = (menorTempo / 24) as int;
      int minutos = menorTempo - (horas * 60);
      display = "Próximo alarme em: ${horas}h${minutos}m.";
      sleep(const Duration(minutes: 1));
      escanearAlarmes();
    }

    display = "Erro ao calcular próximo alarme.";
  }

  Future<void> dispararAlarme(
    BuildContext context,
    int minutosDisparo,
    Alarme alarme,
  ) async {
    const List<int> sonecas = [1, 3, 5, 10];

    sleep(Duration(minutes: minutosDisparo));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(alarme.nome!),
        actions: [
          (alarme.soneca != 0)
              ? TextButton(
                  onPressed: () {
                    alarme.hora = TimeOfDay(
                        hour: alarme.hora.hour,
                        minute: alarme.hora.minute + sonecas[alarme.soneca]);
                    escanearAlarmes();
                    Navigator.pop(context);
                  },
                  child: const Text("Soneca"),
                )
              : const Text(""),
          TextButton(
            onPressed: () {
              alarme.ativado = false;
              Navigator.pop(context);
            },
            child: const Text("Desligar"),
          )
        ],
      ),
    );
  }
}

UserStore store = UserStore(); // Instância única
