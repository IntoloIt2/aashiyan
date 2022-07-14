import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




BottomNavigationBar customBottomNav() {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: iconColor,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.email,
            color: iconColor,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.add_circle_outline,
            color: iconColor,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.run_circle,
            color: iconColor,
          ),
          label: ""),
      BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: iconColor,
          ),
          label: ""),
    ],
  );
}

AppBar buildAppbar(String str) {
    return AppBar(
      title: Text(
        str,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }


//                            color        
            
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


Color textColor2 = HexColor("#735a10");
Color textColor = HexColor("#7e7e7e");
Color primaryColor = HexColor("#58A7CA");
Color lightColor = HexColor("#c4edf4");
Color color3 = HexColor("#d5e7ea");
Color iconColor = HexColor("#757574");


  SingleChildScrollView buildRow() {
    return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildContainer("Hotels"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("residental"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("Multiplex/mall"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("Interior Design"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("Commercial Showroom/Offices"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("Mix Use Buildings"),
                      ],
                    ),
                  );
  }
   SingleChildScrollView buildSteps() {
    return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildContainer("step1"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step2"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step3"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step4"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step5"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step6"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step7"),
                        const SizedBox(
                          width: 5,
                        ),
                        buildContainer("step8"),

                      ],
                    ),
                  );
  }

 BottomNavigationBar buildBottomNav() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: iconColor,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
              color: iconColor,
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: iconColor,
            ),
            label: ""),
      ],
    );
  }




Container buildContainer(String str) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0),
        borderRadius: const BorderRadius.all(
            Radius.circular(20.0) //         <--- border radius here
            ),
      ),
      child: Text(
        str,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

