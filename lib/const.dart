import 'package:flutter/material.dart';

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

// AppBar buildAppbar(String str) {
//   return AppBar(
//     title: Text(
//       str,
//       style: const TextStyle(
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   );
// }

//color

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

Color buttonColor = HexColor("#0369a1");
Color checkColor = HexColor("#48494b");
Color textColor2 = HexColor("#735a10");
Color textColor = HexColor("#7e7e7e");
Color primaryColor = HexColor("#58A7CA");
Color lightColor = HexColor("#c4edf4");
Color requirementColor = HexColor("#dfeaea");
Color color3 = HexColor("#d5e7ea");
Color iconColor = HexColor("#757574");

// SingleChildScrollView buildRow() {
//   return SingleChildScrollView(
//     padding: EdgeInsets.all(10),
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: [
//         buildContainer("Hotels"),
//         const SizedBox(
//           width: 5,
//         ),
//         buildContainer("residental"),
//         const SizedBox(
//           width: 5,
//         ),
//         buildContainer("Multiplex/mall"),
//         const SizedBox(
//           width: 5,
//         ),
//         buildContainer("Interior Design"),
//         const SizedBox(
//           width: 5,
//         ),
//         buildContainer("Commercial Showroom/Offices"),
//         const SizedBox(
//           width: 5,
//         ),
//         buildContainer("Mix Use Buildings"),
//       ],
//     ),
//   );
// }

// SingleChildScrollView buildSteps(BuildContext context) {
//   return SingleChildScrollView(
//     padding: EdgeInsets.all(10),
//     scrollDirection: Axis.horizontal,
//     child: Row(
//       children: [
//         InkWell(onTap: () {}, child: buildContainer("Step 1")),
//         const SizedBox(
//           width: 10,
//         ),
//         InkWell(
//           onTap: () {
//             Navigator.of(context).pushNamed(Entrance.namedRoute);
//           },
//           child: buildContainer("Step 2"),
//         ),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("Step 3"),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("step4"),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("step5"),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("step6"),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("step7"),
//         const SizedBox(
//           width: 10,
//         ),
//         buildContainer("step8"),
//       ],
//     ),
//   );
// }

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

// Container buildContainer(String str) {
//   return Container(
//     padding: EdgeInsets.only(left: 5, bottom: 4, top: 3, right: 5),
//     // padding: const EdgeInsets.all(5),

//     decoration: BoxDecoration(
//       border: Border.all(width: 1.0),
//       borderRadius: const BorderRadius.all(
//           Radius.circular(5) //         <--- border radius here
//           ),
//     ),
//     child: Text(
//       str,
//       style: const TextStyle(
//         fontSize: 14,
//       ),
//     ),
//   );
// }
