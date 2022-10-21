// ignore_for_file: library_prefixes, non_constant_identifier_names, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, avoid_print, unused_local_variable, avoid_unnecessary_containers, use_build_context_synchronously

import 'dart:convert';

import 'package:aashiyan/components/app_bar.dart';
import 'package:aashiyan/components/contants.dart';
import 'package:aashiyan/components/project_category.dart';
import 'package:aashiyan/view/residential/house-duplex/pages/pageNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../../../controller/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../bunglow/preExisting.dart';

var house_count;

class HouseDuplex extends StatefulWidget {
  static const namedRoute = '/house-duplex';
  @override
  State<HouseDuplex> createState() => _HouseDuplexState();
}

class _HouseDuplexState extends State<HouseDuplex> {
// const HouseDuplex({super.key});

  Future<void> showMaxProjectPremiumDialogue(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("To move Further with another Project requirement"),
        content: Column(mainAxisSize: MainAxisSize.min, children: const [
          Text(
              "1. If you want to create more project up to 200, kindly purchase license copy with the payment of 10000 rupees+Gst. Go to payment option down below."),
          SizedBox(
            height: 15,
          ),
          Text(
              "2. If you want to have similar app with your customization, name and style kindly reach out to us on +918109093551 or by the call option down below."),
        ]),
        actions: <Widget>[
          TextButton(
              onPressed: (() {
                final Uri launchUri = Uri(
                  scheme: 'tel',
                  path: PHONE_NO,
                );
                UrlLauncher.launchUrl(launchUri,
                    mode: LaunchMode.platformDefault);
              }),
              child: const Text("CALL")),
          TextButton(onPressed: (() {}), child: const Text("PAYMENT"))
        ],
      ),
    );
  }

  Future<dynamic> projectCount(data, id) async {
    try {
      if (data != null) {
        final temp = await http
            .get(Uri.parse("${dotenv.env['APP_URL']}project-count/$id"));
        final response = json.decode(temp.body);
        setState(() {
          house_count = response["house_count"];
        });
        return house_count;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: appBar("House Duplex"),
      body: SingleChildScrollView(
          child: Column(
        children: [
          projectCategory(),
          (Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/existing.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PreExisting(),
                      ));
                },
                child: Text(
                  "Pre-existing",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          )),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/gallery_icon.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: Text(
                "Gallery",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Card(
            elevation: 2,
            child: ListTile(
              leading: Container(
                child: Image.asset(
                  'assets/images/pdf_icon.png',
                  width: 45,
                  height: 45,
                ),
              ),
              title: Text(
                "Sample Drawing Book",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              String? resultData = prefs.getString('userData');
              var decodedJson;
              if (resultData != null) {
                decodedJson = jsonDecode(resultData);

                if (decodedJson['data'] != null) {
                  house_count = await projectCount(
                      decodedJson['data'], decodedJson['data']['id']);
                }
              }
              if (decodedJson != null
                  ? decodedJson['status'] == 200 && decodedJson['data'] != null
                      ? decodedJson['data']['id'] != null
                          ? true
                          : false
                      : false
                  : false) {
                if (house_count != null
                    ? house_count >= 1
                        ? true
                        : false
                    : false) {
                  showMaxProjectPremiumDialogue(context);
                  return;
                }
                Navigator.of(context).pushNamed(PageNav.namedRoute);
              } else {
                showDialog(
                    builder: (context) => loginDialog(context),
                    context: (context));
              }
            },
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Container(
                  child: Image.asset(
                    'assets/images/arrow.png',
                    width: 45,
                    height: 45,
                  ),
                ),
                title: Text(
                  "Interested Next-->",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          Card(
              elevation: 2,
              child: ListTile(
                leading: Container(
                    child: const Text("Our Prestigious Bungalow Projects")),
                // title: ,
              ))
        ],
      )),
    );
  }
}
