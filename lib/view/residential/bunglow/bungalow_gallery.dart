// ignore_for_file: unused_import, prefer_typing_uninitialized_variables, avoid_print, sized_box_for_whitespace

import 'dart:convert';

import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/residential/bunglow/bungalow_detail.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

var categoryId;

class BungalowGallery extends StatefulWidget {
  const BungalowGallery({super.key});

  @override
  State<BungalowGallery> createState() => _BungalowGalleryState();
}

class _BungalowGalleryState extends State<BungalowGallery> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  var gallery;
  Future fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    categoryId = prefs.getInt('projectTypeId');
    var finalArt = await getGalleryAPI(categoryId!);
    setState(() {
      gallery = finalArt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: categoryId == BUNGALOW
            ? const Text('Bungalow Gallery')
            : const Text('Flat House Gallery'),
      ),
      body: Center(
        child: gallery == null
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Center(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.all(0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Card(
                                color: lightColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: requirementText('Gallery'),
                                )),
                            Card(
                                color: lightColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: requirementText(
                                      'Sample(Technical Drawing Book)'),
                                )),
                            Card(
                                color: lightColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: requirementText('Interested Next-->'),
                                )),
                            Card(
                                color: lightColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: requirementText('See More'),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        for (var i = 0; i < gallery.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
                              shadowColor: Colors.blueAccent,
                              elevation: 10,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(BungalowDetail(
                                          img_path: gallery[i]['img_path'],
                                          project_location: gallery[i]
                                              ['project_location'],
                                          description: gallery[i]
                                              ['description'],
                                          id: gallery[i]['id'],
                                        ));
                                        print(gallery[i]['id']);
                                      },
                                      child: Container(
                                        height: 225,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .95,
                                        child: gallery == []
                                            ? const CircularProgressIndicator()
                                            : Image.network(
                                                'https://sdplweb.com/sdpl/public/storage/${gallery[i]["img_path"]}',
                                                filterQuality:
                                                    FilterQuality.low,
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Container(
                                        child: gallery == []
                                            ? const CircularProgressIndicator()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: headingFont(gallery[i]
                                                        ['project_location']
                                                    .toString()
                                                    .toUpperCase()),
                                              ),
                                      ),
                                    )
                                  ]),
                            ),
                          ),
                      ],
                    ),
                  )
                ])),
              ),
      ),
    );
  }
}
