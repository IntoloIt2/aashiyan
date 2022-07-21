import 'package:aashiyan/view/residential/bunglow/bedroom.dart';
import 'package:flutter/material.dart';

import '../../../components/app_bar.dart';
import '../../../components/bungalow_steps.dart';
import '../../../const.dart';

class BedroomPage extends StatefulWidget {
  static const namedRoute = "/bedroompage";
  @override
  _BedroomPageState createState() => _BedroomPageState();
}

class _BedroomPageState extends State<BedroomPage> {
  List<BedRoom> bedroomList = [];

//Define the dynamic list

  void removeServiceCard(index) {
    setState(() {
      bedroomList.remove(index);
    });
  }

  void addServiceCard() {
    setState(() {
      bedroomList.add(BedRoom(
        bedroomList.length,
        removeServiceCard,
      ));
    });
  }

  @override
  void initState() {
    addServiceCard(); //Initialize with 1 item
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("Bedrooms"),
      body: Column(
        children: [
          bungalowSteps(context),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: height * 0.06,
                  margin: EdgeInsets.symmetric(horizontal: width * 0.3),
                  child: OutlinedButton(
                      onPressed: addServiceCard, child: Text("Add a bedroom")),
                ),
                ...bedroomList,
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: height * 0.04,
              decoration: BoxDecoration(
                  color: buttonColor, borderRadius: BorderRadius.circular(4)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text(
                "save and continue",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          )
        ],
      ),
    );
  }
}
