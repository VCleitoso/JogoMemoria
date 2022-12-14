import 'package:flutter/material.dart';
import 'package:untitled/widgets/score_board.dart';
import 'main.dart';

late var growableListPontos = [0, 0, 0, 0, 0];
late var growableListTentativas = [0, 0, 0, 0, 0];
late var tamanho = [0, 0, 0, 0, 0];

TableRow criarLinhaTable(String listaNomes) {
  return TableRow(
      children: listaNomes.split(';').map((name) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        name,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      padding: EdgeInsets.all(8.0),
    );
  }).toList());
}

/*void apagar() {
  for (int i = 0; i <= 5; i++) {
    int z = i + 1;
    int g = tamanho[i];
    int h = growableListPontos[i];
    int j = growableListTentativas[i];
    if (tamanho[i] != z) {
      tamanho.remove(g);
      growableListPontos.remove(h);
      growableListTentativas.remove(j);
    }
  }
}

void preencher() {
  for (int i = 0; i <= 4; i++) {
    int z = i + 1;
    if (tamanho[i] != z) {
      tamanho[i] = 0;
      growableListTentativas[i] = 0;
      growableListPontos[i] = 0;
    }
  }
}*/
/*Container horseshit() {
  int a = 0, b = 0, c = 0;
  int i = 0;
  for (i = 0; i < tamanho.length; i++) {
    a = tamanho[i];
    b = growableListPontos[i];
    c = growableListTentativas[i];
    return Container(
      color: Colors.white,
      child: Text('$a:'
          'Pontos: $b'
          'Tentativas: $c'),
    );
  }
  return Container(
    color: Colors.white,
    child: Text('$a:'
        'Pontos: $b'
        'Tentativas: $c'),
  );
}*/

late var a1 = tamanho[0];
late var b1 = growableListPontos[0];
late var c1 = growableListTentativas[0];
late var a2 = tamanho[1];
late var b2 = growableListPontos[1];
late var c2 = growableListTentativas[1];
late var a3 = tamanho[2];
late var b3 = growableListPontos[2];
late var c3 = growableListTentativas[2];
late var a4 = tamanho[3];
late var b4 = growableListPontos[3];
late var c4 = growableListTentativas[3];
late var a5 = tamanho[4];
late var b5 = growableListPontos[4];
late var c5 = growableListTentativas[4];

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
                Table(
                  defaultColumnWidth: FixedColumnWidth(150.0),
                  border: TableBorder(
                    horizontalInside: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    verticalInside: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  children: [
                    criarLinhaTable("Jogada; Pontos; Tentativas"),
                    criarLinhaTable("$a1; $b1; $c1"),
                    criarLinhaTable("$a2; $b2; $c2"),
                    criarLinhaTable("$a3; $b3; $c3"),
                    criarLinhaTable("$a4; $b4; $c4"),
                    criarLinhaTable("$a5; $b5; $c5"),
                  ],
                ),
                /* Container(
                  color: Colors.white,
                  child: Text('$tamanho:'
                      'Pontos: $growableListPontos'
                      'Tentativas: $growableListTentativas'),
                )*/
              ]),
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

//coloquei aqui em baixo
/* Widget createListView(BuildContext context) {
    return ListView.builder(
      itemCount: jooj,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: <Widget>[
            ListTile(
              title:
                  Text(tamanho[index].replaceAll((tamanho[index].toString()))),
            ),
            const Divider(
              height: 2.0,
            ),
          ],
        );
      },
    );
  }*/
}
