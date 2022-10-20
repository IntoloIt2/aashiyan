import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:aashiyan/controller/auth_controller.dart';
import 'package:aashiyan/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

var email;

class _ProfileState extends State<Profile> {
  intState() {
    super.initState();
  }

  Future<Null> shared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('loginDetails');
    prefs.getString('email');
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
                        'Name: $email',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            child: const Text(
                              'Edit Details',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              print(email);
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          )
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
                      const Icon(Icons.perm_device_information),
                      requirementText('Feedback')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(Icons.info),
                      requirementText('About Us')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {
                        logout();
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
