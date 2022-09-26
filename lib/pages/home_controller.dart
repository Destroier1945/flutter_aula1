import 'dart:collection';

import '../models/time.dart';
import '../repositories/times_repository.dart';
import '../models/titulo.dart';

class HomeController{
  TimesRepostory? timesRepostory;
  UnmodifiableListView<Time>? get tabela => timesRepostory?.times;
  
  HomeController(){
    timesRepostory = TimesRepostory();
  }
}