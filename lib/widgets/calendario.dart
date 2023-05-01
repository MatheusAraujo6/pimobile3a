import 'package:flutter/material.dart';

class DiaCalendario extends StatelessWidget {
  final int dia;
  final bool modoCompacto;
  const DiaCalendario({super.key, this.dia = 0, this.modoCompacto = false});

  Widget textoDia() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (dia % 32).toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget linhaAlarme(Color cor) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: Container(
        height: 1,
        color: cor,
      ),
    );
  }

  Widget diaCompacto() {
    int diaCorrigido = dia % 32;
    Color corDia = Colors.white;

    if ((dia % 7) == 0) {
      corDia = Colors.redAccent;
    }

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          border: Border.all(),
        ),
        child: Text(
          diaCorrigido.toString(),
          style: TextStyle(color: corDia),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (modoCompacto) {
      return diaCompacto();
    }

    List<Widget> meuContainer = [];
    List<Widget> linhas = [];
    meuContainer.add(textoDia());

    int offset = dia + 1;
    int offset2 = dia + 0;

    if ((offset % 7) == 0) {
      linhas.add(linhaAlarme(Colors.orange));
      linhas.add(linhaAlarme(Colors.greenAccent));
    }

    if ((offset2 % 7) == 0) {
      linhas.add(linhaAlarme(Colors.greenAccent));
    }

    Widget colunaLinhas = Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: linhas,
      ),
    );

    meuContainer.add(colunaLinhas);

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          border: Border.all(width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: meuContainer,
        ),
      ),
    );
  }
}

class Calendario extends StatelessWidget {
  final bool compacto;

  const Calendario({super.key, this.compacto = false});

  Widget gerarMes(int diaInicial) {
    List<Widget> linhas = [];

    for (int i = diaInicial; i <= diaInicial + 35; i = i + 7) {
      List<Widget> semana = [];
      for (int j = 0; j < 7; j++) {
        semana.add(DiaCalendario(
          dia: i + j,
          modoCompacto: compacto,
        ));
      }
      Expanded linha = Expanded(child: Row(children: semana));
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
    return Flexible(child: gerarMes(26));
  }
}
