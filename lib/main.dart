import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:aashiyan/view/residential/bunglow/bedroompage.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/bunglow/bunglow.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:aashiyan/view/residential/bunglow/testing.dart';

import 'package:flutter/material.dart';

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
      home: BedroomPage(),
      routes: {
        Residential.namedRoute: (context) => const Residential(),
        Bunglow.namedRoute: (context) => const Bunglow(),
        Requirement.namedRoute: (context) => Requirement(),
        Entrance.namedRoute: (context) => const Entrance(),
        LivingHall.namedRoute: (context) => LivingHall(),
        PantryDetail.namedRoute: (context) => PantryDetail(),
        FloorStore.namedRoute: (context) => FloorStore(),
        BedRoom.namedRoute: (context) => BedRoom(),
        BedroomPage.namedRoute: (context) => BedroomPage()
      },
    );
  }
}
