import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/bunglow.dart';
import 'package:aashiyan/view/residential/house-duplex/houseduplex.dart';
import 'package:aashiyan/view/residential/house-duplex/providers/residential_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../components/app_bar.dart';
import '../components/project_category.dart';
import '../controller/api_services.dart';
import '../controller/auth_controller.dart';

class Residential extends StatefulWidget {
  const Residential({Key? key}) : super(key: key);
  static const namedRoute = '/residential';

  @override
  State<Residential> createState() => _ResidentialState();
}

class _ResidentialState extends State<Residential> {
  @override
  Widget build(BuildContext context) {
    // List dialog = [

    // ]
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var provider = Provider.of<ResidentialProvider>(context, listen: true);
    return Scaffold(
      appBar: appBar("Residential"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            projectCategory(),
            Container(
              width: width * 1,
              height: height * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(Bunglow.namedRoute);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: height * 1,
                          width: width * 0.5,
                          child: Image.asset("assets/images/Screen.png"),
                        ),
                        Positioned(
                          height: height * 0.32,
                          width: width * 0.32,
                          child: Center(
                              child:
                                  Image.asset("assets/images/ragrawalji.jpg")),
                        ),
                        Positioned(
                          bottom: height * 0.22,
                          child: Text(
                            "Bunglow",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).pushNamed(HouseDuplex.namedRoute);
                      var getProjectGroupId =
                          await provider.getProjectGroupData();
                      // print("getProjectGroupId==");
                      // print(getProjectGroupId);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          height: height * 1,
                          width: width * 0.5,
                          child: Image.asset("assets/images/Screen.png"),
                        ),
                        Positioned(
                          height: height * 0.32,
                          width: width * 0.32,
                          child: Center(
                              child:
                                  Image.asset("assets/images/ragrawalji.jpg")),
                        ),
                        Positioned(
                          bottom: height * 0.22,
                          child: Text(
                            "Houses/Duplex",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.018,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width * 1,
              height: height * 0.04,
              margin: const EdgeInsets.all(10),
              color: primaryColor,
              child: const Center(
                  child: Text(
                "Prestigious",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Container(
              width: width * 1,
              child: FutureBuilder(
                  future: residentialPrestigious(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return CarouselSlider.builder(
                        itemCount: ResidentialPrestigiousList.length,
                        itemBuilder: (context, i, id) {
                          return Card(
                            child: SizedBox(
                              height: height * 0.4,
                              width: width * 0.9,
                              child: Image.network(
                                imageUrl +
                                    ResidentialPrestigiousList[i]["img_path"],
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      );
                    }
                  }),
            ),
            Container(
              width: width * 1,
              height: height * 0.04,
              margin: const EdgeInsets.all(10),
              color: primaryColor,
              child: const Center(
                  child: Text(
                "Recents",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Container(
              width: width * 1,
              child: FutureBuilder(
                  future: residentailRecent(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return CarouselSlider.builder(
                        itemCount: ResidentialdataRecentList.length,
                        itemBuilder: (context, i, id) {
                          return Container(
                            height: height * 0.4,
                            width: width * 0.9,
                            child: Image.network(
                              imageUrl +
                                  ResidentialdataRecentList[i]["img_path"],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 1,
                        ),
                      );
                    }
                  }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
              icon: IconButton(
                icon: Icon(
                  Icons.person,
                  color: iconColor,
                ),
                onPressed: () {
                  showDialog(
                    builder: (context) => loginDialog(context),
                    context: context,
                  );
                },
              ),
              label: ""),
        ],
      ),
    );
  }
}
