import 'package:alarme_pi/screens/gerenciar_lista.dart';
import 'package:flutter/material.dart';
import 'package:alarme_pi/widgets/calendario.dart';
import 'package:alarme_pi/widgets/custom_radio.dart';
import 'package:alarme_pi/widgets/card_editar_alarme.dart';
import 'package:alarme_pi/data/alarme.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/*
class EditarAlarme extends StatefulWidget {
  final bool modoCriar;
  final Alarme alarme;

  const EditarAlarme({Key? key, this.modoCriar = false, required this.alarme})
      : super(key: key);

  static void navegar(BuildContext context,
      {bool criar = false, required Alarme alarme}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => EditarAlarme(
              modoCriar: criar,
              alarme: alarme,
            )),
      ),
    );
  }

  @override
  State<EditarAlarme> createState() => _EditarAlarmeState();
}
*/

class EditarAlarme extends StatelessWidget {
  final Alarme alarme;
  final bool modoCriar;

  final List<Intervalo> intervalosEnum = [
    Intervalo.nenhum,
    Intervalo.um,
    Intervalo.dois,
    Intervalo.tres,
    Intervalo.quatro,
    Intervalo.cinco,
    Intervalo.seis,
    Intervalo.sete,
  ];

  EditarAlarme({super.key, required this.alarme, this.modoCriar = false}) {
    for (int i = 0; i < 8; i++) {
      PopupMenuItem<Intervalo> novo = PopupMenuItem(
        value: intervalosEnum[i],
        child: Text(alarme.intervaloString(intervalo: intervalosEnum[i])),
      );
      itensMenuIntervalo.add(novo);
    }

    for (int i = 0; i < 5; i++) {
      PopupMenuItem<Soneca> novo =
          PopupMenuItem(value: Soneca.desativada, child: Text(opcoesSoneca[i]));
      itensMenuSoneca.add(novo);
    }

    PopupMenuItem<String> padrao = const PopupMenuItem(
      value: "Padrão do sistema",
      child: Text("Padrão do sistema"),
    );
    PopupMenuItem<String> outros = const PopupMenuItem(
      value: "Outro",
      child: Text("Outro"),
    );
    itensMenuRingtones.add(padrao);
    itensMenuRingtones.add(outros);
  }

  static void navegar(BuildContext context,
      {bool criar = false, required Alarme alarme}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: ((context) => EditarAlarme(
              modoCriar: criar,
              alarme: alarme,
            )),
      ),
    );
  }

  //List<bool> diasSemana = [false, false, false, false, false, false, false];

  final List<String> opcoesSoneca = [
    "Desativada",
    "a cada minuto",
    "a cada 3 minutos",
    "a cada 5 minutos",
    "a cada 10 minutos",
  ];

  final List<PopupMenuEntry<Intervalo>> itensMenuIntervalo = [];
  final List<PopupMenuEntry<String>> itensMenuRingtones = [];
  final List<PopupMenuEntry<Soneca>> itensMenuSoneca = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade800,
        title: Text(
          modoCriar ? "Adicionar alarme" : "Editar Alarme",
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => TelaPrincipal.navegar(context),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(height: 5),
          Flexible(child: Calendario(compacto: true)),
          cardEditar(
            // Borda antiga
            filho: Row(
              children: [
                const Icon(Icons.alarm, color: Colors.white),
                Container(width: 5),
                const Text(
                  "Horário",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Spacer(),
                Observer(builder: (_) {
                  return TextButton(
                    onPressed: () async {
                      Future<TimeOfDay?> novaHora = showDialog<TimeOfDay?>(
                        context: context,
                        builder: (BuildContext context) {
                          return TimePickerDialog(initialTime: alarme.hora);
                        },
                      );

                      alarme.alterarHora((await novaHora)!);
                    },
                    child: Text(
                      "${alarme.hora.hour.toString().padLeft(2, "0")}:${alarme.hora.minute}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          cardEditar(
            // Borda antinga
            filho: Row(
              children: [
                const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                Container(width: 5),
                Flexible(
                  child: TextField(
                    controller: TextEditingController(text: alarme.nome),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (String novoNome) async {
                      alarme.nome = novoNome;
                    },
                  ),
                ),
              ],
            ),
          ),
          cardEditar(
            filho: Observer(
              builder: (_) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.date_range, color: Colors.white),
                        Container(width: 5),
                        Text(
                          alarme.diasSemanaString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                    Container(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RadioCustom(
                          dia: 0,
                          valor: alarme.diasSemana[0],
                          radioCallback: () => alarme.alterarDia(0),
                        ),
                        RadioCustom(
                          dia: 1,
                          valor: alarme.diasSemana[1],
                          radioCallback: () => alarme.alterarDia(1),
                        ),
                        RadioCustom(
                          dia: 2,
                          valor: alarme.diasSemana[2],
                          radioCallback: () => alarme.alterarDia(2),
                        ),
                        RadioCustom(
                          dia: 3,
                          valor: alarme.diasSemana[3],
                          radioCallback: () => alarme.alterarDia(3),
                        ),
                        RadioCustom(
                          dia: 4,
                          valor: alarme.diasSemana[4],
                          radioCallback: () => alarme.alterarDia(4),
                        ),
                        RadioCustom(
                          dia: 5,
                          valor: alarme.diasSemana[5],
                          radioCallback: () => alarme.alterarDia(5),
                        ),
                        RadioCustom(
                          dia: 6,
                          valor: alarme.diasSemana[6],
                          radioCallback: () => alarme.alterarDia(6),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          cardEditar(
            filho: Row(
              children: [
                const Icon(Icons.replay, color: Colors.white),
                Container(width: 5),
                const Text(
                  "Intervalo de repetição",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Spacer(),
                Observer(
                  builder: (_) {
                    return PopupMenuButton<Intervalo>(
                      itemBuilder: (BuildContext context) => itensMenuIntervalo,
                      child: Text(
                        alarme.intervaloString(),
                        style: TextStyle(color: Colors.blueGrey.shade50),
                      ),
                      onSelected: (Intervalo novoIntervalo) =>
                          alarme.alterarRepeticao(novoIntervalo),
                    );
                  },
                ),
              ],
            ),
          ),
          cardEditar(
            filho: Row(
              children: [
                const Icon(Icons.bedtime_outlined, color: Colors.white),
                Container(width: 5),
                const Text(
                  "Função soneca",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Spacer(),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) => itensMenuSoneca,
                  child: Text(
                    "a cada 5 minutos",
                    style: TextStyle(color: Colors.blueGrey.shade50),
                  ),
                ),
              ],
            ),
          ),
          cardEditar(
            filho: Row(
              children: [
                Observer(
                  builder: (_) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.music_note, color: Colors.white),
                            Container(width: 5),
                            const Text(
                              "Toque musical",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Container(height: 10),
                        PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) =>
                              itensMenuRingtones,
                          child: Text(
                            alarme.toqueMusical,
                            style: TextStyle(color: Colors.blue.shade50),
                          ),
                          onSelected: (String novoToque) =>
                              alarme.alterarToque(novoToque),
                        ),
                      ],
                    );
                  },
                ),
                const Spacer(),
                Center(
                  child: Observer(
                    builder: (_) {
                      return Switch(
                        value: alarme.toqueAtivado,
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        activeColor: Colors.blueGrey.shade50,
                        onChanged: (_) => alarme.switchToque(), // Errado?
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          cardEditar(
            filho: Row(
              children: [
                const Icon(Icons.vibration, color: Colors.white),
                Container(width: 9),
                const Text(
                  "Vibração",
                  style: TextStyle(color: Colors.white),
                ),
                const Spacer(),
                SizedBox(
                  height: 20,
                  child: Observer(
                    builder: (_) {
                      return Switch(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                        activeColor: Colors.blueGrey.shade50,
                        value: alarme.vibracaoAtivada,
                        onChanged: (_) => alarme.switchVibracao(), // Errado?
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
