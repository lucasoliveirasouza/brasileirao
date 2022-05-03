import 'package:brasileirao/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Brasileirão",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int i) {
          final tabela = controller.tabela;
          return ListTile(
            leading: SizedBox(
              height: 40,
              width: 40,
              child: Image.network(tabela[i].brasao),
            ),
            title: Text(tabela[i].nome),
            trailing: Text(tabela[i].pontos.toString()),
          );
        },
        separatorBuilder: (_, __) => Divider(),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}
