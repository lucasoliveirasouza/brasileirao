import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  Color cor;
  List<Titulo> _titulos = [];

  Time(
      {required this.nome,
      required this.brasao,
      required this.pontos,
      required this.cor});

  addTitulo(Titulo titulo) {
    _titulos.add(titulo);
  }
}
