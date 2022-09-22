import '../models/time.dart';
import '../repositories/times_repository.dart';
import '../models/titulo.dart';

class HomeController{
  TimesRepostory? timesRepostory;
  List<Time> get tabela => timesRepostory?.times;
  
  HomeController(){
    timesRepostory = TimesRepostory();
  }
}