import 'package:flutter/material.dart';

// padding
// left 8, right 8, bottom 5
// all 8

Widget cardEditar({required Widget filho}) {
  return Card(
    color: Colors.blueGrey,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: filho,
    ),
  );
}
