// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:aashiyan/components/contants.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/bungalow_detail.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class InteriorDesign extends StatefulWidget {
  const InteriorDesign({super.key});

  @override
  State<InteriorDesign> createState() => _InteriorDesignState();
}

class _InteriorDesignState extends State<InteriorDesign> {
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  var gallery;
  Future fetchData() async {
    var response =
        await http.get(Uri.parse('http://sdplweb.com/sdpl/api/get-gallery/8'));
    final jsonResponse = jsonDecode(response.body);

    final finalArt = jsonResponse['gallery'];

    setState(() {
      gallery = finalArt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interior Design'),
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
                          Card(
                            elevation: 5,
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
                                        description: gallery[i]['description'],
                                        id: gallery[i]['id'],
                                      ));
                                    },
                                    child: Container(
                                      child: gallery == []
                                          ? const CircularProgressIndicator()
                                          : Image.network(
                                              'https://sdplweb.com/sdpl/public/storage/${gallery[i]["img_path"]}',
                                              filterQuality: FilterQuality.none,
                                            ),
                                    ),
                                  ),
                                  Container(
                                    child: gallery == []
                                        ? const CircularProgressIndicator()
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: headingFont(
                                                gallery[i]['project_location']),
                                          ),
                                  )
                                ]),
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
