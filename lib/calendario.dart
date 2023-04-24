import 'package:flutter/material.dart';

class Calendario extends StatelessWidget {
  const Calendario({super.key});

  @override
  Widget build(BuildContext context) {
    return GridPaper(
      color: Colors.white,
      divisions: 1,
      interval: 535 / 7,
      subdivisions: 1,
      child: Container(
        width: 310,
        height: 535,
        color: Colors.blueGrey.shade800,
      ),
    );
  }
}
