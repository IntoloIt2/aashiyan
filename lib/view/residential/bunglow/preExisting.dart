import 'dart:convert';
import 'dart:ffi';

import 'package:aashiyan/components/bungalow_steps.dart';
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:aashiyan/view/residential/house-duplex/pages/pageNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../components/constant.dart';
import '../../../utils/helpers.dart';

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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('userData');
    var decJson;
    var userId;

    if (userData != null) {
      decJson = jsonDecode(userData);
      if (decJson['data'] != null) {
        userId = decJson['data']['id'];
      }
    }

    var response = await http
        .get(Uri.parse("${dotenv.env['APP_URL']}get-project/$userId"));
    final jsonResponse = jsonDecode(response.body);
    print('jsonResponse==');
    print(jsonResponse);
    setState(() {
      projects = jsonResponse['projects'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Existing Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: projects != null
                ? projects.length > 0
                    ? Column(
                        children: <Widget>[
                          for (var i = 0; i < projects.length; i++)
                            InkWell(
                              onTap: () {
                                setProjectId(projects[i]['id']);
                                projects[i]['project_type_id'] == BUNGALOW
                                    ? Get.to(() => const StepPages())
                                    : Get.to(() => const PageNav());
                              },
                              child: Card(
                                color: lightColor,
                                margin: const EdgeInsets.symmetric(vertical: 2),
                                elevation: 5,
                                shadowColor: primaryColor,
                                child: Container(
                                  height: 80,
                                  child: Center(
                                    child: ListTile(
                                        leading: const Icon(
                                          Icons.home,
                                          size: 45,
                                        ),
                                        title: projects == []
                                            ? const CircularProgressIndicator()
                                            : headingFont(
                                                projects[i]['project_type']),
                                        subtitle: projects == []
                                            ? const CircularProgressIndicator()
                                            : Row(
                                                children: [
                                                  requirementText(
                                                      projects[i]['prefix']),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  requirementText(projects[i]
                                                      ['first_name']),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  requirementText(
                                                      projects[i]['last_name']),
                                                  Text(projects[i]['id']
                                                      .toString())
                                                ],
                                              ),
                                        trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(projects[i]['create_date']),
                                            Text(projects[i]['create_time']),
                                          ],
                                        )),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : projects == null
                        ? CircularProgressIndicator()
                        : Column(
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
                          )
                : null,
          ),
        ),
      ),
    );
  }
}
