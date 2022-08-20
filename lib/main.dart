import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/homepage.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/bunglow/bunglow.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:aashiyan/view/residential/bunglow/staticbedroompage.dart';
import 'package:aashiyan/view/residential/bunglow/testing.dart';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'OpenSans',
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: primaryColor,
          )),
      home: dynmicTesting(),
      routes: {
        Residential.namedRoute: (context) => Residential(),
        Bunglow.namedRoute: (context) => Bunglow(),
        Requirement.namedRoute: (context) => Requirement(),
        Entrance.namedRoute: (context) => Entrance(),
        LivingHall.namedRoute: (context) => LivingHall(),
        PantryDetail.namedRoute: (context) => PantryDetail(),
        FloorStore.namedRoute: (context) => FloorStore(),
        Basement.namedRoute: (context) => Basement(),
        StepPages.namedRoute: (context) => StepPages(),
      },
    );
  }
}
