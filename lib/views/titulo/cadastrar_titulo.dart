import 'package:brasileirao/models/time.dart';
import 'package:brasileirao/models/titulo.dart';
import 'package:flutter/material.dart';

class CadastrarTituloView extends StatefulWidget {
  Time time;
  ValueChanged<Titulo> onSave;
  CadastrarTituloView({Key? key, required this.time, required this.onSave})
      : super(key: key);

  @override
  State<CadastrarTituloView> createState() => _CadastrarTituloViewState();
}

class _CadastrarTituloViewState extends State<CadastrarTituloView> {
  final ano = TextEditingController();
  final campeonato = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
                        widget.onSave(Titulo(campeonato.text, ano.text));
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
