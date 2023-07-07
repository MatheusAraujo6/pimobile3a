import 'package:flutter/material.dart';

class BotaoCustom extends StatelessWidget {
  final String label;
  final void Function()? funcionalidade;

  const BotaoCustom({super.key, this.label = "", this.funcionalidade});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => funcionalidade!(),
      style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.blueGrey.shade400),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
