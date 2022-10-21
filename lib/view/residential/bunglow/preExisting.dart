import 'dart:convert';

import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

var projects;

class PreExisting extends StatefulWidget {
  const PreExisting({super.key});

  @override
  State<PreExisting> createState() => _PreExistingState();
}

class _PreExistingState extends State<PreExisting> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    var response = await http.get(
        Uri.parse('http://192.168.0.99:8080/sdplserver/api/get-project/95'));
    final jsonResponse = jsonDecode(response.body);

    setState(() {
      projects = jsonResponse['projects'];
    });
    print(projects);
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
          child: projects != null
              ? ListView(
                  children: [
                    // for (var i = 0; i < projects.length; i++)
                    InkWell(
                      onTap: () {
                        Get.to(StepPages());
                      },
                      child: Card(
                        color: lightColor,
                        margin: EdgeInsets.symmetric(vertical: 2),
                        elevation: 5,
                        shadowColor: primaryColor,
                        child: Container(
                          height: 80,
                          child: Center(
                            child: ListTile(
                                leading: Icon(
                                  Icons.home,
                                  size: 45,
                                ),
                                title: projects == []
                                    ? CircularProgressIndicator()
                                    : headingFont(projects[0]['project_type']),
                                subtitle: projects == []
                                    ? CircularProgressIndicator()
                                    : Row(
                                        children: [
                                          requirementText(
                                              projects[0]['prefix']),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          requirementText(
                                              projects[0]['first_name']),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          requirementText(
                                              projects[0]['last_name'])
                                        ],
                                      ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(projects[0]['create_date']),
                                    Text(projects[0]['create_time']),
                                  ],
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
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(StepPages());
                        fetchData();
                      },
                      child: Card(
                        color: lightColor,
                        margin: EdgeInsets.symmetric(vertical: 3),
                        elevation: 5,
                        shadowColor: primaryColor,
                        child: Container(
                          height: 80,
                          child: Center(
                            child: ListTile(
                                leading: Icon(
                                  Icons.home,
                                  size: 45,
                                ),
                                title: projects == []
                                    ? CircularProgressIndicator()
                                    : headingFont(projects[0]['project_type']),
                                subtitle: projects == []
                                    ? CircularProgressIndicator()
                                    : Row(
                                        children: [
                                          requirementText(
                                              projects[1]['prefix']),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          requirementText(
                                              projects[1]['first_name']),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          requirementText(
                                              projects[1]['last_name'])
                                        ],
                                      ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(projects[1]['create_date']),
                                    Text(projects[1]['create_time']),
                                  ],
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
                    ),
                    Card(
                      color: lightColor,
                      margin: EdgeInsets.symmetric(vertical: 2),
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
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(projects[1]['create_date']),
                                  Text(projects[1]['create_time']),
                                ],
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