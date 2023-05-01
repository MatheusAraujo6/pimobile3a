import 'package:flutter/material.dart';

class RadioCustom extends StatelessWidget {
  final int dia;
  final bool valor;
  static const List<String> dias = ["D", "S", "T", "Q", "Q", "S", "S"];
  final void Function()? radioCallback;

  const RadioCustom(
      {super.key, this.dia = 0, this.valor = false, this.radioCallback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        radioCallback!();
      },
      style: OutlinedButton.styleFrom(
        animationDuration: const Duration(milliseconds: 50),
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        fixedSize: const Size(30, 30),
        shape: const CircleBorder(),
        side: valor
            ? const BorderSide(color: Colors.white, width: 2)
            : const BorderSide(color: Colors.blueGrey),
      ),
      child: Text(
        dias[dia],
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
