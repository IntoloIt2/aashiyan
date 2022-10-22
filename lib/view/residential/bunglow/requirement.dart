import 'dart:convert';
import 'dart:core';
import 'package:aashiyan/components/forms.dart' as Forms;
import 'package:aashiyan/components/forms.dart';
import 'package:aashiyan/controller/api_services.dart';
import 'package:aashiyan/model/requirementmodel.dart';
import 'package:flutter/material.dart';
import '../../../const.dart';
import 'package:http/http.dart' as http;

class Requirement extends StatefulWidget {
  static const namedRoute = "/intrestedNext";
  @override
  State<Requirement> createState() => _RequirementState();
}

class _RequirementState extends State<Requirement> {
  
  String nameController = '';
  String lastNameController = "";
  String emailController = "";
  String addressController = "";
  String? diagonal1Controller = '';
  String? diagonal2Controller = '';
  String eastController = "";
  String westController = "";
  String northController = "";
  String southController = "";
  String levelController = "";
  String? widthController = '';
  String? lengthController = '';

  var plotValue = TextEditingController();

  int isRegular = 1;
  int isNotRegular = 0;
  int isNorthOrientaion = 0;
  int plot_orientaion = 0;
  String isWest = "1";
  String isNorth = "1";
  String isSouth = "1";
  String isEast = "1";

  bool? northOriented = false;
  bool? regularPlotValue = true;
  bool? irregularPlotValue = false;
  bool? surveyor = false;
  bool? notReqired = true;
  int notReqiredInt = 0;

  bool eastRoad = false;
  bool westRoad = false;
  bool nortRoad = false;
  bool southRoad = false;
  bool? otherEast = false;
  bool? otherwest = false;
  bool? otherNortn = false;
  bool? otherSouth = false;

  List<String> levels = ["select", "Almost same level", "Up", "Down"];
  String selectedLevel = 'select';
  int selectedLevelInt = 0;

  List<String> items = ["select", "Mr", "Mrs", "Ms", "M/s"];
  String selectedItems = 'select';
  int selectedItemInt = 0;

  List<String> countryItmes = ["India"];
  String country = "India";

  // String selectCity = "select";

  String myState = "Select State";

  int cityId = 0;
  int stateId = 0;

  int plotSize = 0;
  String plotSizeStr = '';
  String selectedState = "Select State";

  List cityData = [];
  List stateData = [];

  int plotWidth = 0;
  int plotLenght = 0;
  int value = 0;
  String? lengthText, widthText, finalString;
  String calculation = "";

  String totalCalculated() {
    lengthText = lengthController;
    widthText = widthController;
    finalString = plotValue.text;

    if (lengthText != '' && widthText != '') {
      calculation = (plotLenght * plotWidth).toString();
      plotValue.value = plotValue.value.copyWith(
        text: calculation.toString(),
      );
    }
    return calculation;
  }

  int? diagonal1 = 0;
  int? diagonal2 = 0;
  int? diagonalValue = 0;
  String? diagonal1Text, diagonal2Text, finalDiagonal;
  String diagonalCalculation = "";
  String diagonalCalculations() {
    diagonal1Text = diagonal1Controller;
    diagonal2Text = diagonal2Controller;
    finalDiagonal = plotValue.text;

    if (diagonal1Text != '' && diagonal2Text != '') {
      diagonalCalculation = (((diagonal1! * diagonal2!) / 2)).toString();
      plotValue.value = plotValue.value.copyWith(
        text: diagonalCalculation.toString(),
      );
    }
    return diagonalCalculation;
  }

  Future<void> getState() async {
    try {
      var client = http.Client();
      var response =
          await http.get(Uri.parse("https://sdplweb.com/sdpl/api/state/1"));
      // print(response.body.toString());
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final stateList = jsonResponse['states'] as List;
        setState(() {
          stateData = stateList;
        });
        // print(stateData);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List?> getCities() async {
    try {
      var client = http.Client();
      var response = await http
          .get(Uri.parse("https://sdplweb.com/sdpl/api/city/$stateId"));
      // print(response.body.toString());
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final cityList = jsonResponse['cities'] as List;
        setState(() {
          cityData = cityList;
        });
        // print(cityData);
        return cityList;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  var printData;

  Future<void> getData() async {
    try {
      // var client = http.Client();
      var response = await http.get(
        Uri.parse("http://192.168.0.99:8080/sdplserver/api/edit-project/179"),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        setState(() {
          printData = jsonResponse;
          print(printData);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool isloading = false;

  // updateCheckbox() {
  //   if (isloading) {
  //     if (printData["project"]["east_property"] == 2) {
  //       setState(() {
  //         eastRoad = true;
  //       });
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getData();
    getCities();
    getState();
    plotValue.addListener(() => setState(() {}));
    if (printData == null) {
      setState(() {
        isloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (printData != null) {
      setState(() {
        isloading = false;
      });
    }
    // print(stateData);
    return isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  requirementText("Name"),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.04,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedItems,
                          icon: const Icon(Icons.keyboard_arrow_down_sharp),
                          elevation: 16,
                          items: items
                              .map((it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(it,
                                        style:
                                            TextStyle(fontSize: height * 0.02)),
                                  ))
                              .toList(),
                          onChanged: (it) => setState(
                            () {
                              if (it == "MR") {
                                selectedItemInt = 1;
                              } else if (it == "MRS") {
                                selectedItemInt = 2;
                              } else if (it == "MS") {
                                selectedItemInt = 3;
                              }
                              selectedItems = it!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.25,
                      child: TextFormField(
                        // controller: nameController,
                        initialValue: printData != null
                            ? printData["project"]['first_name'].toString()
                            : '',
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "First name",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          nameController = value;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.19,
                      child: TextFormField(
                        // controller: nameController,
                        initialValue: printData["project"]['last_name'],
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "last name",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        onChanged: (value) {
                          lastNameController = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  requirementText("Email"),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.04,
                      width: width * 0.6,
                      child: TextFormField(
                        // controller: nameController,
                        initialValue: printData["project"]['email'],
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green

                            ),
                        onChanged: (value) {
                          emailController = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  requirementText("Project \nAddress"),
                  SizedBox(
                    width: width * 0.017,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: SizedBox(
                      height: height * 0.06,
                      width: width * 0.6,
                      child: TextFormField(
                        // controller: nameController,
                        initialValue: printData["project"]['address'],
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green

                            ),
                        onChanged: (value) {
                          addressController = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  requirementText("Country"),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      height: height * 0.04,
                      width: width * 0.6,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: country,
                          elevation: 16,
                          items: countryItmes
                              .map(
                                (it) => DropdownMenuItem<String>(
                                  value: it,
                                  child: Text(it,
                                      style:
                                          TextStyle(fontSize: height * 0.02)),
                                ),
                              )
                              .toList(),
                          onChanged: (it) => setState(() => country = it!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Forms.requirementText("State"),
                  SizedBox(
                    width: width * 0.06,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.04,
                      width: width * 0.6,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          onTap: () {},
                          hint: printData["project"]["state_name"] != null
                              ? Text(printData["project"]["state_name"])
                              : Text(selectedState),
                          elevation: 16,
                          items: stateData
                              .map(
                                (it) => DropdownMenuItem<String>(
                                  value: it["state_name"],
                                  child: Text(
                                    it["state_name"],
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      stateId = it["id"];
                                      getCities();
                                    });
                                  },
                                ),
                              )
                              .toList(),
                          onChanged: (it) => setState(() {
                            printData["project"]["state_name"] = null;
                            selectedState = it!;
                            getCities();
                          }),
                        ),
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
                  Forms.requirementText("city"),
                  SizedBox(
                    width: width * 0.085,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.04,
                      width: width * 0.6,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: printData["project"]["city_name"] != null
                              ? Text(printData["project"]["city_name"])
                              : Text(myState),
                          elevation: 16,
                          items: cityData
                              .map(
                                (it) => DropdownMenuItem<String>(
                                  value: it["city_name"],
                                  child: Text(
                                    it["city_name"],
                                    style: TextStyle(fontSize: height * 0.02),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      cityId = it["id"];
                                    });
                                  },
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) {
                            setState(
                              () {
                                myState = newValue!;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  const Text(
                    "Property details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.23,
                  ),
                  Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      height: height * 0.04,
                      width: width * 0.2,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: size,
                          elevation: 16,
                          items: sizeitems
                              .map((it) => DropdownMenuItem<String>(
                                    value: it,
                                    child: Text(
                                      it,
                                      style: TextStyle(fontSize: height * 0.02),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (it) => setState(() => size = it!),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: printData['project']['plot_type'] == 1
                        ? regularPlotValue
                        : false,
                    onChanged: (val) {
                      setState(() {
                        printData['project']['plot_type'] = 2;
                        regularPlotValue = val;
                        irregularPlotValue = false;
                      });
                    },
                  ),
                  SizedBox(
                    width: width * 0.00,
                  ),
                  requirementText("Regular plot"),
                  SizedBox(
                    width: width * 0.1,
                  ),
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: printData['project']['plot_type'] == 2
                        ? true
                        : irregularPlotValue,
                    onChanged: (val) {
                      setState(
                        () {
                          printData['project']['plot_type'] = 1;
                          irregularPlotValue = !irregularPlotValue!;
                          regularPlotValue = false;
                        },
                      );
                    },
                  ),
                  requirementText("Irregular plot"),
                ],
              ),
              Row(
                children: [
                  requirementText("Length"),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 5,
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Lenght",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8)),
                        initialValue:
                            printData['project']['plot_length'] != null
                                ? printData['project']['plot_length']
                                : lengthController,
                        onChanged: (lengthController) {
                          setState(() {
                            if (lengthController != '') {
                              plotLenght =
                                  int.parse(lengthController.toString());
                            } else {
                              plotLenght = 0;
                              plotValue.text = '0';
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            plotLenght = 0;
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  valueContainer(height, width, size, 0.039, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  if (irregularPlotValue == true ||
                      printData['project']['plot_type'] == 2) ...[
                    requirementText("Diagona1"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Diagonal 1",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          initialValue:
                              printData['project']['diagonal_1'] != null
                                  ? printData['project']['diagonal_1']
                                  : diagonal1Controller,
                          onChanged: (diagonal1Controller) {
                            setState(() {
                              if (diagonal1Controller != '') {
                                diagonal1 =
                                    int.parse(diagonal1Controller.toString());
                              } else {
                                diagonal1 = 0;
                                plotValue.text = '0';
                              }
                            });
                          },
                          onTap: () {
                            setState(() {});
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Width"),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(5),
                    elevation: 5,
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.15,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: "width",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(8)
                            //fillColor: Colors.green
                            ),
                        initialValue: printData['project']['plot_width'] != null
                            ? printData['project']['plot_width']
                            : widthController,
                        onChanged: (widthController) {
                          setState(() {
                            if (widthController != '') {
                              plotWidth = int.parse(widthController.toString());
                            } else {
                              plotWidth = 0;
                              plotValue.text = '0';
                            }
                          });
                        },
                        onTap: () {
                          setState(() {
                            // widthController.clear();
                            if (widthController == 0) {
                              plotWidth = 0;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  valueContainer(height, width, size, 0.039, 0.05),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  if (irregularPlotValue == true ||
                      printData['project']['plot_type'] == 2) ...[
                    requirementText("Diagona2"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Diagonal 2",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.all(8)
                              // fillColor: Colors.green
                              ),
                          initialValue:
                              printData['project']['diagonal_2'] != null
                                  ? printData['project']['diagonal_2']
                                  : diagonal2Controller,
                          onChanged: (diagonal2Controller) {
                            setState(() {
                              if (diagonal2Controller != '') {
                                diagonal2 =
                                    int.parse(diagonal2Controller.toString());
                              } else {
                                diagonal2 = 0;
                                plotValue.text = '0';
                              }
                            });
                          },
                          onTap: () {
                            setState(() {});
                          },
                          // onSubmitted: (value) {
                          //   setState(() {
                          //     plotWidth = value;
                          //     plotSize = int.parse(plotWidth);
                          //     plotSize *= int.parse(plotlength);
                          //   });
                          // },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ]
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  requirementText("Plot size"),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  if (irregularPlotValue == true) ...[
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          key: Key(diagonalCalculations()),
                          initialValue:
                              printData['project']['plot_size'] != null
                                  ? printData['project']['plot_size']
                                  : plotValue,
                          onChanged: (value) {
                            setState(() {
                              if (plotLenght == 0 || plotWidth == 0) {
                                value = "0";
                              } else if (lengthController == '' ||
                                  widthController == '') {
                                value = "0";
                              } else {
                                plotValue.value = plotValue.value.copyWith(
                                  text: value.toString(),
                                );
                              }
                            });
                          },
                          onTap: () {
                            setState(() {
                              plotValue.clear();
                              plotValue.value = plotValue.value.copyWith(
                                text: '',
                              );
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ] else ...[
                    Material(
                      borderRadius: BorderRadius.circular(5),
                      elevation: 5,
                      child: Container(
                        height: height * 0.04,
                        width: width * 0.2,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green
                              ),
                          key: Key(totalCalculated()),
                          controller: plotValue,
                          onChanged: (value) {
                            setState(() {
                              plotValue.value = plotValue.value.copyWith(
                                text: value.toString(),
                              );
                            });
                          },
                          onTap: () {
                            setState(() {
                              plotValue.clear();
                              plotValue.value = plotValue.value.copyWith(
                                text: '',
                              );
                            });
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
              if (irregularPlotValue == true) ...[
                Container(
                  padding: const EdgeInsets.all(5),
                  color: Colors.white,
                  width: width * 1,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: requirementText(
                            "For irregular plot plot sketch is required"),
                      ),
                      Row(
                        children: [
                          Material(
                            elevation: 2,
                            child: Container(
                              child: Row(
                                children: const [
                                  Icon(Icons.cloud_upload),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Upload a hand sketch(jpg)"),
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
                            color: Colors.blue[900],
                            child: const Text(
                              "Preview",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
              Row(
                children: [
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: surveyor,
                    onChanged: (val) {
                      setState(() {
                        surveyor = val;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content:
                              const Text("You have raised a Alert Dialog Box"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  surveyor = false;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Colors.black,
                                child: const Text(
                                  "okay",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  requirementText("Appoint as a surveyor"),
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: notReqired,
                    onChanged: (val) {
                      setState(() {
                        notReqired = val;
                      });
                    },
                  ),
                  requirementText("Not required"),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: requirementText("Plot values"),
              ),
              Row(
                children: [
                  requirementText("East"),
                  Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: otherEast,
                      onChanged: (value) {
                        setState(() {
                          otherEast = value;
                          if (eastRoad == true) {
                            eastRoad = false;
                          }
                        });
                      }),
                  Forms.requirementText("Other property"),
                  // CheckboxListTile(value: value, onChanged: (value)),

                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: printData["project"]["east_property"] == 1
                        ? true
                        : eastRoad,
                    onChanged: (value) {
                      // print?(printData["project"]["east_property"]);
                      setState(() {
                        eastRoad = !eastRoad;
                        printData["project"]["east_property"] = "0";
                        if (otherEast = true) {
                          otherEast = false;
                        }
                      });
                    },
                  ),
                  requirementText("Road"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  if (eastRoad == true ||
                      printData["project"]["east_property"] == 1) ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['east_road_width_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Road width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            eastController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Forms.valueContainer(height, width, size, 0.039, 0.05)
                  ]
                ],
              ),
              Row(
                children: [
                  requirementText("West"),
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: otherwest,
                    onChanged: (value) {
                      setState(() {
                        otherwest = value;
                        if (westRoad == true) {
                          westRoad = false;
                        }
                      });
                    },
                  ),
                  requirementText("Other Property"),
                  Checkbox(
                    activeColor: checkColor,
                    checkColor: Colors.white,
                    value: printData["project"]["west_property"] == "1"
                        ? true
                        : westRoad,
                    onChanged: (value) {
                      setState(() {
                        printData["project"]["west_property"] = "0";
                        westRoad = !westRoad;
                        if (otherwest = true) {
                          otherwest = false;
                        }
                      });
                    },
                  ),
                  requirementText("Road"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  if (westRoad == true ||
                      printData["project"]["west_property"] == "1") ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['west_road_width_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Road width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            westController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Forms.valueContainer(height, width, size, 0.039, 0.05)
                  ]
                ],
              ),
              Row(
                children: [
                  requirementText("North"),
                  Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: otherNortn,
                      onChanged: (value) {
                        setState(() {
                          otherNortn = value;
                          if (nortRoad == true) {
                            nortRoad = false;
                          }
                        });
                      }),
                  requirementText("Other Property"),
                  Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: printData["project"]["east_property"] == 1
                          ? true
                          : nortRoad,
                      onChanged: (value) {
                        setState(() {
                          printData["project"]["east_property"] = 0;
                          nortRoad = !nortRoad;
                          if (otherNortn = true) {
                            otherNortn = false;
                          }
                        });
                      }),
                  requirementText("Road"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  if (nortRoad == true ||
                      printData["project"]["east_property"] == 1) ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['north_road_width_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Road width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            northController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Forms.valueContainer(height, width, size, 0.039, 0.05)
                  ]
                ],
              ),
              Row(
                children: [
                  requirementText("South"),
                  Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: otherSouth,
                      onChanged: (value) {
                        setState(
                          () {
                            otherSouth = value;
                            if (southRoad == true) {
                              southRoad = false;
                            }
                          },
                        );
                      }),
                  Forms.requirementText("Other Property"),
                  Checkbox(
                      activeColor: checkColor,
                      checkColor: Colors.white,
                      value: printData["project"]["south_property"] == "1"
                          ? true
                          : southRoad,
                      onChanged: (value) {
                        setState(() {
                          southRoad = value!;
                          printData["project"]["south_property"] = "0";
                          if (otherSouth = true) {
                            otherSouth = false;
                          }
                        });
                      }),
                  requirementText("Road"),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  if (southRoad == true ||
                      printData["project"]["south_property"] == "1") ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['north_road_width_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Road width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            southController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Forms.valueContainer(height, width, size, 0.039, 0.05)
                  ]
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                width: width * 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: northOriented,
                            onChanged: (value) {
                              setState(() {
                                northOriented = value;
                              });
                            }),
                        Align(
                          alignment: Alignment.topLeft,
                          child: requirementText(
                              "For irregular plot sketch is required"),
                        ),
                      ],
                    ),
                    if (northOriented == true) ...[
                      Row(
                        children: [
                          Material(
                            elevation: 2,
                            child: Container(
                              child: Row(
                                children: const [
                                  Icon(Icons.cloud_upload),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Upload a hand sketch(jpg)"),
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
                            color: Colors.blue[900],
                            child: const Text(
                              "Preview",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ]
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: requirementText("Plot level from road level"),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: height * 0.04,
                        padding: const EdgeInsets.all(5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: printData['project']['level'] != null
                                ? Text(
                                    "${levels[printData['project']['level']]}")
                                : Text(selectedLevel),
                            // value: selectedLevel,
                            icon: const Icon(Icons.keyboard_arrow_down_sharp),
                            elevation: 16,
                            items: levels
                                .map((it) => DropdownMenuItem<String>(
                                      value: it,
                                      child: Text(it,
                                          style: TextStyle(
                                              fontSize: height * 0.02)),
                                    ))
                                .toList(),
                            onChanged: (it) => setState(() {
                              selectedLevel = it!;

                              if (it == "Up") {
                                printData['project']['level'] = 2;
                                selectedLevelInt = 2;
                              } else if (it == "Down") {
                                printData['project']['level'] = 3;
                                selectedLevelInt = 3;
                              } else if (it == "Almost same level") {
                                printData['project']['level'] = 1;
                                selectedLevelInt = 1;
                              }
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (selectedLevel == "Up") ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['level_value_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                              hintText: "Road width",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.all(8)
                              //fillColor: Colors.green

                              ),
                          onChanged: (value) {
                            levelController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(height, width, size, 0.039, 0.05)
                  ],
                  if (selectedLevel == "Down") ...[
                    Material(
                      elevation: 5,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: SizedBox(
                        height: height * 0.04,
                        width: width * 0.22,
                        child: TextFormField(
                          // controller: nameController,
                          initialValue: printData["project"]
                              ['level_value_feet'],
                          style: const TextStyle(fontSize: 14),
                          decoration: const InputDecoration(
                            hintText: "Road width",
                            hintStyle: TextStyle(fontSize: 14),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.all(8),
                            // fillColor: Colors.green
                          ),
                          onChanged: (value) {
                            levelController = value;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    valueContainer(
                      height,
                      width,
                      size,
                      0.039,
                      0.05,
                    ),
                  ]
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      if (irregularPlotValue == true) {
                        isRegular = 2;
                        plot_orientaion = 1;
                      }

                      if (size == "m") {
                        dimenInt = 2;
                      }
                      if (regularPlotValue == true) {
                        isNotRegular = 1;
                      }

                      if (isNorthOrientaion == true) {
                        isNorthOrientaion = 1;
                      }

                      if (westRoad == true) {
                        isWest = "2";
                      }
                      if (otherwest == true) {
                        isWest = "1";
                      }
                      if (eastRoad == true) {
                        isEast = "1";
                      }

                      if (otherEast == true) {
                        isEast = "1";
                      }
                      if (nortRoad == true) {
                        isNorth = "2";
                      }
                      if (otherNortn == true) {
                        isNorth = "1";
                      }
                      if (southRoad == true) {
                        isSouth = "2";
                      }
                      if (otherSouth == true) {
                        isSouth = "1";
                      }
                      if (notReqired == true) {
                        notReqiredInt = 1;
                      }
                    },
                  );
                  print("d1 ${diagonal1Controller}");
                  print("d2 ${diagonal2Controller}");
                 requirementPost(
                    179,
                    978,
                    098,
                    selectedItems,
                    nameController,
                    lastNameController,
                    emailController,
                    1,
                    stateId,
                    cityId,
                    addressController,
                    true,
                    dimenInt,
                    lengthController!,
                    widthController!,
                    diagonal1Controller!,
                    diagonal2Controller!,
                    plotSizeStr,
                    " ",
                    plot_orientaion,
                    " ",
                    isEast,
                    eastController,
                    isWest,
                    westController,
                    isNorth,
                    northController,
                    isSouth,
                    southController,
                    selectedLevelInt,
                    levelController,
                    notReqiredInt,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(4)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: const Text(
                    "save and continue",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              )
            ],
          );
  }

  bool sqCheck(String str) {
    if (str.contains(size)) {
      return true;
    } else {
      return false;
    }
  }
}