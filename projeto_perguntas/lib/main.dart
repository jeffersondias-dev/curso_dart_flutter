import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/respostas.dart';

main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
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

    List<Widget> respostas = [];

    for (String textoResposta
        in perguntas[_perguntaSelecionada].cast()['respostas']) {
      respostas.add(Resposta(textoResposta, _responder));
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas,
          ],
        ),
      ),
    );
  }
}
