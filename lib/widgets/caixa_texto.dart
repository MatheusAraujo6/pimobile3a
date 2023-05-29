import 'package:flutter/material.dart';

class CaixaEntradaTexto extends StatelessWidget {
  final String label;
  final bool isPassword;
  final String? Function(String?)? fieldValidator;

  String? nullString(String? value) {
    return null;
  }

  const CaixaEntradaTexto(
      {super.key,
      this.label = "",
      this.isPassword = false,
      this.fieldValidator});

  @override
  Widget build(BuildContext context) {
    /*
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent),
          ),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey.shade600)),
      style: const TextStyle(color: Colors.black),
    );
    */
    return TextFormField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        labelText: label,
      ),
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      validator: fieldValidator,
    );
  }
}
