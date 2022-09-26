import 'package:flutter/material.dart';
import 'package:flutter_aula1/repositories/times_repository.dart';
import 'package:provider/provider.dart';
import '../models/time.dart';
import 'add_titulo.page.dart';

class TimePage extends StatefulWidget {
  Time time;
   TimePage({Key? key, required this.time}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}



class _TimePageState extends State<TimePage> {
  titulopage(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AddTituloPage(time: widget.time),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(onPressed: titulopage,
                icon: Icon(Icons.add))
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estastitiscas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Titulos',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(24),
                child: Image.network(widget.time.brasao.replaceAll('40x40', '100x100')),
                ),
                Text('Pontos: ${widget.time.pontos}',
                style: TextStyle(
                  fontSize: 24,
                ),),
              ],
            ),
            titulos(),
          ],
        ),
      ),
    );
  }
  Widget titulos(){

    final time = Provider.of<TimesRepostory>(context)
        .times
        .firstWhere((t)=> t.nome == widget.time.nome);
    final quantidade = time.titulos.length;

    return quantidade == 0
        ? Container(
        child: Center(child: Text('Nenhum titulo ainda')),
    )
        : ListView.separated(
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading:Icon(Icons.emoji_events),
            title: Text(widget.time.titulos[index].campeonato),
            trailing: Text(widget.time.titulos[index].ano),
          );
        },
        separatorBuilder: (_,__) => Divider(),
      itemCount: quantidade,
    );
  }
}
