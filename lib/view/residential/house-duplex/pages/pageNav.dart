import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:matcher/matcher.dart';
import '../../../../components/steps_container.dart';
import '../../bunglow/requirement.dart';
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
  // int? index = 0;
  List Pages = [
    Step_1(),
    Step_2(),
    Step_3(),
    Step_4(),
    Step_5(),
    Step_6(),
    Step_7()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        // appBar: appBar(st!),
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
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
                    SizedBox(
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
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 3')),
                    ),
                    SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 3;
                              st = "Pantry";
                            });
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 4')),
                    ),
                    SizedBox(
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
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 5')),
                    ),
                    SizedBox(
                      height: 5,
                      width: 2,
                    ),
                    Material(
                      // elevation: 5,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              index = 5;
                              st = "Bed Room";
                            });
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 6')),
                    ),
                    SizedBox(
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
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 7')),
                    ),
                    SizedBox(
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
                            // Navigator.pushNamed(context, );
                          },
                          child: houseStepsContainer('Step 8')),
                    ),
                    SizedBox(
                      height: 5,
                      width: 2,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Pages[index!],
            )
          ],
        ),
      ),
    );
  }
}
