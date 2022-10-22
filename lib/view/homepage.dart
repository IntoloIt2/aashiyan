// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:aashiyan/components/contants.dart';

// ignore_for_file: sort_child_properties_last, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/hotels.dart';

import 'package:aashiyan/view/residential.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../components/project_category.dart';
import '../controller/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   getValidationData().whenComplete(() async {
  //     Timer(Duration(seconds: 2), () => (finalemail == null ? login('email', 'password', context): HomePage()));
  //   });
  // }

  // Future getValidationData() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainedEmail = SharedPreferences.getString('email');
  //   setState(() {
  //     finalemail = obtainedEmail!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Expanded(
          child: Scaffold(
              appBar: AppBar(
                title: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Aashiyan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      fontFamily: "Courgette-Regular",
                    ),
                  ),
                ),
                centerTitle: true,
                bottom: PreferredSize(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Premium Architecture Engineering",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height * 0.02,
                          fontFamily: "Courgette-Regular"),
                    ),
                  ),
                  preferredSize: const Size.fromHeight(10),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    projectCategory(),
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).pushNamed(Residential.namedRoute);
                      }),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              height: height * 0.35,
                              width: width * 0.9,
                              child: Image.asset(
                                "assets/images/Screen.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            // CustomPaint(
                            //   size: Size(
                            //       400,
                            //       (400 * 0.6666666666666666)
                            //           .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            //   painter: RPSCustomPainter(),
                            // ),
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.27,
                              child: Text(
                                "Residential",
                                style: TextStyle(fontSize: height * 0.032),
                              ),
                            ),
                            Positioned(
                              // top: height * 0.0,
                              bottom: height * 0.060,
                              height: height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Image.asset(
                                  "assets/images/resident_resize.jpg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                getGalleryAPI(HOSPITALITY);
                                Get.to(const Hotels());
                              },
                              child: polyContainer(
                                  context, "Projects\nand \nworks")),
                          InkWell(
                              onTap: () async {
                                await launch(
                                    "https://wa.me/${8109093551}?text=Hey! I'm inquiring about the apartment listing");
                              },
                              child:
                                  polyContainer(context, "Text\nyour \nneeds")),
                          polyContainer(context, "Built \nup \nArea"),
                          polyContainer(context, "Free \nQuotaion"),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Text("1"),
                            Text("2"),
                            Text("3"),
                            Text("4"),
                          ],
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                launch("tel://8109093551");
                              },
                              child: polyContainer(context, "contact")),
                          polyContainer(context, "start\napprox \nDetailing"),
                          polyContainer(context, "cost of \nproject"),
                          polyContainer(context, "pay"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Recent",
                                  style: TextStyle(
                                    color: textColor2,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: width * 0.4,
                                  child: FutureBuilder(
                                      future: homeRecent(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return CarouselSlider.builder(
                                            itemCount: homeRecentList.length,
                                            itemBuilder: (context, i, id) {
                                              return Container(
                                                height: 100,
                                                width: width * 0.45,
                                                child: Image.network(
                                                  imageUrl +
                                                      homeRecentList[i]
                                                          ["img_path"],
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 800),
                                              viewportFraction: 1,
                                            ),
                                          );
                                        }
                                      }),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Prestegious",
                                  style: TextStyle(
                                    color: textColor2,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 100,
                                  width: width * 0.4,
                                  child: FutureBuilder(
                                      future: homePrestigious(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Container(
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        } else {
                                          return CarouselSlider.builder(
                                            itemCount:
                                                homePrestigiousList.length,
                                            itemBuilder: (context, i, id) {
                                              return Container(
                                                height: 100,
                                                width: width * 0.45,
                                                child: Image.network(
                                                  imageUrl +
                                                      homePrestigiousList[i]
                                                          ["img_path"],
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                            options: CarouselOptions(
                                              autoPlay: true,
                                              enableInfiniteScroll: true,
                                              autoPlayAnimationDuration:
                                                  const Duration(
                                                      milliseconds: 800),
                                              viewportFraction: 1,
                                            ),
                                          );
                                        }
                                      }),
                                )
                              ],
                            )
                          ]),
                    ),
                    Text(
                      "Email : office@bsdplweb.com",
                      style: TextStyle(color: textColor, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Website :sdplweb.com",
                      style: TextStyle(color: textColor, fontSize: 16),
                    )
                  ],
                ),
              ),
              bottomNavigationBar: customBottomNav(context)),
        ),
        Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 1,
          child: const DefaultTextStyle(
            style: TextStyle(),
            child: Text(
              "SDPL (Shrikhande Designs Pvt Ltd) powered by Intolo India Pvt Ltd",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }

  Stack polyContainer(BuildContext context, String text) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width * 0.2,
          child: CustomPaint(
            size: Size(
              90,
              (90 * 1).toDouble(),
            ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: RPSCustomPolygon(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

// class RPSCustomPainter extends CustomPainter {
//   @override
//   void paint(
//     Canvas canvas,
//     Size size,
//   ) {
//     Paint paint0 = Paint()
//       ..color = lightColor
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//     Path path0 = Path();
//     path0.moveTo(size.width * 0.0498000, size.height * 0.4954250);
//     path0.cubicTo(
//         size.width * 0.0512400,
//         size.height * 0.5739750,
//         size.width * 0.1990600,
//         size.height * 0.8838250,
//         size.width * 0.2471600,
//         size.height * 0.8850000);
//     path0.cubicTo(
//         size.width * 0.3020600,
//         size.height * 0.8871500,
//         size.width * 0.7027400,
//         size.height * 0.8853000,
//         size.width * 0.7543200,
//         size.height * 0.8812250);
//     path0.cubicTo(
//         size.width * 0.8090000,
//         size.height * 0.8810500,
//         size.width * 0.9466000,
//         size.height * 0.5792000,
//         size.width * 0.9481400,
//         size.height * 0.5021000);
//     path0.cubicTo(
//         size.width * 0.9453800,
//         size.height * 0.4264000,
//         size.width * 0.8089600,
//         size.height * 0.1275750,
//         size.width * 0.7559600,
//         size.height * 0.1245750);
//     path0.cubicTo(
//         size.width * 0.7050000,
//         size.height * 0.1211000,
//         size.width * 0.3053600,
//         size.height * 0.1244000,
//         size.width * 0.2463000,
//         size.height * 0.1270750);
//     path0.cubicTo(
//         size.width * 0.2009200,
//         size.height * 0.1261750,
//         size.width * 0.0514000,
//         size.height * 0.4234750,
//         size.width * 0.0498000,
//         size.height * 0.4954250);
//     path0.close();
//     canvas.drawPath(path0, paint0);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = lightColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0066667, size.height * 0.5000000);
    path0.cubicTo(
        size.width * 0.0002000,
        size.height * 0.4100667,
        size.width * 0.2411333,
        size.height * 0.0110667,
        size.width * 0.3069556,
        size.height * 0.0090333);
    path0.cubicTo(
        size.width * 0.4052889,
        size.height * 0.0098667,
        size.width * 0.5877111,
        size.height * 0.0068000,
        size.width * 0.6860444,
        size.height * 0.0076333);
    path0.cubicTo(
        size.width * 0.7552000,
        size.height * 0.0060667,
        size.width * 0.9931333,
        size.height * 0.4105000,
        size.width * 0.9911111,
        size.height * 0.4966667);
    path0.cubicTo(
        size.width * 0.9920889,
        size.height * 0.5970000,
        size.width * 0.7505556,
        size.height * 0.9852000,
        size.width * 0.6914222,
        size.height * 0.9857000);
    path0.cubicTo(
        size.width * 0.5914222,
        size.height * 0.9857000,
        size.width * 0.4072667,
        size.height * 0.9856667,
        size.width * 0.3072667,
        size.height * 0.9856667);
    path0.cubicTo(
        size.width * 0.2439333,
        size.height * 0.9859000,
        size.width * 0.0050222,
        size.height * 0.5896667,
        size.width * 0.0066667,
        size.height * 0.5000000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPolygon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = color3
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.0498000, size.height * 0.4954250);
    path0.cubicTo(
        size.width * 0.0512400,
        size.height * 0.5739750,
        size.width * 0.1990600,
        size.height * 0.8838250,
        size.width * 0.2471600,
        size.height * 0.8850000);
    path0.cubicTo(
        size.width * 0.3020600,
        size.height * 0.8871500,
        size.width * 0.7027400,
        size.height * 0.8853000,
        size.width * 0.7543200,
        size.height * 0.8812250);
    path0.cubicTo(
        size.width * 0.8090000,
        size.height * 0.8810500,
        size.width * 0.9466000,
        size.height * 0.5792000,
        size.width * 0.9481400,
        size.height * 0.5021000);
    path0.cubicTo(
        size.width * 0.9453800,
        size.height * 0.4264000,
        size.width * 0.8089600,
        size.height * 0.1275750,
        size.width * 0.7559600,
        size.height * 0.1245750);
    path0.cubicTo(
        size.width * 0.7050000,
        size.height * 0.1211000,
        size.width * 0.3053600,
        size.height * 0.1244000,
        size.width * 0.2463000,
        size.height * 0.1270750);
    path0.cubicTo(
        size.width * 0.2009200,
        size.height * 0.1261750,
        size.width * 0.0514000,
        size.height * 0.4234750,
        size.width * 0.0498000,
        size.height * 0.4954250);
    path0.close();
    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
