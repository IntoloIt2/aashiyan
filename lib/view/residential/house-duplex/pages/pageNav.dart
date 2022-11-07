// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../../../components/steps_container.dart';
import '../pages/index.dart';

int? index = 0;
String? st = "Requirement";

class PageNav extends StatefulWidget {
  const PageNav({super.key});
  static const namedRoute = '/pageNav';

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  List Pages = [
    Step_1(),
    Step_2(),
    Step_3(),
    Step_4(),
    const Step_5(),
    const Step_6(),
    const Step_7()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          st!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 0;
                              st = "Requirement";
                            });
                          },
                          child: houseStepsContainer('Step 1')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 0,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 1;
                              st = "Entrance";
                            });
                          },
                          child: houseStepsContainer('Step 2')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 2;
                              st = "Living Hall";
                            });
                          },
                          child: houseStepsContainer('Step 3')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 3;
                              st = "Floor Store";
                            });
                          },
                          child: houseStepsContainer('Step 4')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 4;
                              st = "Bed Room";
                              // st = "Floor Store";
                            });
                          },
                          child: houseStepsContainer('Step 5')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 5;
                              st = "Basement";
                            });
                          },
                          child: houseStepsContainer('Step 6')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 6;
                              st = "Basement";
                            });
                          },
                          child: houseStepsContainer('Step 7')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 7;
                              st = "Built Up";
                            });
                          },
                          child: houseStepsContainer('Step 8')),
                    ),
                    const SizedBox(
                      height: 5,
                      width: 2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Pages[index!],
            )
          ],
        ),
      ),
    );
  }
}
