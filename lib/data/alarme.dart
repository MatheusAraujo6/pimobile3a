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

class Alarme {
  bool ativado = true;
  String nome = "Nome do alarme";
  TimeOfDay hora = const TimeOfDay(hour: 6, minute: 30);
  final Color cor = Color(Random().nextInt(0xFFFFFFFF) | 0xFF000000);
  final Set<DiaSemana> diasSemana = {};
  int intervaloDiasRepeticao = 0;
  int intervaloMinSoneca = 0;
  String toqueMusical = "Padrão do sistema";
  bool toqueAtivado = true;
  bool vibracaoAtivada = true;
}
