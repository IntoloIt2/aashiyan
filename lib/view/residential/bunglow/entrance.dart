import 'package:flutter/material.dart';

import '../../../const.dart';

class Entrance extends StatelessWidget {
  const Entrance({Key? key}) : super(key: key);
 static const namedRoute = "/entrance";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar("Entrance"),
      body: Column(
        children: [
          buildSteps(context),
        ],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
