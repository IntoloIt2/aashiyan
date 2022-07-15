import 'package:aashiyan/constants/bungalow_steps.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../constants/app_bar.dart';

class Requirement extends StatelessWidget {
  static const namedRoute = "/intrestedNext";

  const Requirement({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Requirement"),
      body: Column(
        children: [
          bungalowSteps(context),
        ],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
