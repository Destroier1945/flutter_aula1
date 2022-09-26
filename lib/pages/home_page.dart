import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/home_controller.dart';
import 'package:flutter_aula1/pages/time_page.dart';
import 'package:flutter_aula1/repositories/times_repository.dart';
import 'package:provider/provider.dart';
import '../models/time.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = HomeController();

  @override
  void initState(){
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Brasileirao')),
      ),
      body: Consumer<TimesRepostory>(
        builder: (context, repostorio, child){
          return ListView.separated(
          itemCount: repostorio.times.length,
          itemBuilder: (BuildContext contexto, int time ){
          final List<Time>tabela = repostorio.times;
          return ListTile(
          leading: Image.network(tabela[time].brasao),
          title: Text(tabela[time].nome),
          trailing: Text(tabela[time].pontos.toString()),
          onTap: (){
          Navigator.push(
          contexto,
          MaterialPageRoute(builder: (_)
          => TimePage(time: tabela[time],
          key: Key(tabela[time].nome),
          ),),
          );
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
