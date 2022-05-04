import 'dart:collection';

import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

class TimesService extends ChangeNotifier {
  List<Time> _times = [];

  UnmodifiableListView<Time> get times => UnmodifiableListView(_times);

  void addTitulo(Time time, Titulo titulo) {
    time.addTitulo(titulo);
    notifyListeners();
  }

  void editarTitulo(Titulo titulo, String ano, String campeonato) {
    titulo.ano = ano;
    titulo.campeonato = campeonato;
    notifyListeners();
  }

  TimesService() {
    _times.addAll([
      Time(
        nome: "Corinthians",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/874.png&h=200&w=200",
        pontos: 9,
        cor: Colors.black,
      ),
      Time(
        nome: "Red Bull Bragantino",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6079.png&h=200&w=200",
        pontos: 8,
        cor: Colors.black,
      ),
      Time(
        nome: "Atlético-MG",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/7632.png&h=200&w=200",
        pontos: 8,
        cor: Colors.black,
      ),
      Time(
        nome: "Coritiba",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/3456.png&h=200&w=200",
        pontos: 7,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "São Paulo",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2026.png&h=200&w=200",
        pontos: 7,
        cor: Colors.red,
      ),
      Time(
        nome: "Santos",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2674.png&h=200&w=200",
        pontos: 7,
        cor: Colors.black,
      ),
      Time(
        nome: "Cuiabá",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/17313.png&h=200&w=200",
        pontos: 7,
        cor: Colors.yellow,
      ),
      Time(
        nome: "Internacional",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/1936.png&h=200&w=200",
        pontos: 7,
        cor: Colors.red,
      ),
      Time(
        nome: "Avaí",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/9966.png&h=200&w=200",
        pontos: 7,
        cor: Colors.blue,
      ),
      Time(
        nome: "América-MG",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6154.png&h=200&w=200",
        pontos: 6,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "Palmeiras",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2029.png&h=200&w=200",
        pontos: 5,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "Flamengo",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/819.png&h=200&w=200",
        pontos: 5,
        cor: Colors.red,
      ),
      Time(
        nome: "Botafogo",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6086.png&h=200&w=200",
        pontos: 5,
        cor: Colors.black,
      ),
      Time(
        nome: "Fluminense",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/3445.png&h=200&w=200",
        pontos: 4,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "Ceará",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/9969.png&h=200&w=200",
        pontos: 3,
        cor: Colors.black,
      ),
      Time(
        nome: "Athletico-PR",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/3458.png&h=200&w=200",
        pontos: 3,
        cor: Colors.red,
      ),
      Time(
        nome: "Atlético-GO",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/10357.png&h=200&w=200",
        pontos: 3,
        cor: Colors.red,
      ),
      Time(
        nome: "Goiás",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/3395.png&h=200&w=200",
        pontos: 2,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "Juventude",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6270.png&h=200&w=200",
        pontos: 2,
        cor: Colors.green,
      ),
      Time(
        nome: "Fortaleza",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6272.png&h=200&w=200",
        pontos: 0,
        cor: Colors.blue,
      ),
    ]);
  }
}
