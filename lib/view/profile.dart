// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';

import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var decodedJson;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<dynamic> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? resultData = prefs.getString('userData');
    decodedJson = jsonDecode(resultData!);
    print('decodedJson==');
    print(decodedJson);
  }

  Future<String?> showLogoutDialogue(context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Logout!'),
        content: const Text("Do You want to logout!"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
              onPressed: () {
                logout();
                Navigator.pop(context, 'Ok');
              },
              child: const Text('ok')),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Column(
        children: [
          Card(
            color: lightColor,
            margin: const EdgeInsets.all(10.0),
            elevation: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        decodedJson != null
                            ? decodedJson['data']['email'] != null
                                ? "${decodedJson['data']['email']}"
                                : ''
                            : '',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // TextButton(
                          //   child: const Text(
                          //     'Edit Details',
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 20,
                          //         fontWeight: FontWeight.bold),
                          //   ),
                          //   onPressed: () {},
                          // ),
                          const SizedBox(
                            width: 5,
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(Icons.edit),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 90,
                    width: 90,
                    child: Icon(
                      Icons.person,
                      size: 75,
                      color: iconColor,
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              color: lightColor,
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.trending_up_outlined),
                        Text('Project\'s Progress '),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.watch_later_outlined),
                        Text('Your Activity'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.person_add),
                        Text('Invite Friend'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.settings),
                        Text('Settings'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: const [
                        Icon(Icons.help),
                        Text('Help'),
                      ],
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.chat_bubble_rounded),
                      requirementText('Feedback')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.circle_outlined),
                      requirementText('About Us')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        showLogoutDialogue(context);
                      },
                      child: requirementText('Log Out')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}