import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'alarme.g.dart';

enum DiaSemana {
  domingo,
  segunda,
  terca,
  quarta,
  quinta,
  sexta,
  sabado,
}

enum Intervalo {
  nenhum,
  um,
  dois,
  tres,
  quatro,
  cinco,
  seis,
  sete,
}

enum Soneca {
  desativada,
  umMinuto,
  tresMinutos,
  cincoMinutos,
  dezMinutos,
}

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
  @observable
  bool ativado = true;

  @observable
  String nome = "Nome do alarme";

  @observable
  TimeOfDay hora = const TimeOfDay(hour: 6, minute: 30);

  // Cor é permanente, não observável.
  final Color cor = Color(Random().nextInt(0xFFFFFFFF) | 0xFF000000);

  @observable
  ObservableList<bool> diasSemana = ObservableList();

  @observable
  Intervalo diasRepeticao = Intervalo.nenhum;

  @observable
  Soneca soneca = Soneca.desativada;

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
  void alterarNome(String novoNome) {
    nome = novoNome;
  }

  @action
  void alterarHora(TimeOfDay novaHora) {
    hora = novaHora;
  }

  @action
  void alterarDia(int indice) {
    diasSemana[indice] = !diasSemana[indice];
  }

  @action
  void alterarRepeticao(Intervalo novoIntervalo) {
    diasRepeticao = novoIntervalo;
  }

  @action
  void alterarSoneca(Soneca novaSoneca) {
    soneca = novaSoneca;
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

  static const List<String> intervalos = [
    "Nenhum",
    "Dias alternados",
    "A cada 2 dias",
    "A cada 3 dias",
    "A cada 4 dias",
    "A cada 5 dias",
    "A cada 6 dias",
    "A cada 7 dias"
  ];

  @action
  String intervaloString({Intervalo? intervalo}) {
    if (intervalo != null) {
      return intervalos[intervalo.index];
    }

    return intervalos[diasRepeticao.index];
  }
}
