import 'package:flutter/material.dart';

import '../../../const.dart';

class Requirement extends StatelessWidget {
  static const namedRoute = "/intrestedNext";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("Requirement"),
      body: Column(
        children: [
          buildSteps(context),
          ],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
