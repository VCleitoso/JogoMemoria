class Game{
  final String hiddenCardPath = '/images/hidden.png';
  List<String>? gameImg;
  final List<String> cards_list = [
    "assets/images/cursedwallace.png",
    "assets/images/javashinji.png",
    "assets/images/monke.png",
    "assets/images/download.png",
    "assets/images/cursedwallace.png",
    "assets/images/javashinji.png",
    "assets/images/download.png",
    "assets/images/monke.png",
  ];
  //Ver se as cartas sao iguais
  List<Map<int, String>> matchCheck = [];

  final int cardCount = 8;

  //iniciar o jogo
  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardPath);
  }
}