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
        stepsContainer("Step 3"),
        const SizedBox(
          width: 10,
        ),
        stepsContainer("step4"),
        const SizedBox(
          width: 10,
        ),
        stepsContainer("step5"),
        const SizedBox(
          width: 10,
        ),
        stepsContainer("step6"),
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
