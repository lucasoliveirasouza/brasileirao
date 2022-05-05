import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  int jogos;
  int timeId;
  int vitorias;
  int empates;
  int derrotas;
  int golsPro;
  int golsContra;
  int saldoGols;

  List<Titulo> titulos = [];

  Time({
    required this.nome,
    required this.brasao,
    required this.pontos,
    required this.jogos,
    required this.timeId,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.golsPro,
    required this.golsContra,
    required this.saldoGols,
  });

  addTitulo(Titulo titulo) {
    titulos.add(titulo);
  }
}
