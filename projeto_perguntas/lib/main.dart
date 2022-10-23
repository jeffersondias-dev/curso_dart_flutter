import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';
import 'package:projeto_perguntas/resultado.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor Favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal Favorito?',
      'respostas': ['Coelho', 'Gato', 'Cachorro', 'Cavalo'],
    },
    {
      'texto': 'Qual é o seu instrutor Favorito?',
      'respostas': ['João', 'Maria', 'Diogo', 'Dayana'],
    }
  ];

  var _perguntaSelecionada = 0;

  /// _responder() is a function that is called when the user clicks on the button. It checks if there is
  /// a question selected, and if there is, it increments the _perguntaSelecionada variable by 1
  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  /// A getter that returns true if the _perguntaSelecionada is less than the length of the _perguntas
  /// list.
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    /// A ternary operator that checks if there is a question selected, and if there is, it returns the
    /// list of answers of the question selected, otherwise it returns the list of answers of the first
    /// question.
    List<String> respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada].cast()['respostas']
        : _perguntas[0].cast()['respostas'];

    /// Creating a list of widgets, where each widget is a Resposta widget, and each Resposta widget has
    /// a text and a function.
    List<Widget> widgets =
        respostas.map((element) => Resposta(element, _responder)).toList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Column(
                children: [
                  Questao(_perguntas[_perguntaSelecionada]['texto'].toString()),
                  ...widgets,
                ],
              )
            : const Resultado('Parabéns Jovem'),
      ),
    );
  }
}
