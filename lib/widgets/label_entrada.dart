import 'package:flutter/material.dart';

class LabelEntrada extends StatelessWidget {
  final String label;

  const LabelEntrada({super.key, this.label = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
