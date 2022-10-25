import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';

/// A stateless widget that receives a list of questions and answers, and displays them on the
/// screen.
class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) responder;

  const Questionario({
    super.key,
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : perguntas[0].cast()['respostas'];

    return Column(
      children: [
        /// A list of widgets.
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas.map((element) {
          return Resposta(
            element['texto'] as String,
            () => responder(int.parse(element['pontuacao'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
