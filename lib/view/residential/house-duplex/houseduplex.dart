import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/project_category.dart';
import 'package:aashiyan/view/residential/house-duplex/pages/pageNav.dart';
import 'package:flutter/material.dart';
import 'package:aashiyan/const.dart';
import 'package:get/get.dart';

class HouseDuplex extends StatelessWidget {
  const HouseDuplex({super.key});
  static const namedRoute = '/house-duplex';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar("House Duplex"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          projectCategory(),
          (Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/existing.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: Text(
                "Pre-existing",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500),
              ),
            ),
          )),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/gallery_icon.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: Text(
                "Gallery",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/pdf_icon.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: Text(
                "Sample Drawing Book",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PageNav.namedRoute);
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Container(
                  child: Image.asset(
                    'assets/images/arrow.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                title: Text(
                  "Interested Next-->",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Card(
              elevation: 2,
              child: ListTile(
                leading:
                    Container(child: Text("Our Prestigious Bungalow Projects")),
                // title: ,
              ))
        ],
      )),
    );
  }
}
