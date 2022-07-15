import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../components/app_bar.dart';

class Entrance extends StatelessWidget {
  const Entrance({Key? key}) : super(key: key);
  static const namedRoute = "/entrance";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Entrance"),
      body: Column(
        children: [bungalowSteps(context), lableText("Name")],
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
