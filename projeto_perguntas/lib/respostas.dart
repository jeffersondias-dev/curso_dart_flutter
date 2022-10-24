/// Resposta is a StatelessWidget that takes a String and a Function as parameters.
/// The String is the text that will be displayed on the button.
///
/// The Function is the function that will be called when the button is pressed.
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 0.0),
      child: ElevatedButton(
        onPressed: quandoSelecionado,
        child: Text(texto),
      ),
    );
  }
}
