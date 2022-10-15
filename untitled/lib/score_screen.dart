import 'package:flutter/material.dart';
import 'package:untitled/widgets/score_board.dart';
import 'main.dart';

late var growableListPontos = [];
late var growableListTentativas = [];
late var tamanho = [];

class score_screen extends StatefulWidget {
  const score_screen({Key? key}) : super(key: key);

  @override
  State<score_screen> createState() => _score_screenState();
}

class _score_screenState extends State<score_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4A152C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Tabela de pontos",
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Text('$tamanho:'
                      'Pontos: $growableListPontos'
                      'Tentativas: $growableListTentativas'),
                )
              ]),
          /*ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: growableListPontos.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(growableListPontos[index]);
              }),
          ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: growableListTentativas.length,
              itemBuilder: (BuildContext context, int j) {
                return Text(growableListTentativas[j]);
              }),*/
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.limeAccent)),
              child: const Text(
                'Voltar',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onPressed: () {
                pontos = 0;
                tentativas = 0;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              }, //onPressed
            ),
          ),
        ],
      ),
    );
  }
}
