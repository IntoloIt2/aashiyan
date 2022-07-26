import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../view/residential/bunglow/bedroompage.dart';
import '../view/residential/bunglow/entrance.dart';
import 'steps_container.dart';

int index = 1;
String? st;

class BunglowSteps extends StatefulWidget {
  const BunglowSteps({Key? key}) : super(key: key);

  @override
  State<BunglowSteps> createState() => _BunglowStepsState();
}

class _BunglowStepsState extends State<BunglowSteps> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                    st = "Requirement";
                  });
                },
                child: stepsContainer("Step 1"),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 2;
                    st = "Entrance";
                  });
                },
                child: stepsContainer("Step 2"),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 3;
                      st = "Living Hall";
                    });
                  },
                  child: stepsContainer("Step 3")),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 4;
                    st = "Pantry";
                  });
                },
                child: stepsContainer("step4"),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      index = 5;
                      st = "Floor Store";
                    });
                  },
                  child: stepsContainer("step5")),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 6;
                    st = "Bed Room";
                  });
                },
                child: stepsContainer("step6"),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 7;
                    st = "Basement";
                  });
                },
                child: Center(child: stepsContainer("step7")),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 8;
                    st = "Basement";
                  });
                },
                child: stepsContainer("step8"),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Pages[index]
        ],
      ),
    );
  }
}

List Pages = [
  Requirement(),
  Entrance(),
  LivingHall(),
  PantryDetail(),
  FloorStore(),
  BedroomPage(),
  Basement()
];

class StepPages extends StatelessWidget {
  const StepPages({Key? key}) : super(key: key);
  static const namedRoute = "/stepages";
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
      children: [
        BunglowSteps()
      ],
     ),
    );
  }
}
