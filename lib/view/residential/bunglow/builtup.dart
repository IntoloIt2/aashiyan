// ignore_for_file: non_constant_identifier_names

// import 'dart:ui';

import 'dart:convert';

import 'package:aashiyan/components/contants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/forms.dart';
import '../../../const.dart';
import 'builtFunc.dart';
import 'entrance.dart';
import 'package:http/http.dart' as http;

class BuiltUp extends StatefulWidget {
  const BuiltUp({super.key});

  @override
  State<BuiltUp> createState() => _BuiltUpState();
}

List ar_design = [];

List str_design = [];

List mep_design = [];

List int_design = [];

// ignore: prefer_typing_uninitialized_variables
var getData;

class _BuiltUpState extends State<BuiltUp> {
  @override
  void initState() {
    super.initState();

    fetchData();
  }

  bool isloading = false;

  Future fetchData() async {
    var response =
        await http.get(Uri.parse('https://sdplweb.com/sdpl/api/get-design'));
    final jsonResponse = jsonDecode(response.body);

    setState(() {
      getData = jsonResponse;
    });
  }

  bool? SuperRequirment = false;
  bool? SuperNotRequire = false;
  int SuperInt = 0;

  bool? PremiumRequirment = false;
  bool? PremiumNotRequire = false;
  int PremiumInt = 0;

  bool? StandardRequirment = false;
  bool? StandardNotRequire = false;
  int StdLuxInt = 0;

  bool? BasicRequirment = false;
  bool? BasicNotRequire = false;
  int BasicInt = 0;
/* - - - - - - - - - - - - - - - - - - - - - - - - - - - - -*/
  bool? ConceptRequirment = false;
  bool? ConceptNotRequire = false;
  int ConceptInt = 0;

  bool? D3Requirment = false;
  bool? D3NotRequire = false;
  int D3Int = 0;

  bool? WorkingRequirment = false;
  bool? WorkingNotRequire = false;
  int WorkingInt = 0;

  bool? OpeningRequirment = false;
  bool? OpeningNotRequire = false;
  int OpeningInt = 0;

  bool? GrillRequirment = false;
  bool? GrillNotRequire = false;
  int GrillInt = 0;

  bool? BuildingRequirment = false;
  bool? BuildingNotRequire = false;
  int BuildingInt = 0;

  bool? D2Requirment = false;
  bool? D2NotRequire = false;
  int D2Int = 0;

  bool? BoundaryRequirment = false;
  bool? BoundaryNotRequire = false;
  int BoundaryInt = 0;

  bool? RailingRequirment = false;
  bool? RailingNotRequire = false;
  int RailingInt = 0;

  bool? EntranceRequirment = false;
  bool? EntranceNotRequire = false;
  int EnteranceInt = 0;

  bool? VisionRequirment = false;
  bool? VisionNotRequire = false;
  int VisionInt = 0;

  bool? LayoutRequirment = false;
  bool? LayoutNotRequire = false;
  int LayoutInt = 0;

  bool? FoundationPlanRequirment = false;
  bool? FoundationPlanNotRequire = false;
  int FoundationPlanInt = 0;

  bool? FoundationDetailsRequirment = false;
  bool? FoundationDetailsNotRequire = false;
  int FoundationDetailsInt = 0;

  bool? ColumnRequirment = false;
  bool? ColumnNotRequire = false;
  int ColumnInt = 0;

  bool? RccRequirment = false;
  bool? RccNotRequire = false;
  int RccInt = 0;

  bool? StairsRequirment = false;
  bool? StairsNotRequire = false;
  int StairsInt = 0;

  bool? LintelRequirment = false;
  bool? LintelNotRequire = false;
  int LintelInt = 0;

  bool? SlabRequirment = false;
  bool? SlabNotRequire = false;
  int SlabInt = 0;

  bool? ElectricRequirment = false;
  bool? ElectricNotRequire = false;
  int ElectricInt = 0;

  bool? PlumbingRequirment = false;
  bool? PlumbingNotRequire = false;
  int PlumbingInt = 0;

  bool? HVACRequirment = false;
  bool? HVACNotRequire = false;
  int HVACInt = 0;

  bool? FurnitureRequirment = false;
  bool? FurnitureNotRequire = false;
  int FurnitureInt = 0;

  bool? FalseRequirment = false;
  bool? FalseNotRequire = false;
  int FalseInt = 0;

  bool? FlooringRequirment = false;
  bool? FlooringNotRequire = false;
  int FlooringInt = 0;

  bool? ElectricalRequirment = false;
  bool? ElectricalNotRequire = false;
  int ElectricalInt = 0;

  bool? StairStepRequirment = false;
  bool? StairStepNotRequire = false;
  int StairStepInt = 0;

  bool? EachSpaceRequirment = false;
  bool? EachSpaceNotRequire = false;
  int EachSpaceInt = 0;

  bool? ToiletRequirment = false;
  bool? ToiletNotRequire = false;
  int ToiletInt = 0;

  bool? MaterialRequirment = false;
  bool? MaterialNotRequire = false;
  int MaterialInt = 0;

  bool? AtGoodRequirment = false;
  bool? AtGoodNotRequire = false;
  int AtGoodInt = 0;

  bool? D3FrontRequirment = false;
  bool? D3FrontNotRequire = false;
  int D3FrontInt = 0;

  bool? DrawingRequirment = false;
  bool? DrawingNotRequire = false;
  int DrawingInt = 0;

  bool? SetofRequirment = false;
  bool? SetofNotRequire = false;
  int SetofInt = 0;

  bool? HandingRequirment = false;
  bool? HandingNotRequire = false;
  int HandingInt = 0;

  bool? WithSuperRequirment = false;
  bool? WithSuperNotRequire = false;
  int WithSuperInt = 0;

  bool? FurnitureLayoutRequirment = false;
  bool? FurnitureLayoutNotRequire = false;
  int FurnitureLayoutInt = 0;

  bool? CeilingRequirment = false;
  bool? CeilingNotRequire = false;
  int CeilingInt = 0;

  bool? ToiletDadoRequirment = false;
  bool? ToiletDadoNotRequire = false;
  int ToiletDadoInt = 0;

  bool? EachRequirment = false;
  bool? EachNotRequire = false;
  int EachInt = 0;

  bool? MaterialSelectionRequirment = false;
  bool? MaterialSelectionNotRequire = false;
  int MaterialSelectionInt = 0;

//  - - - - -Heading variables- - - - - - - - - - - - - - - - - - - - -

  var projectCost = 0;
  var totalBuild = 5000;
  var arcitecturalCost = 0;
  var totalfeeCost = 0;
  var structuralCost = 0;
  var buildingCost = 0;
  var superCost = 0;
  var interiorCost = 0;
  var arcRemainingFees = 0;
  var drawingValue = 0;
  var setsOfDrawing = 0;
  var handingOver = 0;
  var designFeesA = 0;
  var designFeesB = 0;
  var payDesFees = 0;
  var serviceValue = 0;

//- - - - - -Arc Design  - - - - - - - - - - - - - - - - -

  var conCost = 0;
  var d3Cost = 0;
  var worCost = 0;
  var opeCost = 0;
  var griCost = 0;
  var builCost = 0;
  var d2Cost = 0;
  var bouCost = 0;
  var raiCost = 0;
  var entCost = 0;

// - - - - - -Str Design - - - - - - - - - - - - - - - - -

  var layCost = 0;
  var fppCost = 0;
  var fouCost = 0;
  var colCost = 0;
  var rccCost = 0;
  var pbpCost = 0;
  var staCost = 0;
  var linCost = 0;
  var slaCost = 0;

// - - - - - -Build Design - - - - - - - - - - - - - - - -

  var efpCost = 0;
  var pspCost = 0;
  var hvacCost = 0;

// - - - - - - -Super Vision - - - - - - - - - - - - - - - -

  var supCostA = 0;

//  - - - - - - Int Design - - - - - - - - - - - - - - - - - - - -

  var flpCost = 0;
  var fcdCost = 0;
  var floCost = 0;
  var edpCost = 0;
  var ssdCost = 0;
  var eswCost = 0;
  var tddCost = 0;
  var mscCost = 0;

// - - - - - - - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    if (getData != null) {
      ar_design = getData['ar_design'];
      str_design = getData['str_design'];
      mep_design = getData['mep_design'];
      int_design = getData['int_design'];
    }

    if (ar_design != null) {
      setState(() {
        isloading = true;
      });
    }

    Object country;
    return getData == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.82,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: headingFont('Area Statement'),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                requirementText("Plot Area"),
                                requirementText("2400"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            color: Colors.blue[100],
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  requirementText("Number of Floors"),
                                  requirementText("3"),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: headingFont('Built Up Areas'),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: requirementText("Ground Floor"),
                                ),
                                Container(
                                  child: requirementText("00"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: requirementText("First Floor"),
                                ),
                                Container(
                                  child: requirementText("00"),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            color: Colors.blue[100],
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child:
                                        requirementText("Total Build Up Area"),
                                  ),
                                  Container(
                                    child: requirementText("$totalBuild"),
                                  )
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: headingFont('Select Project Specifications'),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: SuperRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                SuperRequirment = value;
                                                SuperNotRequire = false;
                                                BasicRequirment = false;
                                                StandardRequirment = false;
                                                PremiumRequirment = false;
                                                projectCostCalculation();
                                                // if (SuperRequirment == true) {
                                                //   serviceValue = 4000;
                                                //   specificationDetail();
                                                //   print(projectCost);

                                                //   print(drawingDesign(
                                                //       drawingValue));
                                                // } else {
                                                //   ConceptRequirment = false;
                                                //   projectCost = 0;
                                                //   drawingDesign(0);
                                                // }

                                                // if (SuperRequirment == true) {

                                                //   setsOfDrawingFees(
                                                //       setsOfDrawing);
                                                // } else {
                                                //   setsOfDrawingFees(
                                                //       setsOfDrawing = 0);
                                                // }
                                              },
                                            );
                                          }),
                                      requirementText("Super Premium"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Row(
                                      children: [
                                        requirementText("4000 persqft"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: PremiumRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                PremiumRequirment = value;
                                                PremiumNotRequire = false;
                                                BasicRequirment = false;
                                                StandardRequirment = false;
                                                SuperRequirment = false;
                                                projectCostCalculation();
                                              },
                                            );
                                          }),
                                      requirementText("Premium"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Row(
                                      children: [
                                        requirementText("3000 persqft"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: StandardRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                StandardRequirment = value;
                                                StandardNotRequire = false;
                                                BasicRequirment = false;
                                                PremiumRequirment = false;
                                                SuperRequirment = false;
                                                projectCostCalculation();

                                                if (StandardRequirment == 
                                                    true) {
                                                  drawingDesign(drawingValue);
                                                } else {
                                                  projectCost = 0;
                                                }
                                              },
                                            );
                                          }),
                                      requirementText("Standard Luxury"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Row(
                                      children: [
                                        requirementText("2000 persqft"),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          checkColor: Colors.white,
                                          value: BasicRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                BasicRequirment = value;
                                                BasicNotRequire = false;
                                                StandardRequirment = false;
                                                PremiumRequirment = false;
                                                SuperRequirment = false;
                                                projectCostCalculation();
                                                // if (BasicRequirment == true) {
                                                //   serviceValue = 1500;
                                                //   specificationDetail();
                                                // } else {
                                                //   projectCost = 0;
                                                // }
                                              },
                                            );
                                          }),
                                      requirementText("Basic Standard"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Row(
                                      children: [
                                        requirementText("1500 persqft"),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: headingFont('Total Project'),
                        ),
                        Container(
                          color: Colors.blue[100],
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                requirementText("Total Project Cost"),
                                headingFont('${projectCost} '),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: headingFont('Select Scope of Works'),
                        ),
                        const Text(
                          'Note-1 : Advise to get started with conceptual plan only.',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Note-2 : For the purpose of approvals plans locsal consultants shall be engaged at your own.',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            color: Colors.blue[100],
                            padding: const EdgeInsets.all(0),
                            child: ExpansionTile(
                              title: headingFont('Architectural Design'),
                              children: [
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: ConceptRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design1Percent = double
                                                          .parse(ar_design[0][
                                                              'design_percent']);
                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        ConceptRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }

                                                      ConceptNotRequire = false;
                                                      D3Requirment = false;
                                                      WorkingRequirment = false;
                                                      OpeningRequirment = false;
                                                      GrillRequirment = false;
                                                      BuildingRequirment =
                                                          false;
                                                      D2Requirment = false;
                                                      BoundaryRequirment =
                                                          false;
                                                      RailingRequirment = false;
                                                      EntranceRequirment =
                                                          false;
                                                      conCost =
                                                          conceptualAndThreeDCost(
                                                              totalBuild);

                                                      if (ConceptRequirment ==
                                                          true) {
                                                        print(conCost);
                                                      } else {
                                                        conCost = 0;
                                                        d3Cost = 0;
                                                        worCost = 0;
                                                        opeCost = 0;
                                                        griCost = 0;
                                                        builCost = 0;
                                                        d2Cost = 0;
                                                        bouCost = 0;
                                                        raiCost = 0;
                                                        entCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[0]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            // decoration:
                                            //     BoxDecoration(border: Border.all()),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: D3Requirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design2Percent = double
                                                          .parse(ar_design[1][
                                                              'design_percent']);

                                                      if (ConceptRequirment ==
                                                          true) {
                                                        D3Requirment = value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }

                                                      D3NotRequire = false;

                                                      d3Cost =
                                                          conceptualAndThreeDCost(
                                                              totalBuild);
                                                      if (D3Requirment ==
                                                          true) {
                                                        print(d3Cost);
                                                      } else {
                                                        d3Cost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[1]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: WorkingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design3Percent = double
                                                          .parse(ar_design[2][
                                                              'design_percent']);
                                                      // print('$design3Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        WorkingRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      WorkingNotRequire = false;
                                                      worCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      worCost =
                                                          worCost * 30 ~/ 100;

                                                      if (WorkingRequirment ==
                                                          true) {
                                                        // print(worCost);
                                                      } else {
                                                        worCost = 0;
                                                      }
                                                      print(worCost);
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[2]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: OpeningRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design4Percent = double
                                                          .parse(ar_design[3][
                                                              'design_percent']);
                                                      // print('$design4Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        OpeningRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      OpeningNotRequire = false;
                                                      opeCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      opeCost =
                                                          opeCost * 10 ~/ 100;

                                                      if (OpeningRequirment ==
                                                          true) {
                                                        print(opeCost);
                                                      } else {
                                                        opeCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[3]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: GrillRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design5Percent = double
                                                          .parse(ar_design[4][
                                                              'design_percent']);
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        GrillRequirment = value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      GrillNotRequire = false;
                                                      griCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      griCost =
                                                          griCost * 5 ~/ 100;
                                                      if (GrillRequirment ==
                                                          true) {
                                                        print(griCost);
                                                      } else {
                                                        griCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[4]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: BuildingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design6Percent = double
                                                          .parse(ar_design[5][
                                                              'design_percent']);
                                                      // print('$design6Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        BuildingRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      BuildingNotRequire =
                                                          false;
                                                      builCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      builCost =
                                                          builCost * 10 ~/ 100;
                                                      if (BuildingRequirment ==
                                                          true) {
                                                        print(builCost);
                                                      } else {
                                                        builCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[5]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: D2Requirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design7Percent = double
                                                          .parse(ar_design[6][
                                                              'design_percent']);
                                                      // print('$design7Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        D2Requirment = value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      D2NotRequire = false;
                                                      d2Cost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      d2Cost =
                                                          d2Cost * 20 ~/ 100;
                                                      if (D2Requirment ==
                                                          true) {
                                                        print(d2Cost);
                                                      } else {
                                                        d2Cost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[6]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: BoundaryRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design8Percent = double
                                                          .parse(ar_design[7][
                                                              'design_percent']);
                                                      // print('$design8Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        BoundaryRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      BoundaryNotRequire =
                                                          false;
                                                      bouCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      bouCost =
                                                          bouCost * 15 ~/ 100;
                                                      if (BoundaryRequirment ==
                                                          true) {
                                                        print(bouCost);
                                                      } else {
                                                        bouCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[7]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: RailingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design9Percent = double
                                                          .parse(ar_design[8][
                                                              'design_percent']);
                                                      // print('$design9Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        RailingRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      RailingNotRequire = false;
                                                      raiCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      raiCost =
                                                          raiCost * 5 ~/ 100;
                                                      if (RailingRequirment ==
                                                          true) {
                                                        print(raiCost);
                                                      } else {
                                                        raiCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[8]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: EntranceRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design10Percent =
                                                          double.parse(ar_design[
                                                                  9][
                                                              'design_percent']);
                                                      // print('$design10Percent');
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        EntranceRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder:
                                                                (context) =>
                                                                    AlertDialog(
                                                                      title: Text(
                                                                          'Alert'),
                                                                      content: Text(
                                                                          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
                                                                      actions: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.bottomCenter,
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                45,
                                                                            width:
                                                                                90,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                52,
                                                                                52,
                                                                                52),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
                                                                              child: Center(
                                                                                child: TextButton(
                                                                                    onPressed: () {
                                                                                      Navigator.pop(context);
                                                                                    },
                                                                                    child: Text(
                                                                                      'Okay',
                                                                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ));
                                                      }
                                                      EntranceNotRequire =
                                                          false;
                                                      entCost =
                                                          remainingFeesCost(
                                                              arcRemainingFees);
                                                      entCost =
                                                          entCost * 5 ~/ 100;
                                                      if (EntranceRequirment ==
                                                          true) {
                                                      } else {
                                                        entCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                ar_design[9]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const Text(
                                                "Sample pdf",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            color: Colors.blue[100],
                            // height: 200,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              title: headingFont('Structural Design '),
                              children: [
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: LayoutRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign1 = double
                                                          .parse(str_design[0][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        LayoutRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }

                                                      LayoutNotRequire = false;
                                                      layCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      layCost =
                                                          layCost * 10 ~/ 100;
                                                      if (LayoutRequirment ==
                                                          true) {
                                                        print(layCost);
                                                      } else {
                                                        layCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[0]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: FoundationPlanRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign2 = double
                                                          .parse(str_design[1][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        FoundationPlanRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }

                                                      FoundationPlanNotRequire =
                                                          false;
                                                      fppCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      fppCost =
                                                          fppCost * 15 ~/ 100;
                                                      if (FoundationPlanRequirment ==
                                                          true) {
                                                        print(fppCost);
                                                      } else {
                                                        fppCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[1]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0.1, right: 5),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value:
                                                    FoundationDetailsRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign3 = double
                                                          .parse(str_design[2][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        FoundationDetailsRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }

                                                      FoundationDetailsNotRequire =
                                                          false;
                                                      fouCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      fouCost =
                                                          fouCost * 10 ~/ 100;
                                                      if (FoundationDetailsRequirment ==
                                                          true) {
                                                        print(fouCost);
                                                      } else {
                                                        fouCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[2]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: ColumnRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign4 = double
                                                          .parse(str_design[3][
                                                              'design_percent']);
                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        ColumnRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }
                                                      ColumnNotRequire = false;
                                                      colCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      colCost =
                                                          colCost * 15 ~/ 100;
                                                      if (ColumnRequirment ==
                                                          true) {
                                                        print(colCost);
                                                      } else {
                                                        colCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[3]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: RccRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign5 = double
                                                          .parse(str_design[4][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        RccRequirment = value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black87,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }
                                                      RccNotRequire = false;
                                                      rccCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      rccCost =
                                                          rccCost * 5 ~/ 100;
                                                      if (RccRequirment ==
                                                          true) {
                                                        print(rccCost);
                                                      } else {
                                                        rccCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[4]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: StairsRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign6 = double
                                                          .parse(str_design[5][
                                                              'design_percent']);
                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        StairsRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Color.fromARGB(
                                                                    221,
                                                                    37,
                                                                    37,
                                                                    37),
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }
                                                      StairsNotRequire = false;
                                                      staCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      staCost =
                                                          staCost * 5 ~/ 100;
                                                      if (StairsRequirment ==
                                                          true) {
                                                        print(staCost);
                                                      } else {
                                                        staCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[5]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: LintelRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign7 = double
                                                          .parse(str_design[6][
                                                              'design_percent']);
                                                      LintelRequirment = value;
                                                      LintelNotRequire = false;
                                                      linCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      linCost =
                                                          linCost * 10 ~/ 100;
                                                      if (LintelRequirment ==
                                                          true) {
                                                        print(linCost);
                                                      } else {
                                                        linCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[6]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: SlabRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign8 = double
                                                          .parse(str_design[7][
                                                              'design_percent']);
                                                      SlabRequirment = value;
                                                      SlabNotRequire = false;
                                                      slaCost =
                                                          structuralDesing(
                                                              structuralCost);
                                                      slaCost =
                                                          slaCost * 20 ~/ 100;
                                                      if (SlabRequirment ==
                                                          true) {
                                                        print(slaCost);
                                                      } else {
                                                        slaCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                str_design[7]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            color: Colors.blue[100],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              // backgroundColor: Colors.black,
                              title: headingFont('Building Service'),
                              children: [
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: ElectricRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var mep1 = double.parse(
                                                          mep_design[0][
                                                              'design_percent']);
                                                      ElectricRequirment =
                                                          value;
                                                      ElectricNotRequire =
                                                          false;
                                                      efpCost = buildingDesign(
                                                          buildingCost);
                                                      efpCost =
                                                          efpCost * 40 ~/ 100;
                                                      if (ElectricRequirment ==
                                                          true) {
                                                        print(efpCost);
                                                      } else {
                                                        efpCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                mep_design[0]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: PlumbingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var mep2 = double.parse(
                                                          mep_design[1][
                                                              'design_percent']);
                                                      PlumbingRequirment =
                                                          value;
                                                      PlumbingNotRequire =
                                                          false;
                                                      pspCost = buildingDesign(
                                                          buildingCost);
                                                      pspCost =
                                                          pspCost * 40 ~/ 100;
                                                      if (PlumbingRequirment ==
                                                          true) {
                                                        print(pspCost);
                                                      } else {
                                                        pspCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                mep_design[1]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: HVACRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var mep3 = double.parse(
                                                          mep_design[2][
                                                              'design_percent']);
                                                      HVACRequirment = value;
                                                      HVACNotRequire = false;
                                                      hvacCost = buildingDesign(
                                                          buildingCost);
                                                      hvacCost =
                                                          hvacCost * 20 ~/ 100;
                                                      if (HVACRequirment ==
                                                          true) {
                                                        print(hvacCost);
                                                      } else {
                                                        hvacCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                mep_design[2]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                              height: 55,
                              color: Colors.blue[100],
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: VisionRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                VisionRequirment = value;
                                                VisionNotRequire = false;
                                                superCost = superVisionDesign(
                                                    superCost);
                                                if (VisionRequirment == true) {
                                                  print(superCost);
                                                } else {
                                                  superCost = 0;
                                                }
                                              },
                                            );
                                          }),
                                      headingFont('Super Vision'),
                                    ],
                                  ),
                                  DropdownButton<String>(
                                      hint: headingFont('Jabalpur'),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        size: 30,
                                        color: Colors.black,
                                      ),
                                      items: [],
                                      onChanged: (it) =>
                                          setState(() => country = it!)),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            color: Colors.blue[100],
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              title: headingFont('Interior Design'),
                              children: [
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: FurnitureRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD1 = double.parse(
                                                          int_design[0][
                                                              'design_percent']);
                                                      FurnitureRequirment =
                                                          value;
                                                      FurnitureNotRequire =
                                                          false;
                                                      flpCost = interiorDesign(
                                                          interiorCost);
                                                      flpCost =
                                                          flpCost * 10 ~/ 100;
                                                      if (FurnitureRequirment ==
                                                          true) {
                                                        print(flpCost);
                                                      } else {
                                                        flpCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[0]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: FalseRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD2 = double.parse(
                                                          int_design[1][
                                                              'design_percent']);
                                                      FalseRequirment = value;
                                                      FalseNotRequire = false;
                                                      fcdCost = interiorDesign(
                                                          interiorCost);
                                                      fcdCost =
                                                          fcdCost * 15 ~/ 100;
                                                      if (FalseRequirment ==
                                                          true) {
                                                        print(fcdCost);
                                                      } else {
                                                        fcdCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[1]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: FlooringRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD3 = double.parse(
                                                          int_design[2][
                                                              'design_percent']);
                                                      FlooringRequirment =
                                                          value;
                                                      FlooringNotRequire =
                                                          false;
                                                      floCost = interiorDesign(
                                                          interiorCost);
                                                      floCost =
                                                          floCost * 10 ~/ 100;
                                                      if (FlooringRequirment ==
                                                          true) {
                                                        print(floCost);
                                                      } else {
                                                        floCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[2]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: ElectricalRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      ElectricalRequirment =
                                                          value;
                                                      ElectricalNotRequire =
                                                          false;
                                                      edpCost = interiorDesign(
                                                          interiorCost);
                                                      edpCost =
                                                          edpCost * 5 ~/ 100;
                                                      if (ElectricalRequirment ==
                                                          true) {
                                                        print(edpCost);
                                                      } else {
                                                        edpCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            InkWell(
                                              child: requirementText(
                                                  int_design[3]['design']),
                                              onTap: () {
                                                print(edpCost);
                                              },
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: StairStepRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD5 = double.parse(
                                                          int_design[4][
                                                              'design_percent']);
                                                      StairStepRequirment =
                                                          value;
                                                      StairStepNotRequire =
                                                          false;
                                                      ssdCost = interiorDesign(
                                                          interiorCost);
                                                      ssdCost =
                                                          ssdCost * 10 ~/ 100;
                                                      if (StairStepRequirment ==
                                                          true) {
                                                        print(ssdCost);
                                                      } else {
                                                        ssdCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[4]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            height: 37,
                                            color: Colors.white,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: EachSpaceRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD6 = double.parse(
                                                          int_design[5][
                                                              'design_percent']);
                                                      EachSpaceRequirment =
                                                          value;
                                                      EachSpaceNotRequire =
                                                          false;
                                                      eswCost = interiorDesign(
                                                          interiorCost);
                                                      eswCost =
                                                          eswCost * 30 ~/ 100;
                                                      if (EachSpaceRequirment ==
                                                          true) {
                                                        print(eswCost);
                                                      } else {
                                                        eswCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[5]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: ToiletRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD7 = double.parse(
                                                          int_design[6][
                                                              'design_percent']);
                                                      ToiletRequirment = value;
                                                      ToiletNotRequire = false;
                                                      tddCost = interiorDesign(
                                                          interiorCost);
                                                      tddCost =
                                                          tddCost * 10 ~/ 100;
                                                      if (ToiletRequirment ==
                                                          true) {
                                                        print(tddCost);
                                                      } else {
                                                        tddCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[6]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Container(
                                    color: Colors.blue[50],
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                value: MaterialRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD8 = double.parse(
                                                          int_design[7][
                                                              'design_percent']);
                                                      MaterialRequirment =
                                                          value;
                                                      MaterialNotRequire =
                                                          false;
                                                      mscCost = interiorDesign(
                                                          interiorCost);
                                                      mscCost =
                                                          mscCost * 10 ~/ 100;
                                                      if (MaterialRequirment ==
                                                          true) {
                                                        print(mscCost);
                                                      } else {
                                                        mscCost = 0;
                                                      }
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[7]['design']),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            color: Colors.white,
                                            height: 37,
                                            child: TextButton(
                                              onPressed: () {},
                                              child:
                                                  requirementText("Sample pdf"),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue[100],
                  height: MediaQuery.of(context).size.height * 0.20,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Column(children: [
                                requirementText(
                                  'S.no.',
                                )
                              ]),
                              Column(children: [
                                requirementText(
                                  'Payment Schedule',
                                )
                              ]),
                              Column(children: [
                                requirementText(
                                  'Working Time Part A (Civil)',
                                )
                              ]),
                              Column(children: [
                                requirementText(
                                  'Pay for',
                                )
                              ]),
                              Column(children: [
                                requirementText(
                                  'Fee',
                                )
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('1.')]),
                              Column(children: const [Text('At good Start')]),
                              Column(children: const [Text('7 Days')]),
                              Column(children: [
                                Container(
                                  // height: 19,
                                  // width: 19,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(1)),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.blue[100],
                                    size: 18,
                                  ),
                                )
                                // Checkbox(
                                //     value: AtGoodRequirment,
                                //     onChanged: (value) {
                                //       setState(
                                //         () {
                                //           AtGoodRequirment = value;
                                //           AtGoodNotRequire = false;
                                //         },
                                //       );
                                //     }),
                              ]),
                              Column(children: [Text('$conCost')]),
                            ]),
                            TableRow(children: [
                              Column(children: [const Text('2.')]),
                              Column(
                                  children: [const Text('3D Front Elevation')]),
                              Column(children: [const Text('7 Days')]),
                              Column(children: [
                                Checkbox(
                                    value: D3FrontRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          D3FrontRequirment = value;
                                          D3FrontNotRequire = false;
                                          // payDesFees =
                                          //     payDesignFees(payDesFees);
                                          // payDesFees + d3Cost;
                                          // if (D3FrontRequirment == true) {
                                          //   payDesFees + d3Cost;
                                          // } else if (D3FrontRequirment ==
                                          //     false) {
                                          //   payDesFees - d3Cost;
                                          // }
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$d3Cost')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('3.')]),
                              Column(children: [
                                InkWell(
                                  child: const Text('Drawing UpTo Plinth'),
                                  onTap: () {},
                                )
                              ]),
                              Column(children: const [Text('7 Days')]),
                              Column(children: [
                                Checkbox(
                                    value: DrawingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          DrawingRequirment = value;
                                          DrawingNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [
                                Text('${drawingDesign(drawingValue)}')
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('4.')]),
                              Column(children: const [
                                Text('Sets of Drawings(Start)')
                              ]),
                              Column(children: const [Text('30 Days')]),
                              Column(children: [
                                Checkbox(
                                    value: SetofRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          SetofRequirment = value;
                                          SetofNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [
                                Text('${setsOfDrawingFees(setsOfDrawing)}')
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('5.')]),
                              Column(
                                  children: const [Text('Handing Over Ste')]),
                              Column(children: const [Text('---')]),
                              Column(children: [
                                Checkbox(
                                    value: HandingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          HandingRequirment = value;
                                          HandingNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [
                                Text('${handingOverFees(handingOver)}')
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('6.')]),
                              Column(
                                  children: const [Text('With Super Vision')]),
                              Column(children: const [Text('---')]),
                              Column(children: [
                                Checkbox(
                                    value: WithSuperRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          WithSuperRequirment = value;
                                          WithSuperNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$superCost')]),
                            ]),
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                requirementText('Design Fees (Part A)'),
                                requirementText(
                                    '${(designFeesPartA(designFeesA))}'),
                              ],
                            ),
                          ),
                        ),
                        requirementText('Part B (Interior)'),
                        Table(
                          children: [
                            TableRow(children: [
                              Column(children: const [Text('1.')]),
                              Column(
                                  children: const [Text('Furniture Layout')]),
                              Column(children: const [Text('7days')]),
                              Column(children: [
                                Checkbox(
                                    value: FurnitureLayoutRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          FurnitureLayoutRequirment = value;
                                          FurnitureLayoutNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$flpCost')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('2.')]),
                              Column(children: const [
                                Text('Ceiling, Flooring Details')
                              ]),
                              Column(children: const [Text('7days')]),
                              Column(children: [
                                Checkbox(
                                    value: CeilingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          CeilingRequirment = value;
                                          CeilingNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(
                                  children: [Text('${(fcdCost + floCost)} ')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('3.')]),
                              Column(children: const [
                                Text('Toilet Dado Details')
                              ]),
                              Column(children: const [Text('3days')]),
                              Column(children: [
                                Checkbox(
                                    value: ToiletDadoRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          ToiletDadoRequirment = value;
                                          ToiletDadoNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [
                                Text('${(edpCost + tddCost + ssdCost)}')
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('4.')]),
                              Column(children: const [
                                Text('Each Space Wall Details')
                              ]),
                              Column(children: const [Text('21days')]),
                              Column(children: [
                                Checkbox(
                                    value: EachRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          EachRequirment = value;
                                          EachNotRequire = false;
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$eswCost')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('5.')]),
                              Column(
                                  children: const [Text('Material Selection')]),
                              Column(children: const [Text('3days')]),
                              Column(children: [
                                Checkbox(
                                    value: MaterialSelectionRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          MaterialSelectionRequirment = value;
                                          MaterialSelectionNotRequire = false;
                                          // if (MaterialSelectionRequirment =
                                          //     true) {
                                          //   // Text("${} ")
                                          // } else {
                                          //   print('0');
                                          // }
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$mscCost')]),
                            ]),
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                requirementText('Interior Desing (Part B)'),
                                requirementText(
                                    '${(designFeesPartB(designFeesB))} '),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // height: 120,
                  color: Colors.blue[100],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            requirementText(
                                'Design and Drawing Fee \n(Part A + B)'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 50.0),
                                  child: requirementText(
                                      '${payDesignFees(payDesFees)}'),
                                ),
                                requirementText(
                                    '${(designFeesPartA(designFeesA) + designFeesPartB(designFeesB) + superCost)} '),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                  height: 35,
                                  color: Colors.blue,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'SAVE',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 35,
                                  color: Colors.blue,
                                  // decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(5)),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'CONTINUE TO PAY',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  void projectCostCalculation() {
    if (SuperRequirment == true) {
      projectCost = totalBuild * superService;
      // int value = projectCost * 2 ~/ 100 * 50 ~/ 100 - conCost - d3Cost;
      // return 1;
    } else if (PremiumRequirment == true) {
      projectCost = totalBuild * premiumService;
      // return 2;

    } else if (StandardRequirment == true) {
      projectCost = totalBuild * standardService;
      // return 3;
    } else if (BasicRequirment == true) {
      projectCost = totalBuild * basicService;
      // return 4;
    } else {
      projectCost = 0;
    }
  }

  AlertDialog alertBox(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text('Kindly finallize Conceptual plan to proceed further!'),
      actions: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 45,
            width: 90,
            color: Color.fromARGB(255, 52, 52, 52),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Okay',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ),
        )
      ],
    );
  }

  int conceptualAndThreeDCost(totalBuild) {
    int value = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
    return value;
  }

  int remainingFeesCost(arcRemainingFees) {
    // if()
    int value = projectCost * 2 ~/ 100 * 50 ~/ 100 - conCost - d3Cost;
    // print('Proje $projectCost');
    // print('jhkjbb $value');
    return value;
  }

  int structuralDesing(structuralCost) {
    int value = projectCost * 2 ~/ 100 * 35 ~/ 100;
    return value;
  }

  int buildingDesign(buildingCost) {
    int value = projectCost * 2 ~/ 100 * 15 ~/ 100;
    return value;
  }

  int superVisionDesign(superCost) {
    int value = projectCost * 0.25 ~/ 100;
    return value;
  }

  int interiorDesign(interiorCost) {
    int value = (projectCost * 1.5 ~/ 100);
    return value;
  }

  int drawingDesign(drawingValue) {
    int value = ((worCost ~/ 2) +
        layCost +
        flpCost +
        fouCost +
        colCost +
        rccCost +
        pbpCost);
    return value;
  }

  int setsOfDrawingFees(setsOfDrawing) {
    int value = ((worCost ~/ 2) +
        opeCost +
        griCost +
        builCost +
        d2Cost +
        staCost +
        linCost +
        efpCost);
    return value;
  }

  int handingOverFees(handingOver) {
    int value = (bouCost + raiCost + entCost + slaCost + pspCost + hvacCost);
    return value;
  }

  int designFeesPartA(designFeesA) {
    int value = conCost +
        d3Cost +
        drawingDesign(drawingValue) +
        setsOfDrawingFees(setsOfDrawing) +
        handingOverFees(handingOver);
    return value;
  }

  int designFeesPartB(designFeesB) {
    int value = flpCost +
        fcdCost +
        floCost +
        edpCost +
        tddCost +
        ssdCost +
        eswCost +
        mscCost;
    return value;
  }

  int payDesignFees(payDesFees) {
    payDesFees = conCost;

    if (D3FrontRequirment == true) {
      payDesFees = payDesFees + d3Cost;
    }

    if (DrawingRequirment == true) {
      payDesFees = payDesFees + drawingDesign(drawingValue);
    }

    if (SetofRequirment == true) {
      payDesFees = payDesFees + setsOfDrawingFees(setsOfDrawing);
    }

    if (HandingRequirment == true) {
      payDesFees = payDesFees + handingOverFees(handingOver);
    }

    if (WithSuperRequirment == true) {
      payDesFees = payDesFees + superCost;
    }

    if (FurnitureLayoutRequirment == true) {
      payDesFees = payDesFees + flpCost;
    }

    if (CeilingRequirment == true) {
      payDesFees = payDesFees + fcdCost + floCost;
    }

    if (ToiletDadoRequirment == true) {
      payDesFees = payDesFees + edpCost + tddCost + ssdCost;
    }

    if (EachRequirment == true) {
      payDesFees = payDesFees + eswCost;
    }

    if (MaterialSelectionRequirment == true) {
      payDesFees = payDesFees + mscCost;
    }

    return (payDesFees);
  }
  // int () {}

}
