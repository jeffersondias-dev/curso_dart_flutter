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
