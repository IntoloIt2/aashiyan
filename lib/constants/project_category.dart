import 'package:flutter/material.dart';
import 'steps_container.dart';

SingleChildScrollView projectCategory() {
  var singleChildScrollView = SingleChildScrollView(
    padding: const EdgeInsets.all(10),
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        stepsContainer("Hotels"),
        const SizedBox(
          width: 5,
        ),
        stepsContainer("residental"),
        const SizedBox(
          width: 5,
        ),
        stepsContainer("Multiplex/mall"),
        const SizedBox(
          width: 5,
        ),
        stepsContainer("Interior Design"),
        const SizedBox(
          width: 5,
        ),
        stepsContainer("Commercial Showroom/Offices"),
        const SizedBox(
          width: 5,
        ),
        stepsContainer("Mix Use Buildings"),
      ],
    ),
  );
  return singleChildScrollView;
}
