/// The class Questao is a StatelessWidget that has a property called texto, which is a String
import 'package:flutter/material.dart';

class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      child: Text(
        texto,
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
      ),
    );
  }
}
