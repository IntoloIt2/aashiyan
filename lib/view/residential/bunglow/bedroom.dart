import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:flutter/material.dart';

class BedRoom extends StatelessWidget {
  static const namedRoute = "/namedRoute";
  const BedRoom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Bedrooms"),
      body: Container(
        child: Column(
          children: [
            bungalowSteps(context),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Add a Bedroom',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Container(

            )
          ],
        ),
      ),
    );
  }
}
