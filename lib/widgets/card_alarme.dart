import 'package:flutter/material.dart';
import 'package:alarme_pi/screens/editar_alarme.dart';
import 'package:alarme_pi/data/alarme.dart';

class AlarmeCard extends StatefulWidget {
  final Alarme alarme;
  const AlarmeCard({Key? key, required this.alarme}) : super(key: key);

  @override
  State<AlarmeCard> createState() => _AlarmeCardState();
}

class _AlarmeCardState extends State<AlarmeCard> {
  bool alarmeAtivado = false;

  Text textoCard(String texto) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 14, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;
    //double card_tamanho = 0.833 * width;
    Alarme alarme = widget.alarme;

    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () => EditarAlarme.navegar(context, alarme: alarme),
        onLongPress: () {},
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textoCard(alarme.nome),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 1,
                      color: alarme.cor,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    alarme.hora.toString(),
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Switch(
                    value: alarme.ativado,
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.white),
                    activeColor: Colors.blueGrey.shade50,
                    onChanged: (value) {
                      setState(
                        () {
                          alarme.ativado = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              textoCard('Frequência de repetição do alarme'),
            ],
          ),
        ),
      ),
    );
  }
}
