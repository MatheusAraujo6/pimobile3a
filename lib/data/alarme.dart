import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'alarme.g.dart';

//class Alarme = AlarmeBase with _$Alarme;
class Alarme extends AlarmeBase with _$Alarme {
  Alarme() {
    diasSemana.add(false);
    diasSemana.add(false);
    diasSemana.add(false);
    diasSemana.add(false);
    diasSemana.add(false);
    diasSemana.add(false);
    diasSemana.add(false);
  }
}

abstract class AlarmeBase with Store {
  // Usado apenas para regenerar o Calendário compacto
  @observable
  int dummy = 0;

  @observable
  bool ativado = true;

  @observable
  String? nome;

  @observable
  TimeOfDay hora = const TimeOfDay(hour: 6, minute: 30);

  // Cor é permanente, não observável.
  final Color cor = Color(Random().nextInt(0xFFFFFFFF) | 0xFF000000);

  @observable
  ObservableList<bool> diasSemana = ObservableList();

  @observable
  int diasRepeticao = 0;

  @observable
  String diasRepeticaoStr = intervalos[0];

  @observable
  int soneca = 3;

  @observable
  String sonecaStr = sonecas[3];

  @observable
  String toqueMusical = "Padrão do sistema";

  @observable
  bool toqueAtivado = true;

  @observable
  bool vibracaoAtivada = true;

  @action
  void switchAtivado() {
    ativado = !ativado;
  }

  @action
  void alterarNome(String? novoNome) {
    if ((novoNome == null) || novoNome.isEmpty || novoNome == "") {
      nome = null;
    }

    nome = novoNome;
  }

  @action
  void alterarHora(TimeOfDay novaHora) {
    hora = novaHora;
    dummy += 1;
  }

  @action
  void alterarDia(int indice) {
    diasSemana[indice] = !diasSemana[indice];
    dummy += 1;
  }

  @action
  void alterarRepeticao(int novoIntervalo) {
    diasRepeticao = novoIntervalo;
    diasRepeticaoStr = intervalos[novoIntervalo];
    dummy += 1;
  }

  @action
  void alterarSoneca(int novaSoneca) {
    soneca = novaSoneca;
    sonecaStr = sonecas[novaSoneca];
  }

  @action
  void alterarToque(String novoToque) {
    toqueMusical = novoToque;
  }

  @action
  void switchToque() {
    toqueAtivado = !toqueAtivado;
  }

  @action
  void switchVibracao() {
    vibracaoAtivada = !vibracaoAtivada;
  }

  static const List<String> diasStr = [
    "Dom",
    "Seg",
    "Ter",
    "Qua",
    "Qui",
    "Sex",
    "Sab"
  ];

  @action
  String diasSemanaString() {
    int ativados = 0;
    for (var item in diasSemana) {
      if (item) {
        ativados += 1;
      }
    }

    if (ativados == 0) {
      return "Nenhum dia escolhido para repetição";
    }

    if (ativados == 7) {
      return "Todos os dias da semana";
    }

    bool primeiro = true;
    String dias = "";
    for (int i = 0; i < diasSemana.length; i++) {
      if (diasSemana[i]) {
        if (primeiro) {
          dias = "A cada ${diasStr[i]}";
          primeiro = false;
        } else {
          dias = "$dias, ${diasStr[i]}";
        }
      }
    }

    return dias;
  }

  @action
  String invervalosString() {
    if (diasRepeticao == 0) {
      return "Nenhum intervalo de reptição selecionado";
    }

    if (diasRepeticao == 1) {
      return "Repetir em dias alternados";
    }

    return "Repetir ${diasRepeticaoStr.replaceFirst(RegExp("A"), "a")}";
  }

  static const List<String> intervalos = [
    "Nenhum",
    "Dias alternados",
    "A cada 2 dias",
    "A cada 3 dias",
  ];

  static const List<String> sonecas = [
    "Desativada",
    "A cada minuto",
    "A cada 3 minutos",
    "A cada 5 minutos",
    "A cada 10 minutos"
  ];
}
