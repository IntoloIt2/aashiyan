import 'dart:convert';

import 'package:http/http.dart' as http;

var baseUrl      = 'http://sdplweb.com/sdpl/';
var imageUrl     = 'http://sdplweb.com/sdpl/storage/app/public/';
var bunglowPage  = "http://sdplweb.com/sdpl/api/get-bungalow-prestigious-recent-image";
var residentPage = "http://sdplweb.com/sdpl/api/get-residential-image";
var homePage     = "http://sdplweb.com/sdpl/api/get-project-image";



List bunglowPagePrestigiousList = [];
List bunglowPageRecentList = [];



 

  Future<void> getPrestigious() async {
    try {
      var url = Uri.parse(bunglowPage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        
        bunglowPagePrestigiousList = jsonDecode(response.body)["prestigious_image"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> getRecent() async {
    try {
      var url = Uri.parse(bunglowPage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {

        bunglowPageRecentList = jsonDecode(response.body)["recent_project_image"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

List homePrestigiousList = [];
List homeRecentList = [];

  Future<void> homePrestigious() async {
    try {
      var url = Uri.parse(homePage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        
         homePrestigiousList = jsonDecode(response.body)["project_prestigious_img"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> homeRecent() async {
    try {
      var url = Uri.parse(homePage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {

        homeRecentList = jsonDecode(response.body)["project_recent_project_img"];
      }
    } catch (e) {
      print(e.toString());
    }
  }
  
  List ResidentialPrestigiousList = [];
  List ResidentialdataRecentList = []; 


  Future<void> residentialPrestigious() async {
    try {
      var url = Uri.parse(residentPage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        ResidentialPrestigiousList = jsonDecode(response.body)["residential_prestigious_img"];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> residentailRecent() async {
    try {
      var url = Uri.parse(residentPage);
      var response = await http.get(url);
      // print(response.body.toString());
      if (response.statusCode == 200) {
        ResidentialdataRecentList = jsonDecode(response.body)["residential_recent_project_img"];
      }
    } catch (e) {
      print(e.toString());
    }
  }