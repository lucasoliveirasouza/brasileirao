import 'package:brasileirao/models/time.dart';
import 'package:flutter/material.dart';

class TimeView extends StatefulWidget {
  Time time;
  TimeView({Key? key, required this.time}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.time.nome),
        backgroundColor: widget.time.cor,
      ),
    );
  }
}
