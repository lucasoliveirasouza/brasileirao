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
        nome: "Flamengo",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/819.png&h=200&w=200",
        pontos: 71,
        cor: Colors.red,
      ),
      Time(
        nome: "Red Bull Bragantino",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/6079.png&h=200&w=200",
        pontos: 68,
        cor: Colors.black,
      ),
      Time(
        nome: "Palmeiras",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/2029.png&h=200&w=200",
        pontos: 66,
        cor: Colors.green.shade800,
      ),
      Time(
        nome: "Atlético-GO",
        brasao:
            "https://a.espncdn.com/combiner/i?img=/i/teamlogos/soccer/500/10357.png&h=200&w=200",
        pontos: 62,
        cor: Colors.red,
      ),
    ]);
  }
}
