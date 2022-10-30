import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/page_nav_provider.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/residential_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/homepage.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';

import 'package:aashiyan/view/residential/bunglow/bunglow.dart';
import 'package:aashiyan/view/residential.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:aashiyan/view/residential/house-duplex/houseduplex.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'view/residential/house-duplex/pages/pageNav.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PageNavProvider()),
    ChangeNotifierProvider(create: (_) => ResidentialProvider()),
    // ChangeNotifierProvider(create: (_) => Auth_Provider())
  ], child: const MyApp()));
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
        ),
      ),
      home: const HomePage(),
      routes: {
        Residential.namedRoute: (context) => const Residential(),
        HouseDuplex.namedRoute: (context) => HouseDuplex(),
        Bunglow.namedRoute: (context) => Bunglow(),
        Requirement.namedRoute: (context) => Requirement(),
        Entrance.namedRoute: (context) => const Entrance(),
        LivingHall.namedRoute: (context) => LivingHall(),
        PantryDetail.namedRoute: (context) => const PantryDetail(),
        FloorStore.namedRoute: (context) => const FloorStore(),
        Basement.namedRoute: (context) => Basement(),
        StepPages.namedRoute: (context) => const StepPages(),
        PageNav.namedRoute: (context) => const PageNav()
      },
    );
  }
}
