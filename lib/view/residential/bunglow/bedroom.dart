import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../controller/api_services.dart';

class BedRoom extends StatelessWidget {
  static const namedRoute = "/namedRoute";

  int? index;
  Function? removeServiceCard;
  bool isExpanded;
  BedRoom([this.index, this.removeServiceCard, this.isExpanded = false]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [bed()],
    );
  }
}

class bed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool? requiredDress = false;
    bool? notRequiredDress = false;

    String? selectedFloor = "select Floor";
    List<String> floorItems = [
      "select Floor",
      "Ground Floor",
      "1st Floor",
      "2nd Floor",
      "3rd Floor"
          "other"
    ];

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
              Row(
                children: [
                  requirementText("Bed Room"),
                  DropDown(width, height, bedItems, selectedBed),
                ],
              ),
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
                height: height * .01,
              ),
              Row(
                children: [
                  requirementText("Floor"),
                  DropDown(width, height, floorItems, selectedFloor),
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
              RequiredMethod(height, width, requiredDress, notRequiredDress),
              SizedBox(
                height: height * 0.01,
              ),
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

class RequiredMethod extends StatefulWidget {
  var width;
  var height;
  bool? required = false;
  bool? notrequired = false;

  RequiredMethod(this.height, this.width, this.required, this.notrequired);

  @override
  State<RequiredMethod> createState() => _RequiredMethodState();
}

class _RequiredMethodState extends State<RequiredMethod> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                          height: widget.height * 0.04,
                          child: Checkbox(
                              activeColor: checkColor,
                              checkColor: Colors.white,
                              value: widget.required,
                              onChanged: (value) {
                                setState(
                                  () {
                                    widget.required = value;
                                    widget.notrequired = false;
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
              height: widget.height * 0.01,
            ),
            Row(
              children: [
                SizedBox(
                  width: widget.width * 0.05,
                ),
                Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          height: widget.height * 0.04,
                          child: Checkbox(
                              activeColor: checkColor,
                              checkColor: Colors.white,
                              value: widget.notrequired,
                              onChanged: (value) {
                                setState(() {
                                  widget.notrequired = value;
                                  widget.required = false;
                                });
                              }),
                        ),
                        requirementText("Not Required"),
                        SizedBox(
                          height: widget.height * 0.01,
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
          height: widget.height * 0.01,
        ),
        if (widget.required == true) ...[
          Row(
            children: [
              requirementText("Length"),
              SizedBox(
                width: widget.width * 0.015,
              ),
              requirementTextField(
                  widget.height, widget.width, 0.04, 0.15, "length"),
              valueContainer(widget.height, widget.width, size, 0.04, 0.05),
              SizedBox(
                width: widget.width * 0.02,
              ),
              requirementText("Width"),
              SizedBox(
                width: widget.width * 0.015,
              ),
              requirementTextField(
                  widget.height, widget.width, 0.04, 0.15, "Width"),
              valueContainer(widget.height, widget.width, size, 0.04, 0.05),
              SizedBox(
                width: widget.width * 0.03,
              ),
              requirementText("help?"),
            ],
          ),
          SizedBox(
            height: widget.height * 0.01,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: requirementText("Dress Facility")),
          SizedBox(
            height: widget.height * 0.01,
          ),
          requirementTextField(widget.height, widget.width, .04, .9, "more")
        ]
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  var width;
  var height;
  List<String>? drop;
  String? selectedDrop;
  DropDown(this.width, this.height, this.drop, this.selectedDrop);
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width * 0.02,
        ),
        Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: widget.height * 0.03,
            margin: const EdgeInsets.all(
              3,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                  icon: const Visibility(
                      visible: false, child: Icon(Icons.arrow_downward)),
                  value: widget.selectedDrop,
                  elevation: 16,
                  items: widget.drop
                      ?.map((it) => DropdownMenuItem<String>(
                          value: it,
                          child: Text(
                            it,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )))
                      .toList(),
                  onChanged: (it) => setState(() => widget.selectedDrop = it!)),
            ),
          ),
        ),
      ],
    );
  }
}
