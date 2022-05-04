import 'dart:collection';
import 'dart:convert';

import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    _buscarTimes();
  }

  _buscarTimes() async {
    String uri = 'https://api.api-futebol.com.br/v1/campeonatos/10/tabela';
    final response = await http.get(Uri.parse(uri), headers: {
      'Authorization': 'Bearer test_6ce75e3cb6709126cccff4605961e6'
      //'Authorization': 'Bearer live_df14d6a924f3c3dc735542defcf2cc'
    });

    if (response.statusCode == 200) {
      print("Entrei");
      final json = jsonDecode(response.body);
      print(response.body);
      final List<dynamic> times = json;

      times.forEach((time) {
        print(time['time']['escudo']);
        Time tm = Time(
          nome: time['time']['nome_popular'],
          brasao: time['time']['escudo'],
          pontos: time["pontos"],
          cor: Colors.green,
        );
        _times.add(tm);
      });
      notifyListeners();
    }

    print(_times.length);
  }
}
