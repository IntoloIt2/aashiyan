import 'dart:convert';

import 'package:aashiyan/components/contants.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BungalowDetail extends StatefulWidget {
  String img_path;
  String description;
  String project_location;
  int id;

  BungalowDetail({
    super.key,
    required this.img_path,
    required this.description,
    required this.project_location,
    required this.id,
  });

  @override
  State<BungalowDetail> createState() => _BungalowDetailState();
}

class _BungalowDetailState extends State<BungalowDetail> {
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  var project_gallery;
  Future<void> fetchData() async {
    var response = await http.get(Uri.parse(
        'http://sdplweb.com/sdpl/api/get-project-gallery/${widget.id}'));
    final jsonResponse = jsonDecode(response.body);
    final finalArt = jsonResponse['project_gallery'];
    setState(() {
      project_gallery = finalArt;
    });
    print(project_gallery);
  }

  List gallery = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ashiyaan',
          style: TextStyle(),
        ),
      ),
      body: Center(
        child: project_gallery == null
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: CarouselSlider.builder(
                                itemCount: project_gallery.length,
                                itemBuilder: ((context, index, int i) {
                                  return Container(
                                      height: 225,
                                      width: MediaQuery.of(context).size.width,
                                      child: project_gallery == []
                                          ? CircularProgressIndicator()
                                          : Image.network(
                                              'https://sdplweb.com/sdpl/public/storage/${project_gallery[index]['project_gallery_img_path']}',
                                              filterQuality:
                                                  FilterQuality.medium,
                                              fit: BoxFit.fill,
                                            ));
                                }),
                                options: CarouselOptions(
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 800))),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (var i = 0;
                                      i < project_gallery.length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 70,
                                          width: 100,
                                          child: project_gallery == []
                                              ? CircularProgressIndicator()
                                              : Image.network(
                                                  'https://sdplweb.com/sdpl/public/storage/${project_gallery[i]['project_gallery_img_path']}',
                                                  fit: BoxFit.cover,
                                                )),
                                    ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            child: gallery == []
                                ? CircularProgressIndicator()
                                : headingFont(widget.project_location
                                    .toString()
                                    .toUpperCase())),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: gallery == []
                              ? CircularProgressIndicator()
                              : requirementText(widget.description.toString()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}