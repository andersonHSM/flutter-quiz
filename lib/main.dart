import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      if (_perguntaSelecionada < perguntas.length - 1) {
        _perguntaSelecionada++;
      }
      this.widgetsRespostas = [];
    });
  }

  final List<Map<String, Object>> perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Coelho', 'Cobra', 'Elefante', 'Leão']
    },
    {
      'texto': 'Qual é o seu instrutor  favorito?',
      'respostas': ['Maria', 'João', 'Léo', 'Pedro']
    },
  ];

  List<Widget> widgetsRespostas = [];

  @override
  Widget build(BuildContext context) {
    List<String> respostas = perguntas[_perguntaSelecionada]['respostas'];
    // widgetsRespostas =
    //     respostas.map((texto) => Resposta(texto, _responder)).toList();

    // for (String textoResp in respostas) {
    //   widgetsRespostas.add(Resposta(textoResp, _responder));
    // }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Perguntas!'), backgroundColor: Colors.blue),
      body: Column(
        children: <Widget>[
          Questao(
            pergunta: perguntas[_perguntaSelecionada]['texto'],
          ),
          ...respostas.map((e) => Resposta(e, _responder)).toList()
        ],
      ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
