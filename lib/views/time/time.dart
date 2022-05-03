import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/views/titulo/cadastrar_titulo.dart';
import 'package:flutter/material.dart';

class TimeView extends StatefulWidget {
  Time time;
  TimeView({Key? key, required this.time}) : super(key: key);

  @override
  State<TimeView> createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  addTitulo(Titulo titulo) {
    setState(() {
      widget.time.addTitulo(titulo);
    });
    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Salvo com sucesso")));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastrarTituloView(
                                time: widget.time,
                                onSave: this.addTitulo,
                              )));
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
                  child: Image.network(
                    widget.time.brasao,
                    width: 100,
                    height: 100,
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
    final quantidade = widget.time.titulos.length;

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
                title: Text(widget.time.titulos[index].campeonato),
                trailing: Text(widget.time.titulos[index].ano),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
