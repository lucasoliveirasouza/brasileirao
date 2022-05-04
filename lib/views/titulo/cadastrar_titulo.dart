import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:brasileirao/service/time_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastrarTituloView extends StatefulWidget {
  Time time;
  CadastrarTituloView({Key? key, required this.time}) : super(key: key);

  @override
  State<CadastrarTituloView> createState() => _CadastrarTituloViewState();
}

class _CadastrarTituloViewState extends State<CadastrarTituloView> {
  final ano = TextEditingController();
  final campeonato = TextEditingController();
  final formKey = GlobalKey<FormState>();

  save() {
    Provider.of<TimesService>(context, listen: false).addTitulo(
      widget.time,
      Titulo(
        campeonato.text,
        ano.text,
      ),
    );
    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Salvo com sucesso")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar um titulo"),
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
              SizedBox(
                height: 25,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.only(right: 30, left: 30),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        save();
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text("Salvar"),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
