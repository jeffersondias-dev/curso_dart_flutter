import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.texto);
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        texto,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
