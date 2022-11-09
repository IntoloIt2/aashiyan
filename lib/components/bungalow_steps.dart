import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/view/residential/bunglow/basement.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:aashiyan/utils/payment.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:flutter/material.dart';

import '../view/residential/bunglow/entrance.dart';
import '../view/residential/bunglow/staticbedroompage.dart';
import '../view/residential/bunglow/builtup.dart';
// import '../view/residential/bunglow/test.dart';
import 'steps_container.dart';

int? index = 0;
String? st = "Requirement";

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
              InkWell(
                onTap: () {
                  setState(() {
                    index = 0;
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
                    index = 1;
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
                      index = 2;
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
                    index = 3;
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
                      index = 4;
                      st = "Floor Store";
                    });
                  },
                  child: stepsContainer("step5")),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      index = 5;
                      st = "Bed Room";
                    },
                  );
                },
                child: stepsContainer("step6"),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 6;
                    st = "Basement";
                  });
                },
                child: Center(
                  child: stepsContainer("step7"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 7;
                    st = "BuiltUp";
                  });
                },
                child: stepsContainer("step8"),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
List Pages = [
  Requirement(),
  const Entrance(),
  LivingHall(),
  PantryDetail(),
  const FloorStore(),
  const StaticBedroomPage(),
  Basement(),
  const BuiltUp(),
  Payment()
];

class StepPages extends StatefulWidget {
  const StepPages({Key? key}) : super(key: key);
  static const namedRoute = "/stepages";

  @override
  State<StepPages> createState() => _StepPagesState();
}

class _StepPagesState extends State<StepPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(st!),
      body: SingleChildScrollView(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              index = 0;
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
                              index = 1;
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
                                index = 2;
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
                              index = 3;
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
                                index = 4;
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
                              index = 5;
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
                              index = 6;
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
                              index = 7;
                              st = "Built Up";
                            });
                          },
                          child: stepsContainer("step8"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                (context),
                                MaterialPageRoute(
                                    builder: ((context) => Payment())));
                            setState(() {});
                          },
                          child: stepsContainer("Payment"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Pages[index!],
            )
          ],
        ),
      ),
    );
  }
}
