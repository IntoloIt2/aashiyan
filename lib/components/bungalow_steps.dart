import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:aashiyan/view/residential/bunglow/floorstore.dart';
import 'package:aashiyan/view/residential/bunglow/livinghall.dart';
import 'package:aashiyan/view/residential/bunglow/pantrydetail.dart';
import 'package:flutter/material.dart';
import '../view/residential/bunglow/entrance.dart';
import 'steps_container.dart';

SingleChildScrollView bungalowSteps(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(10),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        InkWell(onTap: () {}, child: stepsContainer("Step 1")),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(Entrance.namedRoute);
          },
          child: stepsContainer("Step 2"),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(LivingHall.namedRoute);
            },
            child: stepsContainer("Step 3")),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(PantryDetail.namedRoute);
          },
          child: stepsContainer("step4"),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(FloorStore.namedRoute);
            },
            child: stepsContainer("step5")),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {
           Navigator.of(context).pushNamed(BedRoom.namedRoute);
          },
          child: stepsContainer("step6"),),
        const SizedBox(
          width: 10,
        ),
        stepsContainer("step7"),
        const SizedBox(
          width: 10,
        ),
        stepsContainer("step8"),
      ],
    ),
  );
}
