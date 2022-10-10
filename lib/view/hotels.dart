import 'dart:convert';

import 'package:aashiyan/view/residential/bunglow/bungalow_detail.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Hotels extends StatefulWidget {
  const Hotels({super.key});

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  initState() {
    super.initState();

    fetchData();
  }

  var gallery;
  Future<void> fetchData() async {
    var response =
        await http.get(Uri.parse('http://sdplweb.com/sdpl/api/get-gallery/4'));
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
        title: headingFont('Hospitality'),
      ),
      body: Center(
        child: gallery == null
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(
                children: [
                  for (var i = 0; i < gallery.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(BungalowDetail(
                            img_path: gallery[i]['img_path'],
                            project_location: gallery[i]['project_location'],
                            description: gallery[i]['description'],
                            id: gallery[i]['id'],
                          ));
                        },
                        child: Card(
                          shadowColor: Colors.blueAccent,
                          elevation: 10,
                          child: Column(
                            children: [
                              Container(
                                child: gallery == []
                                    ? const CircularProgressIndicator()
                                    : Image.network(
                                        'https://sdplweb.com/sdpl/public/storage/${(gallery[i]['img_path'])}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  child: gallery == []
                                      ? const CircularProgressIndicator()
                                      : headingFont(
                                          gallery[i]['img_title'].toString()),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 5.0, bottom: 10),
                                child: Container(
                                  child: gallery == []
                                      ? const CircularProgressIndicator()
                                      : headingFont(gallery[i]
                                              ['project_location']
                                          .toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                ],
              )),
      ),
    );
  }
}
