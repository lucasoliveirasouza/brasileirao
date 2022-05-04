import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/service/time_service.dart';
import 'package:brasileirao/views/titulo/cadastrar_titulo.dart';
import 'package:brasileirao/views/titulo/editar_titulo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TimeView extends StatefulWidget {
  Time time;
  TimeView({Key? key, required this.time}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => CadastrarTituloView(
                        time: widget.time,
                      ));
                },
                icon: Icon(Icons.add),
              )
            ],
            centerTitle: true,
            title: Text(widget.time.nome),
            backgroundColor: widget.time.cor,
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.stacked_bar_chart),
                  text: "Estatísticas",
                ),
                Tab(
                  icon: Icon(Icons.emoji_events),
                  text: "Títulos",
                ),
              ],
              indicatorColor: Colors.white,
            )),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Image(
                    image: Svg(widget.time.brasao,
                        source: SvgSource.network, color: Colors.transparent),
                  ),
                ),
                Text(
                  "Pontos: ${widget.time.pontos}",
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
            titulos(),
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesService>(context)
        .times
        .firstWhere((t) => t.nome == widget.time.nome);
    final quantidade = time.titulos.length;
    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Nenhum titulo ainda!'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
                onTap: () {
                  Get.to(
                    EditarTituloView(titulo: time.titulos[index]),
                    fullscreenDialog: true,
                  );
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
