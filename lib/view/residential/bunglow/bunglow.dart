import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/components/project_category.dart';
import 'package:aashiyan/controller/api_controller.dart';

import 'package:aashiyan/view/residential/bunglow/bungalow_gallery.dart';
import 'package:aashiyan/view/residential/bunglow/preExisting.dart';
// import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
// import 'package:http/http.dart';

import '../../../components/app_bar.dart';
import '../../../controller/api_services.dart';

class Bunglow extends StatelessWidget {
  Bunglow({Key? key}) : super(key: key);
  static const namedRoute = "/bunglow";
  final ApiController cont = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBar("Bunglow"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            projectCategory(),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PreExisting(),
                        ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        child: Image.asset("assets/images/existing.png"),
                      ),
                      title: Text(
                        "Pre-existing",
                        style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.to(BungalowGallery());
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/gallery_icon.png"),
                      title: Text(
                        "Gallery",
                        style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Image.asset("assets/images/pdf_icon.png"),
                    title: Text(
                      "sample Drawing book",
                      style: TextStyle(
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(StepPages.namedRoute);
                    cont.getData();
                    cont.printData;
                  },
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/arrow.png"),
                      title: Text(
                        "Intrested-next",
                        style: TextStyle(
                          fontSize: height * 0.025,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text(
                              "Our pretigious Bunglow Projects",
                              style: TextStyle(
                                  fontSize: height * 0.022,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "see more",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: height * 0.022,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * 1,
                        child: FutureBuilder(
                            future: getPrestigious(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                return CarouselSlider.builder(
                                  itemCount: bunglowPagePrestigiousList.length,
                                  itemBuilder: (context, i, id) {
                                    return Card(
                                      child: SizedBox(
                                        height: height * 0.4,
                                        width: width * 0.9,
                                        child: Image.network(
                                          imageUrl +
                                              bunglowPagePrestigiousList[i]
                                                  ["img_path"],
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
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Bunglow Projects",
                              style: TextStyle(
                                  fontSize: height * 0.022,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "see more",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: height * 0.022,
                                  fontWeight: FontWeight.w900),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * 1,
                        child: FutureBuilder(
                            future: getRecent(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              } else {
                                return CarouselSlider.builder(
                                  itemCount: bunglowPageRecentList.length,
                                  itemBuilder: (context, i, id) {
                                    return Container(
                                      height: height * 0.4,
                                      width: width * 0.9,
                                      child: Image.network(
                                        imageUrl +
                                            bunglowPageRecentList[i]
                                                ["img_path"],
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
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: buildBottomNav(),
    );
  }
}
