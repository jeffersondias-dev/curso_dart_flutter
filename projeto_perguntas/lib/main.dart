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
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 2},
      ],
    },
    {
      'texto': 'Qual é o seu animal Favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 8},
        {'texto': 'Gato', 'pontuacao': 3},
        {'texto': 'Cachorro', 'pontuacao': 6},
        {'texto': 'Cavalo', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor Favorito?',
      'respostas': [
        {'texto': 'João', 'pontuacao': 9},
        {'texto': 'Maria', 'pontuacao': 3},
        {'texto': 'Diogo', 'pontuacao': 6},
        {'texto': 'Dayana', 'pontuacao': 10},
      ],
    }
  ];

  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  /// _responder() is a function that is called when the user clicks on the button. It checks if there is
  /// a question selected, and if there is, it increments the _perguntaSelecionada variable by 1
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
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
            : Resultado(
                pontuacao: _pontuacaoTotal,
                reinciarQuestionario: _reiniciarQuestionario),
      ),
    );
  }
}
