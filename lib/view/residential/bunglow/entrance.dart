import 'package:aashiyan/constants/bungalow_steps.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../constants/app_bar.dart';

class Entrance extends StatelessWidget {
  const Entrance({Key? key}) : super(key: key);
  static const namedRoute = "/entrance";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Entrance"),
      body: Column(
        children: [
          bungalowSteps(context),
        ],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
