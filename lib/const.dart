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

//                             api                                        //


var baseUrl = 'http://sdplweb.com/sdpl/';
var imageUrl = 'http://sdplweb.com/sdpl/storage/app/public/';
var mainImage = "http://sdplweb.com/sdpl/api/get-bungalow-prestigious-recent-image";



List<dynamic> dataPrestigiousList = [];
List<dynamic> dataRecentList = [];
  
  Future<void> getPrestigious() async {
    try {
      var url = Uri.parse(mainImage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        
        dataPrestigiousList = jsonDecode(response.body)["prestigious_image"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getRecent() async {
    try {
      var url = Uri.parse(mainImage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        
        dataRecentList = jsonDecode(response.body)["recent_project_image"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

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

