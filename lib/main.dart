import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/bunglow/bunglow.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';

import 'view/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primaryColor,
          )),
      home: const HomePage(),
      routes: {
        Residential.namedRoute: (context) => const Residential(),
        Bunglow.namedRoute: (context) => const Bunglow(),
        Requirement.namedRoute: (context) => Requirement(),
        Entrance.namedRoute: (context) => const Entrance(),
        LivingHall.namedRoute : (context) =>  LivingHall(),
        PantryDetail.namedRoute :(context) => PantryDetail()
      },
    );
  }
}
