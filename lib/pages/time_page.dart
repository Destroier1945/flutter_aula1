import 'package:flutter/material.dart';
import '../models/time.dart';

class TimePage extends StatefulWidget {
  Time time;
   TimePage({Key? key, required this.time}) : super(key: key);

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
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
            Container(),
          ],
        ),
      ),
    );
  }
}
