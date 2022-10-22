import 'package:flutter/material.dart';
import 'package:untitled/score_screen.dart';
import 'package:untitled/utils/game_logic.dart';
import 'package:untitled/widgets/score_board.dart';
import 'score_screen.dart';

int tentativas = 0;
int pontos = 0;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Chamada da funçao do jogo
  Game _game = Game();

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  Widget build(BuildContext context) {
    //pegar as dimensoes da tela
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF4A152C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Jogo da Memoria",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Funçao em widget pra pontuaçao
              scoreBoard("Tentativas", "${tentativas}"),
              scoreBoard("Pontos", "${pontos}"),
            ],
          ),
          SizedBox(
            //Modo desktop
            height: screen_width / 3.5,
            width: screen_width / 3.5,

            //Modo mobile
/*
            height: screen_width,
            width: screen_width, */

            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print(_game.cards_list[index]);
                        setState(() {
                          tentativas++;
                          _game.gameImg![index] = _game.cards_list[index];
                          _game.matchCheck
                              .add({index: _game.cards_list[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print("true");
                            pontos += 100;
                            _game.matchCheck.clear();

                            /*setState(() {
                          _game.gameImg![_game.matchCheck[0].keys.first] = _game.
                        });*/
                          } else {
                            print("false");
                            Future.delayed(Duration(milliseconds: 500), () {
                              print(_game.gameImg);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardPath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardPath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                }),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.limeAccent)),
              child: const Text(
                'Terminar',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              onPressed: () {
                if (tamanho[0] == 0) {
                  growableListPontos[0] = pontos;
                  growableListTentativas[0] = tentativas;
                  tamanho[0] = 1;
                  a1 = tamanho[0];
                  b1 = growableListPontos[0];
                  c1 = growableListTentativas[0];
                } else if (tamanho[1] == 0) {
                  growableListPontos[1] = pontos;
                  growableListTentativas[1] = tentativas;
                  tamanho[1] = 2;
                  a2 = tamanho[1];
                  b2 = growableListPontos[1];
                  c2 = growableListTentativas[1];
                } else if (tamanho[2] == 0) {
                  growableListPontos[2] = pontos;
                  growableListTentativas[2] = tentativas;
                  tamanho[2] = 3;
                  a3 = tamanho[2];
                  b3 = growableListPontos[2];
                  c3 = growableListTentativas[2];
                } else if (tamanho[3] == 0) {
                  growableListPontos[3] = pontos;
                  growableListTentativas[3] = tentativas;
                  tamanho[3] = 4;
                  a4 = tamanho[3];
                  b4 = growableListPontos[3];
                  c4 = growableListTentativas[3];
                } else if (tamanho[4] == 0) {
                  growableListPontos[4] = pontos;
                  growableListTentativas[4] = tentativas;
                  tamanho[4] = 5;
                  a5 = tamanho[4];
                  b5 = growableListPontos[4];
                  c5 = growableListTentativas[4];
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const score_screen()));
              }, //onPressed
            ),
          ),
        ],
      ),
    );
  }
}
