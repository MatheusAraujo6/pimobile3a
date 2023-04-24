import 'package:flutter/material.dart';

class DiaCalendario extends StatelessWidget {
  final int dia;
  const DiaCalendario({super.key, this.dia = 0});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          border: Border.all(width: 2),
        ),
        child: Text(
          dia.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  Widget gerarMes(int diaInicial) {
    List<Widget> linhas = [];

    for (int i = diaInicial; i <= diaInicial + 35; i = i + 7) {
      List<Widget> semana = [];
      for (int j = 0; j < 7; j++) {
        semana.add(DiaCalendario(dia: i + j));
        //semana.add(const Spacer());
      }
      //semana.removeLast();
      Expanded linha = Expanded(
        child: Row(
          children: semana,
        ),
      );
      linhas.add(linha);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: linhas,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: [
            DiaCalendario(dia: index),
            DiaCalendario(dia: index + 1),
            DiaCalendario(dia: index + 2),
            DiaCalendario(dia: index + 3),
            DiaCalendario(dia: index + 4),
            DiaCalendario(dia: index + 5),
            DiaCalendario(dia: index + 6),
          ],
        );
      },
    );
    */

    /*
    List<Widget> linhas = [];

    for (int i = 0; i <= 28; i = i + 7) {
      List<Widget> semana = [];
      for (int j = 0; j < 7; j++) {
        semana.add(DiaCalendario(dia: i + j));
        semana.add(const Spacer());
      }
      semana.removeLast();
      Row linha = Row(
        children: semana,
      );
      linhas.add(linha);
    }
    */

    /*

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemBuilder: (BuildContext context, int index) {
        return gerarMes(index);
      },
    );

    */

    return gerarMes(0);
  }
}
