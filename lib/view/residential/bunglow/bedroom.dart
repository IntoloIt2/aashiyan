import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../controller/api_services.dart';

class BedRoom extends StatelessWidget {
  static const namedRoute = "/namedRoute";
  final int? index;
  final Function? removeServiceCard;

  BedRoom([this.index, this.removeServiceCard]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              Icons.remove_circle,
            ),
            onPressed: () {
              removeServiceCard!(this);
            },
          ),
        ),
        bed()
      ],
    );
  }
}

class bed extends StatefulWidget {
  const bed({Key? key}) : super(key: key);

  @override
  State<bed> createState() => _bedState();
}

class _bedState extends State<bed> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool? requiredDress = false;
    bool? notRequiredDress = false;
    String? selectedBed = "select bed";
    List<String> bedItems = [
      "select bed",
      "Bedroom 1",
      "Bedroom 2",
      "Bedroom 3"
    ];
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: width * 1,
          color: color3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              requirementText("select a bedroom Type"),
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Bedroom Details"),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Length"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextField(height, width, 0.04, 0.15, "length"),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextField(height, width, 0.04, 0.15, "Width"),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  requirementText("help?"),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Bed Room"),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: height * 0.03,
                      width: width * 0.25,
                      margin: const EdgeInsets.all(
                        3,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            icon: const Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            value: selectedBed,
                            elevation: 16,
                            items: bedItems
                                .map((it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(
                                      it,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (it) =>
                                setState(() => selectedBed = it!)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              if (selectedBed == "other") ...[
                requirementTextField(
                    height, width, 0.04, 0.7, "Bedroom floor location"),
                SizedBox(
                  height: height * 0.01,
                )
              ],
              requirementText("Toilet details"),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Length"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextField(height, width, 0.04, 0.15, "length"),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  requirementTextField(height, width, 0.04, 0.15, "Width"),
                  valueContainer(height, width, size, 0.04, 0.05),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  requirementText("help?"),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Toilet Facility"),
              SizedBox(
                height: height * 0.01,
              ),
              requirementTextField(
                  height, width, 0.04, 0.9, "Other Toilet Facility"),
              SizedBox(
                height: height * 0.01,
              ),
              requirementText("Dress Details"),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: requiredDress,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          requiredDress = value;
                                          notRequiredDress = false;
                                        },
                                      );
                                    }),
                              ),
                              requirementText("Required")
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.05,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(5),
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.04,
                                child: Checkbox(
                                    activeColor: checkColor,
                                    checkColor: Colors.white,
                                    value: notRequiredDress,
                                    onChanged: (value) {
                                      setState(() {
                                        notRequiredDress = value;
                                        requiredDress = false;
                                      });
                                    }),
                              ),
                              requirementText("Not Required"),
                              SizedBox(
                                height: height * 0.01,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              if (requiredDress == true) ...[
                Row(
                  children: [
                    requirementText("Length"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    requirementTextField(height, width, 0.04, 0.15, "length"),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    requirementText("Width"),
                    SizedBox(
                      width: width * 0.015,
                    ),
                    requirementTextField(height, width, 0.04, 0.15, "Width"),
                    valueContainer(height, width, size, 0.04, 0.05),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    requirementText("help?"),
                  ],
                ),
                requirementText("Dress Facility"),
                SizedBox(
                  height: height * 0.01,
                ),
                requirementTextField(height, width, .04, .9, "more")
              ],
              SizedBox(height: height * 0.01),
              Material(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: SizedBox(
                    width: width * 9,
                    height: height * 0.3,
                    child: FutureBuilder(
                        future: getRecent(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return CarouselSlider.builder(
                              itemCount: bunglowPageRecentList.length,
                              itemBuilder: (context, i, id) {
                                return Container(
                                  height: height * 0.4,
                                  width: width * 0.9,
                                  child: Image.network(
                                    imageUrl +
                                        bunglowPageRecentList[i]["img_path"],
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Material(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            children: const [
                              Icon(Icons.cloud_upload),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Upload a stair image"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.2,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        color: buttonColor,
                        child: const Text(
                          "Preview",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: requirementText("Room Facility"),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              requirementTextField(height, width, .04, .8, "other requirement"),
              SizedBox(
                height: height * 0.01,
              ),
              Material(
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.white,
                  child: SizedBox(
                    width: width * 9,
                    height: height * 0.3,
                    child: FutureBuilder(
                        future: getRecent(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return CarouselSlider.builder(
                              itemCount: bunglowPageRecentList.length,
                              itemBuilder: (context, i, id) {
                                return Container(
                                  height: height * 0.4,
                                  width: width * 0.9,
                                  child: Image.network(
                                    imageUrl +
                                        bunglowPageRecentList[i]["img_path"],
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                autoPlay: true,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
