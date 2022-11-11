import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/view/residential/bunglow/bungalow_detail.dart';
import 'package:aashiyan/view/residential/bunglow/entrance.dart';
import 'package:flutter/material.dart';

class TechnicalDrawingHall extends StatefulWidget {

  @override
  State<TechnicalDrawingHall> createState() => _TechnicalDrawingHallState();
}

class _TechnicalDrawingHallState extends State<TechnicalDrawingHall> {
  var gallery;
  bool isloading = false;

  @override
  initState() {
    
    super.initState();
    getData();
  }

  void getData() async {
    gallery = await getGalleryAPI(MALL_MULTIPLESER);

    if (gallery != null)
      setState(() {
        isloading = true;
      });
  }
  // Future<void> fetchData() async {
  //   var response =
  //       await http.get(Uri.parse('http://sdplweb.com/sdpl/api/get-gallery/2'));
  //   final jsonResponse = jsonDecode(response.body);

  //   final finalArt = jsonResponse['gallery'];
  //   setState(() {
  //     gallery = finalArt;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: headingFont('Multiplexer'),
      ),
      body: Center(
        child: isloading == false
            ? CircularProgressIndicator()
            : SingleChildScrollView(
              child: Container(),
            ),
      ),
    );
  }
}
