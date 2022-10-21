// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, use_build_context_synchronously, sized_box_for_whitespace

import 'dart:convert';

import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/components/project_category.dart';
import 'package:aashiyan/controller/api_controller.dart';

import 'package:aashiyan/view/residential/bunglow/bungalow_gallery.dart';
import 'package:aashiyan/view/residential/bunglow/preExisting.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/app_bar.dart';
import '../../../controller/api_services.dart';

var bungalow_count;

class Bunglow extends StatefulWidget {
  // Bunglow({Key? key}) : super(key: key);

  static const namedRoute = "/bunglow";

  @override
  State<Bunglow> createState() => _BunglowState();
}

class _BunglowState extends State<Bunglow> {
  final ApiController cont = Get.put(ApiController());

  Future<void> showMaxProjectPremiumDialogue(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("To move Further with another Project requirement"),
        content: Column(mainAxisSize: MainAxisSize.min, children: const [
          Text(
              "1. If you want to create more project up to 200, kindly purchase license copy with the payment of 10000 rupees+Gst. Go to payment option down below."),
          SizedBox(
            height: 15,
          ),
          Text(
              "2. If you want to have similar app with your customization, name and style kindly reach out to us on +918109093551 or by the call option down below."),
        ]),
        actions: <Widget>[
          TextButton(onPressed: (() {}), child: const Text("CALL")),
          TextButton(onPressed: (() {}), child: const Text("PAYMENT"))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

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
                    Get.to(() => PreExisting());
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
                    Get.to(const BungalowGallery());
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
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    String? resultData = prefs.getString('userData');

                    var decodedJson;
                    if (resultData != null) {
                      decodedJson = jsonDecode(resultData);
                      if (decodedJson['data'] != null) {
                        bungalow_count = await cont.projectCount(
                            decodedJson['data'], decodedJson['data']['id']);
                      }
                    }

                    if (decodedJson != null
                        ? decodedJson['status'] == 200 &&
                                decodedJson['data'] != null
                            ? decodedJson['data']['id'] != null
                                ? bungalow_count != null
                                    ? bungalow_count <= 1
                                        ? true
                                        : false
                                    : false
                                : false
                            : false
                        : false) {
                      Navigator.of(context).pushNamed(StepPages.namedRoute);
                      cont.getData();
                      cont.printData;
                    } else {
                      showMaxProjectPremiumDialogue(context);
                    }
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
