import 'package:flutter/material.dart';

class DiaCalendario extends StatelessWidget {
  final String dia;
  final bool modoCompacto;
  const DiaCalendario({super.key, this.dia = "", this.modoCompacto = false});

  Widget textoDia() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dia,
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
    Color corDia = Colors.white;

    //if ((dia % 7) == 0) {
    //  corDia = Colors.redAccent;
    //}

    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          border: Border.all(),
        ),
        child: Text(
          dia,
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

    //if ((offset % 7) == 0) {
    //  linhas.add(linhaAlarme(Colors.orange));
    //  linhas.add(linhaAlarme(Colors.greenAccent));
    //}

    //if ((offset2 % 7) == 0) {
    //  linhas.add(linhaAlarme(Colors.greenAccent));
    //}

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

class Calendario extends StatefulWidget {
  final bool compacto;
  const Calendario({super.key, this.compacto = false});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  //final bool compacto;
  final DateTime dataHoje = DateTime.now();
  DateTime data = DateTime.now();

  //Calendario({super.key, this.compacto = false});

  Widget gerarMes(DateTime hoje, bool compacto) {
    List<int> dias = diasMes(hoje);
    List<Widget> linhas = [];
    //linhas.add(Expanded(child: cabecalho()));

    for (int i = 0; i <= 35; i = i + 7) {
      List<Widget> semana = [];
      for (int j = 0; j < 7; j++) {
        semana.add(DiaCalendario(
          dia: dias[i + j].toString(),
          modoCompacto: compacto,
        ));
      }
      Widget linha = Expanded(child: Row(children: semana));
      linhas.add(linha);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: linhas,
    );
  }

  bool isLeapYear(int year) {
    if ((year % 4) == 0) {
      if ((year % 100) == 0) {
        if ((year % 400) == 0) {
          return true;
        }
        return false;
      }
      return true;
    }
    return false;
  }

  int primeiroDia(DateTime hoje) {
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

  List<int> diasMes(DateTime hoje) {
    const Set<int> mesTrintaDias = {4, 6, 9, 11};
    List<int> diasMes = [];
    late int diaFinal;

    // Adicionar dias do mês
    if (hoje.month == 2) {
      diaFinal = isLeapYear(hoje.year) ? 29 : 28;
    } else {
      diaFinal = mesTrintaDias.contains(hoje.month) ? 30 : 31;
    }

    for (int i = 1; i <= diaFinal; i++) {
      diasMes.add(i);
    }

    int primeiroDiaSemana = primeiroDia(hoje);

    // Adicionar dias antes para preencher calendário
    if (primeiroDiaSemana != 0) {
      int mesAnterior = hoje.month - 1; // Mês 0 volta para o ano anterior
      late int diaFinal;

      if (mesAnterior == 2) {
        diaFinal = isLeapYear(hoje.year) ? 29 : 28;
      } else {
        diaFinal = mesTrintaDias.contains(mesAnterior) ? 30 : 31;
      }

      for (int i = 0; i < primeiroDiaSemana; i++) {
        diasMes.insert(0, diaFinal - i);
      }
    }

    // Adicionar dias após para preencher calendário
    for (int i = 1; diasMes.length < 42; i++) {
      diasMes.add(i);
    }

    return diasMes;
  }

  String mesPorExtenso(int mes) {
    const List<String> meses = [
      "Inválido",
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro"
    ];

    return meses[mes];
  }

  void alterarMes(int delta) {
    setState(() {
      data = DateTime(data.year, data.month + delta, 28);
    });
  }

  Widget diaCabecalho(String dia) {
    return Expanded(
      child: Container(
        //height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          border: Border.all(width: 1),
        ),
        child: Text(
          dia,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget cabecalho() {
    return Row(
      children: [
        diaCabecalho("D"),
        diaCabecalho("S"),
        diaCabecalho("T"),
        diaCabecalho("Q"),
        diaCabecalho("Q"),
        diaCabecalho("S"),
        diaCabecalho("S"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //return Flexible(child: gerarMes(26));
    return Column(
      children: [
        Row(
          children: [
            Text(
              "${mesPorExtenso(data.month)} ${data.year}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => alterarMes(-1),
              color: Colors.white,
              icon: const Icon(Icons.arrow_upward),
            ),
            IconButton(
              onPressed: () => alterarMes(1),
              color: Colors.white,
              icon: const Icon(Icons.arrow_downward),
            ),
          ],
        ),
        //Row(
        //  children: [
        //    Flexible(child: DiaCalendario(dia: "D")),
        //  ],
        //),
        cabecalho(),
        Flexible(child: gerarMes(data, widget.compacto)),
      ],
    );
  }
}
