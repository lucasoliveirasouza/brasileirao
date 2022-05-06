import 'package:brasileirao/controllers/home_controller.dart';
import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/service/time_service.dart';
import 'package:brasileirao/views/time/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<TimesService>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemCount: repositorio.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Image(
                  width: 50,
                  height: 50,
                  image: Svg(
                    tabela[time].brasao,
                    source: SvgSource.network,
                  ),
                ),
                title: Text(tabela[time].nome),
                trailing: Text(tabela[time].pontos.toString()),
                onTap: () {
                  Get.to(() => TimeView(
                      key: Key(tabela[time].nome), time: tabela[time]));
                },
              );
            },
            separatorBuilder: (_, __) => Divider(),
            padding: EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}
