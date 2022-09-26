import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/repositories/times_repository.dart';
import 'package:provider/provider.dart';
import '../models/titulo.dart';

class AddTituloPage extends StatefulWidget {
  Time time;
  AddTituloPage({Key? key,required this.time}) : super(key: key);

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _campeonato =TextEditingController();
  final _ano = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  save(){
    
    Provider.of<TimesRepostory>(context, listen: false).addTitulo(time: widget.time,
        titulo: Titulo(campeonato: _campeonato.text, ano: _ano.text),);

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Slavo com sucesso!'),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Adicionar titulo'),
        ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(24,),
            child: TextFormField(
              controller: _ano,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText:'Ano',
              ),
              keyboardType: TextInputType.number,
              validator: (value){
                if(value!.isEmpty){
                  return 'Informe o ano do titulo';
                }
                return null;
              },
            ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              child: TextFormField(
                controller: _campeonato,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:'Campeonato',
                ),
                validator: (value){
                  if(value!.isEmpty){
                    return 'Informe qual e o campeonato';
                  }
                  return null;
                },
              ),
            ),
            Expanded(child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: (){
                  if(_formkey.currentState!.validate()){
                    save();

                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    Padding(padding: EdgeInsets.all(16),
                    child: Text('Salvar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
