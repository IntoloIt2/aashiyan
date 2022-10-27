// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:flutter/material.dart';

import '../../../const.dart';

class Payment extends StatelessWidget {
  int value = payDesFees;

  @override
  Widget build(BuildContext context) {
    var gst = 0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Aashiyan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: requirementText(
                  'Note: If your project will not be under company\'s working rules then your fees will be refunded under 3 days. '),
            ),
            Column(
              children: [
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('Total payable Advance'),
                        requirementText('$payDesFees'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('GST 18%'),
                        requirementText('${gst = payDesFees * 18 ~/ 100}'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        requirementText('Total'),
                        requirementText('${payDesFees + gst}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 43,
              color: primaryColor,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () {},
                  child: const Text('PAY',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: requirementText(
                  'Note:- Revision will be attained on office contact no. up to finalization of concept floor plan and 3D elevation.'),
            )
          ],
        ),
      ),
    );
  }
}
