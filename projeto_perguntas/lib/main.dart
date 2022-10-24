import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
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
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal Favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 8},
        {'texto': 'Gato', 'nota': 3},
        {'texto': 'Cachorro', 'nota': 6},
        {'texto': 'Cavalo', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor Favorito?',
      'respostas': [
        {'texto': 'João', 'nota': 9},
        {'texto': 'Maria', 'nota': 3},
        {'texto': 'Diogo', 'nota': 6},
        {'texto': 'Dayana', 'nota': 10},
      ],
    }
  ];

  var _perguntaSelecionada = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder)
            : const Resultado('Parabéns Jovem'),
      ),
    );
  }
}
