import 'package:aashiyan/components/forms.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';
import '../../../components/app_bar.dart';

class Entrance extends StatefulWidget {
  const Entrance({Key? key}) : super(key: key);
  static const namedRoute = "/entrance";

  @override
  State<Entrance> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  List<String>? floors = ["select", "1(G)", "2(G+1)", "3(G+3)", "more"];
  String? selectedFloor = 'select';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Entrance"),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                requirementText("No. of\nFloors"),
                DropdownButton<String>(items: floors!.map((it)=>DropdownMenuItem<String>(
                  value: it,
                  child: Text(it))).toList(),
                   onChanged:(it)=> setState(() {
                     selectedFloor = it;
                   }))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
