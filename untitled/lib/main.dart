import 'package:flutter/material.dart';
import 'package:untitled/utils/game_logic.dart';
import 'package:untitled/widgets/score_board.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage()
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
  int tentativas = 0;
  int pontos = 0;

  @override
  void initState(){
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
              child: Text("Jogo da Memoria", style: TextStyle(fontSize: 48.0,fontWeight: FontWeight.bold, color: Colors.white,
      ),
    ),
          ),
          SizedBox(height: 24.0,
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
            height: screen_width/3.5,
            width: screen_width/3.5,

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
                itemBuilder: (context, index){
                return GestureDetector(
                  onTap: (){
                    print(_game.cards_list[index]);
                    setState(() {
                      tentativas++;
                      _game.gameImg![index] = _game.cards_list[index];
                      _game.matchCheck.add({index:_game.cards_list[index]});

                    });
                    if(_game.matchCheck.length == 2){
                      if(_game.matchCheck[0].values.first == _game.matchCheck[1].values.first) {
                        print("true");
                        pontos+=100;
                        _game.matchCheck.clear();

                        /*setState(() {
                          _game.gameImg![_game.matchCheck[0].keys.first] = _game.
                        });*/
                      }else{
                        print("false");
                        Future.delayed(Duration(milliseconds: 500), (){
                          print(_game.gameImg);
                          setState(() {
                            _game.gameImg![_game.matchCheck[0].keys.first] = _game.hiddenCardPath;
                            _game.gameImg![_game.matchCheck[1].keys.first] = _game.hiddenCardPath;
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
                        image: DecorationImage(image: AssetImage(_game.gameImg![index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ));}
            ),
          ),
        ],
      ),
    );
  }
}
