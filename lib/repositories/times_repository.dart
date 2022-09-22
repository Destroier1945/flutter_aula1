import '../models/time.dart';
import 'package:flutter/material.dart';
import '../models/titulo.dart';

class TimesRepostory{
  final List<Time> _times = [];

  get times => this._times;

  void addTitulo({required Time time, required Titulo titulo}){
    times.titulos.add(titulo);
  }

  TimesRepostory(){
    _times.addAll([
      Time(nome: "Flamengo", brasao: 'https://e.imguol.com/futebol/brasoes/40x40/flamengo.png', pontos: 12,cor: Colors.red),
      Time(nome: 'Internacional', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/internacional.png', pontos: 15, cor: Colors.red),
      Time(nome: 'Palmeiras', brasao: 'https://e.imguol.com/futebol/brasoes/40x40/palmeiras.png', pontos: 54, cor: Colors.green),
    ]);
  }
}