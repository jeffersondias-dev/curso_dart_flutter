import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int? pontuacao;
  final void Function()? reinciarQuestionario;

  const Resultado({this.pontuacao, this.reinciarQuestionario});

  String get fraseResultado {
    if (pontuacao! < 8) {
      return "Parabébs";
    } else if (pontuacao! < 12) {
      return "Você é bom!!";
    } else if (pontuacao! < 16) {
      return "Impressionante";
    } else {
      return "Nivel Jedi!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0)),
        TextButton(
          onPressed: reinciarQuestionario,
          child: const Text(
            "Reiniciar?",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
