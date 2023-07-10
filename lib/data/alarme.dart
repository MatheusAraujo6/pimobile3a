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
    ancora = DateTime.now();
  }
}

abstract class AlarmeBase with Store {
  String? key; // Usado para salvar a chave do Firebase

  // Usado apenas para regenerar o Calendário compacto
  @observable
  int dummy = 0;

  @observable
  bool ativado = true;

  @observable
  String? nome;

  @observable
  TimeOfDay hora = const TimeOfDay(hour: 6, minute: 30);

  // Cor não é observável.
  Color cor = Color(Random().nextInt(0xFFFFFFFF) | 0xFF000000);

  @observable
  ObservableList<bool> diasSemana = ObservableList();

  // Âncora para definir onde começa o intervalo
  DateTime ancora = DateTime(2023);

  // Começo do intervalo
  int comecoIntervalo = 0;

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
  void incrementarIntervalo() {
    comecoIntervalo += 1;
    comecoIntervalo %= diasRepeticao;
  }

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

    configurarAncora();
  }

  @action
  void alterarDia(int indice) {
    diasSemana[indice] = !diasSemana[indice];
    dummy += 1;

    configurarAncora();
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

  int primeiroDia(DateTime hoje) {
    // --- Cópia do método no calendário ---
    // Baseado na Doomsday rule
    final DateTime primeiro = DateTime(hoje.year, hoje.month, 1);
    final DateTime doomsday = DateTime(hoje.year, 4, 4);
    final int ano = hoje.year;
    final int ancora =
        2 + ano + (ano / 4).floor() - (ano / 100).floor() + (ano / 400).floor();

    final int dif = primeiro.difference(doomsday).inDays;
    //return (((dif % ancora + ancora) % ancora) % 7 + (ancora % 7)) % 7;
    return (dif % 7 + (ancora % 7)) % 7;
  }

  void configurarAncora() {
    bool nenhumDia = !diasSemana.contains(true);
    DateTime hoje = DateTime.now();

    if (nenhumDia) {
      int tempoAlarme = (hora.hour * 60) + hora.minute;
      TimeOfDay temp = TimeOfDay.now();
      int tempoAgora = (temp.hour * 60) + temp.minute;

      if (tempoAlarme > tempoAgora) {
        ancora = hoje;
      } else {
        ancora = DateTime(hoje.year, hoje.month, hoje.day + 1);
      }
      return;
    }

    int primeiroDiaAlarme = -1;
    for (int i = 0; i < diasSemana.length; i++) {
      if (diasSemana[i]) {
        primeiroDiaAlarme = i;
        break;
      }
    }

    assert(primeiroDiaAlarme >= 0);

    int primeiroDiaJaneiro = primeiroDia(DateTime(hoje.year, 1, 1));
    int copiaIntervalo = comecoIntervalo + 1;
    int incremento = 0;
    while (copiaIntervalo > 0) {
      if (((primeiroDiaJaneiro + incremento) % 7) == primeiroDiaAlarme) {
        copiaIntervalo -= 1;
      }
      incremento += 1;
    }

    incremento += 1; // Primeiro dia no ano em que o dia da semana ocorre
    ancora = DateTime(hoje.year, 1, incremento);
  }
}
