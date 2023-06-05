import 'dart:math';
import 'package:flutter/material.dart';

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

class Alarme {
  bool ativado = true;
  String nome = "Nome do alarme";
  TimeOfDay hora = const TimeOfDay(hour: 6, minute: 30);
  final Color cor = Color(Random().nextInt(0xFFFFFFFF) | 0xFF000000);
  final Set<DiaSemana> diasSemana = {};
  Intervalo diasRepeticao = Intervalo.nenhum;
  Soneca soneca = Soneca.desativada;
  String toqueMusical = "Padrão do sistema";
  bool toqueAtivado = true;
  bool vibracaoAtivada = true;
}
