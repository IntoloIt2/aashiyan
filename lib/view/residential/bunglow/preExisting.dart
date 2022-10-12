import 'dart:convert';

import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PreExisting extends StatefulWidget {
  const PreExisting({super.key});

  @override
  State<PreExisting> createState() => _PreExistingState();
}

class _PreExistingState extends State<PreExisting> {
  var gallery;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var response = await http.get(Uri.parse(''));
    final jsonResponse = jsonDecode(response.body);

    setState(() {
      gallery = jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bungalow Existing Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: gallery == null
              ? ListView(
                  children: [
                    Card(
                      color: lightColor,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      elevation: 10,
                      shadowColor: primaryColor,
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                              leading: Icon(
                                Icons.home,
                                size: 45,
                              ),
                              title: headingFont('House/Duplex'),
                              subtitle: requirementText('Name'),
                              trailing: Icon(
                                Icons.calendar_month,
                                size: 45,
                              )
                              // Row(
                              //   children: [
                              //     Text('date'),
                              //     Text('time'),
                              //   ],
                              // ),
                              ),
                        ),
                      ),
                    ),
                    Card(
                      color: lightColor,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      elevation: 10,
                      shadowColor: primaryColor,
                      child: Container(
                        height: 80,
                        child: Center(
                          child: ListTile(
                              leading: Icon(
                                Icons.bungalow,
                                size: 45,
                              ),
                              title: headingFont('Bungalow'),
                              subtitle: requirementText('Name'),
                              trailing: Icon(
                                Icons.calendar_month,
                                size: 45,
                              )
                              // Row(
                              //   children: [
                              //     Text('date'),
                              //     Text('time'),
                              //   ],
                              // ),
                              ),
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text('You didn\'t have made any projects,'),
                    Text(
                      'Make One',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
