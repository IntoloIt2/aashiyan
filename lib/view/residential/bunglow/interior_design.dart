import 'dart:convert';

import 'package:aashiyan/components/contants.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/components/sample_book_pdf.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/residential/bunglow/bungalow_detail.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InteriorDesign extends StatefulWidget {
  const InteriorDesign({super.key});

  @override
  State<InteriorDesign> createState() => _InteriorDesignState();
}

class _InteriorDesignState extends State<InteriorDesign> {
  var gallery;
  bool isloading = false;
  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    gallery = await getGalleryAPI(BUNGALOW);
    setState(() {});
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
                            InkWell(
                              onTap: () {},
                              child: Card(
                                  color: lightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: requirementText('Gallery'),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(SampleBookPdf());
                              },
                              child: Card(
                                  color: lightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: requirementText(
                                        'Sample(Technical Drawing Book)'),
                                  )),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Card(
                                  color: lightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child:
                                        requirementText('Interested Next-->'),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                launch('https://sdplweb.com/');
                              },
                              child: Card(
                                  color: lightColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: requirementText('See More'),
                                  )),
                            )
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
                              shadowColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0)),
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
                                                'https://sdplweb.com/sdpl/public/storage/${(gallery[i]['img_path'])}',
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                    ),
                                    Container(
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