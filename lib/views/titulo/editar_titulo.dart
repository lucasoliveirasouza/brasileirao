import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/service/time_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditarTituloView extends StatefulWidget {
  Titulo titulo;
  EditarTituloView({Key? key, required this.titulo}) : super(key: key);

  @override
  State<EditarTituloView> createState() => _EditarTituloViewState();
}

class _EditarTituloViewState extends State<EditarTituloView> {
  final ano = TextEditingController();
  final campeonato = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    ano.text = widget.titulo.ano;
    campeonato.text = widget.titulo.campeonato;
  }

  editar() {
    Provider.of<TimesService>(context, listen: false).editarTitulo(
      widget.titulo,
      ano.text,
      campeonato.text,
    );
    Get.back();
    Get.snackbar(
      "Sucesso!",
      "Título editado",
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar título"),
        actions: [
          IconButton(
            onPressed: editar,
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: campeonato,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Campeonato"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o campeonato";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 25,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ano,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Ano"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Informe o ano";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
