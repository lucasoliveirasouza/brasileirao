import 'package:brasileirao/models/time.dart';

class HomeController {
  List<Time> tabela = [];

  HomeController() {
    tabela = [
      Time(
        nome: "Flamengo",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/819.png&h=200&w=200",
        pontos: 71,
      ),
      Time(
        nome: "Red Bull Bragantino",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6079.png&h=200&w=200",
        pontos: 68,
      ),
      Time(
        nome: "Palmeiras",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2029.png&h=200&w=200",
        pontos: 66,
      ),
      Time(
        nome: "Atlético-GO",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/10357.png&h=200&w=200",
        pontos: 62,
      ),
    ];
  }
}
