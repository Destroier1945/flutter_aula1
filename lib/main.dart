import 'package:flutter/material.dart';
import 'package:flutter_aula1/repositories/times_repository.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimesRepostory(),
      child: MyApp(),
    ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasileirao',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(background: Colors.yellow),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
