// ignore_for_file: non_constant_identifier_names, unused_local_variable, avoid_print, sort_child_properties_last, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

// import 'dart:ui';
import 'dart:convert';
import 'package:aashiyan/components/constant.dart';
import 'package:aashiyan/view/residential/bunglow/payment.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/forms.dart';
import '../../../const.dart';

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

  int calculation() {
    if (SuperRequirment == true) {
      projectCost = totalBuild * superService;
      if (ArcDesStatus == true) {
        architecturalValue = projectCost * 2 ~/ 100 * 50 ~/ 100;
        print(architecturalValue);
        if (ConceptRequirment == true) {
          conCost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
        } else {
          conCost = INT_ZERO;
          d3Cost = INT_ZERO;
          worCost = INT_ZERO;
          opeCost = INT_ZERO;
          griCost = INT_ZERO;
          builCost = INT_ZERO;
          d2Cost = INT_ZERO;
          bouCost = INT_ZERO;
          raiCost = INT_ZERO;
          entCost = INT_ZERO;
        }
        if (D3Requirment == true) {
          d3Cost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
        } else {
          d3Cost = 0;
        }
        arcRemainingFees = architecturalValue - (conCost * 2);
        if (WorkingRequirment == true) {
          worCost = arcRemainingFees * 30 ~/ 100;
        } else {
          worCost = 0;
        }
        if (OpeningRequirment == true) {
          opeCost = arcRemainingFees * 10 ~/ 100;
        } else {
          opeCost = 0;
        }
        if (GrillRequirment == true) {
          griCost = arcRemainingFees * 5 ~/ 100;
        } else {
          griCost = 0;
        }
        if (BuildingRequirment == true) {
          builCost = arcRemainingFees * 10 ~/ 100;
        } else {
          builCost = 0;
        }
        if (D2Requirment == true) {
          d2Cost = arcRemainingFees * 20 ~/ 100;
        } else {
          d2Cost = 0;
        }
        if (BoundaryRequirment == true) {
          bouCost = arcRemainingFees * 15 ~/ 100;
        } else {
          bouCost = 0;
        }
        if (RailingRequirment == true) {
          raiCost = arcRemainingFees * 5 ~/ 100;
        } else {
          raiCost = 0;
        }
        if (EntranceRequirment == true) {
          entCost = arcRemainingFees * 5 ~/ 100;
        } else {
          entCost = 0;
        }
      }
      if (strDesStatus == true) {
        structuralValue = projectCost * 2 ~/ 100 * 35 ~/ 100;
        if (LayoutRequirment == true) {
          layCost = structuralValue * 10 ~/ 100;
        } else {
          layCost = 0;
        }
        if (FoundationPlanRequirment == true) {
          fppCost = structuralValue * 15 ~/ 100;
        } else {
          fppCost = 0;
        }
        if (FoundationDetailsRequirment == true) {
          fouCost = structuralValue * 10 ~/ 100;
        } else {
          fouCost = 0;
        }
        if (ColumnRequirment == true) {
          colCost = structuralValue * 15 ~/ 100;
        } else {
          colCost = 0;
        }
        if (RccRequirment == true) {
          rccCost = structuralValue * 5 ~/ 100;
        } else {
          rccCost = 0;
        }
        // pbpCost = structuralValue * 10 ~/ 100;

        if (StairsRequirment == true) {
          staCost = structuralValue * 5 ~/ 100;
        } else {
          staCost = 0;
        }
        if (LintelRequirment == true) {
          linCost = structuralValue * 10 ~/ 100;
        } else {
          linCost = 0;
        }
        if (SlabRequirment == true) {
          slaCost = structuralValue * 20 ~/ 100;
        } else {
          slaCost = 0;
        }
      }
      if (BuilDesStatus == true) {
        buildingValue = projectCost * 2 ~/ 100 * 15 ~/ 100;
        if (ElectricRequirment == true) {
          efpCost = buildingValue * 40 ~/ 100;
        } else {
          efpCost = 0;
        }
        if (PlumbingRequirment == true) {
          pspCost = buildingValue * 40 ~/ 100;
        } else {
          pspCost = 0;
        }
        if (HVACRequirment == true) {
          hvacCost = buildingValue * 20 ~/ 100;
        } else {
          hvacCost = 0;
        }
      }
      if (VisionRequirment == true) {
        superCost = projectCost * .25 ~/ 100;
      } else {
        superCost = 0;
      }
      if (IntDesStatus == true) {
        interiorValue = projectCost * 1.5 ~/ 100;
        if (FurnitureRequirment == true) {
          flpCost = interiorValue * 10 ~/ 100;
        } else {
          flpCost = 0;
        }
        if (FalseRequirment == true) {
          fcdCost = interiorValue * 15 ~/ 100;
        } else {
          fcdCost = 0;
        }
        if (FlooringRequirment == true) {
          floCost = interiorValue * 10 ~/ 100;
        } else {
          floCost = 0;
        }
        if (ElectricalRequirment == true) {
          edpCost = interiorValue * 5 ~/ 100;
        } else {
          edpCost = 0;
        }
        if (StairStepRequirment == true) {
          ssdCost = interiorValue * 10 ~/ 100;
        } else {
          ssdCost = 0;
        }
        if (EachSpaceRequirment == true) {
          eswCost = interiorValue * 30 ~/ 100;
        } else {
          eswCost = 0;
        }
        if (ToiletRequirment == true) {
          tddCost = interiorValue * 10 ~/ 100;
        } else {
          tddCost = 0;
        }
        if (MaterialRequirment == true) {
          mscCost = interiorValue * 10 ~/ 100;
        } else {
          mscCost = 0;
        }
      }
      drawingUptoPlinth = (worCost ~/ 2) +
          layCost +
          fppCost +
          fouCost +
          colCost +
          rccCost +
          pbpCost;
      setsOfDrawing = (worCost ~/ 2) +
          opeCost +
          griCost +
          builCost +
          d2Cost +
          staCost +
          linCost +
          efpCost;
      handingOver = bouCost + raiCost + entCost + slaCost + pspCost + hvacCost;
      designFeesA =
          conCost + d3Cost + drawingUptoPlinth + setsOfDrawing + handingOver;
      designFeesB = flpCost +
          fcdCost +
          floCost +
          edpCost +
          ssdCost +
          eswCost +
          tddCost +
          mscCost;

      payDesFees = conCost;

      if (D3FrontRequirment == true) {
        payDesFees = payDesFees + d3Cost;
      }

      if (DrawingRequirment == true) {
        payDesFees = payDesFees + drawingUptoPlinth;
      }

      if (SetofRequirment == true) {
        payDesFees = payDesFees + setsOfDrawing;
      }

      if (HandingRequirment == true) {
        payDesFees = payDesFees + handingOver;
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
    } else if (PremiumRequirment == true) {
      projectCost = totalBuild * premiumService;
      if (ArcDesStatus == true) {
        architecturalValue = projectCost * 2 ~/ 100 * 50 ~/ 100;
        print(architecturalValue);
        if (ConceptRequirment == true) {
          conCost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
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
        if (D3Requirment == true) {
          d3Cost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
        } else {
          d3Cost = 0;
        }
        arcRemainingFees = architecturalValue - (conCost * 2);
        if (WorkingRequirment == true) {
          worCost = arcRemainingFees * 30 ~/ 100;
        } else {
          worCost = 0;
        }
        if (OpeningRequirment == true) {
          opeCost = arcRemainingFees * 10 ~/ 100;
        } else {
          opeCost = 0;
        }
        if (GrillRequirment == true) {
          griCost = arcRemainingFees * 5 ~/ 100;
        } else {
          griCost = 0;
        }
        if (BuildingRequirment == true) {
          builCost = arcRemainingFees * 10 ~/ 100;
        } else {
          builCost = 0;
        }
        if (D2Requirment == true) {
          d2Cost = arcRemainingFees * 20 ~/ 100;
        } else {
          d2Cost = 0;
        }
        if (BoundaryRequirment == true) {
          bouCost = arcRemainingFees * 15 ~/ 100;
        } else {
          bouCost = 0;
        }
        if (RailingRequirment == true) {
          raiCost = arcRemainingFees * 5 ~/ 100;
        } else {
          raiCost = 0;
        }
        if (EntranceRequirment == true) {
          entCost = arcRemainingFees * 5 ~/ 100;
        } else {
          entCost = 0;
        }
      }
      if (strDesStatus == true) {
        structuralValue = projectCost * 2 ~/ 100 * 35 ~/ 100;
        if (LayoutRequirment == true) {
          layCost = structuralValue * 10 ~/ 100;
        } else {
          layCost = 0;
        }
        if (FoundationPlanRequirment == true) {
          fppCost = structuralValue * 15 ~/ 100;
        } else {
          fppCost = 0;
        }
        if (FoundationDetailsRequirment == true) {
          fouCost = structuralValue * 10 ~/ 100;
        } else {
          fouCost = 0;
        }
        if (ColumnRequirment == true) {
          colCost = structuralValue * 15 ~/ 100;
        } else {
          colCost = 0;
        }
        if (RccRequirment == true) {
          rccCost = structuralValue * 5 ~/ 100;
        } else {
          rccCost = 0;
        }
        // pbpCost = structuralValue * 10 ~/ 100;

        if (StairsRequirment == true) {
          staCost = structuralValue * 5 ~/ 100;
        } else {
          staCost = 0;
        }
        if (LintelRequirment == true) {
          linCost = structuralValue * 10 ~/ 100;
        } else {
          linCost = 0;
        }
        if (SlabRequirment == true) {
          slaCost = structuralValue * 20 ~/ 100;
        } else {
          slaCost = 0;
        }
      }
      if (BuilDesStatus == true) {
        buildingValue = projectCost * 2 ~/ 100 * 15 ~/ 100;
        if (ElectricRequirment == true) {
          efpCost = buildingValue * 40 ~/ 100;
        } else {
          efpCost = 0;
        }
        if (PlumbingRequirment == true) {
          pspCost = buildingValue * 40 ~/ 100;
        } else {
          pspCost = 0;
        }
        if (HVACRequirment == true) {
          hvacCost = buildingValue * 20 ~/ 100;
        } else {
          hvacCost = 0;
        }
      }
      if (VisionRequirment == true) {
        superCost = projectCost * .25 ~/ 100;
      } else {
        superCost = 0;
      }
      if (IntDesStatus == true) {
        interiorValue = projectCost * 1.5 ~/ 100;
        if (FurnitureRequirment == true) {
          flpCost = interiorValue * 10 ~/ 100;
        } else {
          flpCost = 0;
        }
        if (FalseRequirment == true) {
          fcdCost = interiorValue * 15 ~/ 100;
        } else {
          fcdCost = 0;
        }
        if (FlooringRequirment == true) {
          floCost = interiorValue * 10 ~/ 100;
        } else {
          floCost = 0;
        }
        if (ElectricalRequirment == true) {
          edpCost = interiorValue * 5 ~/ 100;
        } else {
          edpCost = 0;
        }
        if (StairStepRequirment == true) {
          ssdCost = interiorValue * 10 ~/ 100;
        } else {
          ssdCost = 0;
        }
        if (EachSpaceRequirment == true) {
          eswCost = interiorValue * 30 ~/ 100;
        } else {
          eswCost = 0;
        }
        if (ToiletRequirment == true) {
          tddCost = interiorValue * 10 ~/ 100;
        } else {
          tddCost = 0;
        }
        if (MaterialRequirment == true) {
          mscCost = interiorValue * 10 ~/ 100;
        } else {
          mscCost = 0;
        }
      }
      drawingUptoPlinth = (worCost ~/ 2) +
          layCost +
          fppCost +
          fouCost +
          colCost +
          rccCost +
          pbpCost;
      setsOfDrawing = (worCost ~/ 2) +
          opeCost +
          griCost +
          builCost +
          d2Cost +
          staCost +
          linCost +
          efpCost;
      handingOver = bouCost + raiCost + entCost + slaCost + pspCost + hvacCost;
      designFeesA =
          conCost + d3Cost + drawingUptoPlinth + setsOfDrawing + handingOver;
      designFeesB = flpCost +
          fcdCost +
          floCost +
          edpCost +
          ssdCost +
          eswCost +
          tddCost +
          mscCost;

      payDesFees = conCost;

      if (D3FrontRequirment == true) {
        payDesFees = payDesFees + d3Cost;
      }

      if (DrawingRequirment == true) {
        payDesFees = payDesFees + drawingUptoPlinth;
      }

      if (SetofRequirment == true) {
        payDesFees = payDesFees + setsOfDrawing;
      }

      if (HandingRequirment == true) {
        payDesFees = payDesFees + handingOver;
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
    } else if (StandardRequirment == true) {
      projectCost = totalBuild * standardService;
      if (ArcDesStatus == true) {
        architecturalValue = projectCost * 2 ~/ 100 * 50 ~/ 100;
        print(architecturalValue);
        if (ConceptRequirment == true) {
          conCost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
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
        if (D3Requirment == true) {
          d3Cost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
        } else {
          d3Cost = 0;
        }
        arcRemainingFees = architecturalValue - (conCost * 2);
        if (WorkingRequirment == true) {
          worCost = arcRemainingFees * 30 ~/ 100;
        } else {
          worCost = 0;
        }
        if (OpeningRequirment == true) {
          opeCost = arcRemainingFees * 10 ~/ 100;
        } else {
          opeCost = 0;
        }
        if (GrillRequirment == true) {
          griCost = arcRemainingFees * 5 ~/ 100;
        } else {
          griCost = 0;
        }
        if (BuildingRequirment == true) {
          builCost = arcRemainingFees * 10 ~/ 100;
        } else {
          builCost = 0;
        }
        if (D2Requirment == true) {
          d2Cost = arcRemainingFees * 20 ~/ 100;
        } else {
          d2Cost = 0;
        }
        if (BoundaryRequirment == true) {
          bouCost = arcRemainingFees * 15 ~/ 100;
        } else {
          bouCost = 0;
        }
        if (RailingRequirment == true) {
          raiCost = arcRemainingFees * 5 ~/ 100;
        } else {
          raiCost = 0;
        }
        if (EntranceRequirment == true) {
          entCost = arcRemainingFees * 5 ~/ 100;
        } else {
          entCost = 0;
        }
      }
      if (strDesStatus == true) {
        structuralValue = projectCost * 2 ~/ 100 * 35 ~/ 100;
        if (LayoutRequirment == true) {
          layCost = structuralValue * 10 ~/ 100;
        } else {
          layCost = 0;
        }
        if (FoundationPlanRequirment == true) {
          fppCost = structuralValue * 15 ~/ 100;
        } else {
          fppCost = 0;
        }
        if (FoundationDetailsRequirment == true) {
          fouCost = structuralValue * 10 ~/ 100;
        } else {
          fouCost = 0;
        }
        if (ColumnRequirment == true) {
          colCost = structuralValue * 15 ~/ 100;
        } else {
          colCost = 0;
        }
        if (RccRequirment == true) {
          rccCost = structuralValue * 5 ~/ 100;
        } else {
          rccCost = 0;
        }
        // pbpCost = structuralValue * 10 ~/ 100;

        if (StairsRequirment == true) {
          staCost = structuralValue * 5 ~/ 100;
        } else {
          staCost = 0;
        }
        if (LintelRequirment == true) {
          linCost = structuralValue * 10 ~/ 100;
        } else {
          linCost = 0;
        }
        if (SlabRequirment == true) {
          slaCost = structuralValue * 20 ~/ 100;
        } else {
          slaCost = 0;
        }
      }
      if (BuilDesStatus == true) {
        buildingValue = projectCost * 2 ~/ 100 * 15 ~/ 100;
        if (ElectricRequirment == true) {
          efpCost = buildingValue * 40 ~/ 100;
        } else {
          efpCost = 0;
        }
        if (PlumbingRequirment == true) {
          pspCost = buildingValue * 40 ~/ 100;
        } else {
          pspCost = 0;
        }
        if (HVACRequirment == true) {
          hvacCost = buildingValue * 20 ~/ 100;
        } else {
          hvacCost = 0;
        }
      }
      if (VisionRequirment == true) {
        superCost = projectCost * .25 ~/ 100;
      } else {
        superCost = 0;
      }
      if (IntDesStatus == true) {
        interiorValue = projectCost * 1.5 ~/ 100;
        if (FurnitureRequirment == true) {
          flpCost = interiorValue * 10 ~/ 100;
        } else {
          flpCost = 0;
        }
        if (FalseRequirment == true) {
          fcdCost = interiorValue * 15 ~/ 100;
        } else {
          fcdCost = 0;
        }
        if (FlooringRequirment == true) {
          floCost = interiorValue * 10 ~/ 100;
        } else {
          floCost = 0;
        }
        if (ElectricalRequirment == true) {
          edpCost = interiorValue * 5 ~/ 100;
        } else {
          edpCost = 0;
        }
        if (StairStepRequirment == true) {
          ssdCost = interiorValue * 10 ~/ 100;
        } else {
          ssdCost = 0;
        }
        if (EachSpaceRequirment == true) {
          eswCost = interiorValue * 30 ~/ 100;
        } else {
          eswCost = 0;
        }
        if (ToiletRequirment == true) {
          tddCost = interiorValue * 10 ~/ 100;
        } else {
          tddCost = 0;
        }
        if (MaterialRequirment == true) {
          mscCost = interiorValue * 10 ~/ 100;
        } else {
          mscCost = 0;
        }
      }
      drawingUptoPlinth = (worCost ~/ 2) +
          layCost +
          fppCost +
          fouCost +
          colCost +
          rccCost +
          pbpCost;
      setsOfDrawing = (worCost ~/ 2) +
          opeCost +
          griCost +
          builCost +
          d2Cost +
          staCost +
          linCost +
          efpCost;
      handingOver = bouCost + raiCost + entCost + slaCost + pspCost + hvacCost;
      designFeesA =
          conCost + d3Cost + drawingUptoPlinth + setsOfDrawing + handingOver;
      designFeesB = flpCost +
          fcdCost +
          floCost +
          edpCost +
          ssdCost +
          eswCost +
          tddCost +
          mscCost;

      payDesFees = conCost;

      if (D3FrontRequirment == true) {
        payDesFees = payDesFees + d3Cost;
      }

      if (DrawingRequirment == true) {
        payDesFees = payDesFees + drawingUptoPlinth;
      }

      if (SetofRequirment == true) {
        payDesFees = payDesFees + setsOfDrawing;
      }

      if (HandingRequirment == true) {
        payDesFees = payDesFees + handingOver;
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
    } else if (BasicRequirment == true) {
      projectCost = totalBuild * basicService;
      if (ArcDesStatus == true) {
        architecturalValue = projectCost * 2 ~/ 100 * 50 ~/ 100;
        print(architecturalValue);
        if (ConceptRequirment == true) {
          conCost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
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
        if (D3Requirment == true) {
          d3Cost = totalBuild * 1800 * 2 ~/ 100 * 15 ~/ 100;
        } else {
          d3Cost = 0;
        }
        arcRemainingFees = architecturalValue - (conCost * 2);
        if (WorkingRequirment == true) {
          worCost = arcRemainingFees * 30 ~/ 100;
        } else {
          worCost = 0;
        }
        if (OpeningRequirment == true) {
          opeCost = arcRemainingFees * 10 ~/ 100;
        } else {
          opeCost = 0;
        }
        if (GrillRequirment == true) {
          griCost = arcRemainingFees * 5 ~/ 100;
        } else {
          griCost = 0;
        }
        if (BuildingRequirment == true) {
          builCost = arcRemainingFees * 10 ~/ 100;
        } else {
          builCost = 0;
        }
        if (D2Requirment == true) {
          d2Cost = arcRemainingFees * 20 ~/ 100;
        } else {
          d2Cost = 0;
        }
        if (BoundaryRequirment == true) {
          bouCost = arcRemainingFees * 15 ~/ 100;
        } else {
          bouCost = 0;
        }
        if (RailingRequirment == true) {
          raiCost = arcRemainingFees * 5 ~/ 100;
        } else {
          raiCost = 0;
        }
        if (EntranceRequirment == true) {
          entCost = arcRemainingFees * 5 ~/ 100;
        } else {
          entCost = 0;
        }
      }
      if (strDesStatus == true) {
        structuralValue = projectCost * 2 ~/ 100 * 35 ~/ 100;
        if (LayoutRequirment == true) {
          layCost = structuralValue * 10 ~/ 100;
        } else {
          layCost = 0;
        }
        if (FoundationPlanRequirment == true) {
          fppCost = structuralValue * 15 ~/ 100;
        } else {
          fppCost = 0;
        }
        if (FoundationDetailsRequirment == true) {
          fouCost = structuralValue * 10 ~/ 100;
        } else {
          fouCost = 0;
        }
        if (ColumnRequirment == true) {
          colCost = structuralValue * 15 ~/ 100;
        } else {
          colCost = 0;
        }
        if (RccRequirment == true) {
          rccCost = structuralValue * 5 ~/ 100;
        } else {
          rccCost = 0;
        }
        // pbpCost = structuralValue * 10 ~/ 100;

        if (StairsRequirment == true) {
          staCost = structuralValue * 5 ~/ 100;
        } else {
          staCost = 0;
        }
        if (LintelRequirment == true) {
          linCost = structuralValue * 10 ~/ 100;
        } else {
          linCost = 0;
        }
        if (SlabRequirment == true) {
          slaCost = structuralValue * 20 ~/ 100;
        } else {
          slaCost = 0;
        }
      }
      if (BuilDesStatus == true) {
        buildingValue = projectCost * 2 ~/ 100 * 15 ~/ 100;
        if (ElectricRequirment == true) {
          efpCost = buildingValue * 40 ~/ 100;
        } else {
          efpCost = 0;
        }
        if (PlumbingRequirment == true) {
          pspCost = buildingValue * 40 ~/ 100;
        } else {
          pspCost = 0;
        }
        if (HVACRequirment == true) {
          hvacCost = buildingValue * 20 ~/ 100;
        } else {
          hvacCost = 0;
        }
      }
      if (VisionRequirment == true) {
        superCost = projectCost * .25 ~/ 100;
      } else {
        superCost = 0;
      }
      if (IntDesStatus == true) {
        interiorValue = projectCost * 1.5 ~/ 100;
        if (FurnitureRequirment == true) {
          flpCost = interiorValue * 10 ~/ 100;
        } else {
          flpCost = 0;
        }
        if (FalseRequirment == true) {
          fcdCost = interiorValue * 15 ~/ 100;
        } else {
          fcdCost = 0;
        }
        if (FlooringRequirment == true) {
          floCost = interiorValue * 10 ~/ 100;
        } else {
          floCost = 0;
        }
        if (ElectricalRequirment == true) {
          edpCost = interiorValue * 5 ~/ 100;
        } else {
          edpCost = 0;
        }
        if (StairStepRequirment == true) {
          ssdCost = interiorValue * 10 ~/ 100;
        } else {
          ssdCost = 0;
        }
        if (EachSpaceRequirment == true) {
          eswCost = interiorValue * 30 ~/ 100;
        } else {
          eswCost = 0;
        }
        if (ToiletRequirment == true) {
          tddCost = interiorValue * 10 ~/ 100;
        } else {
          tddCost = 0;
        }
        if (MaterialRequirment == true) {
          mscCost = interiorValue * 10 ~/ 100;
        } else {
          mscCost = 0;
        }
      }
      drawingUptoPlinth = (worCost ~/ 2) +
          layCost +
          fppCost +
          fouCost +
          colCost +
          rccCost +
          pbpCost;
      setsOfDrawing = (worCost ~/ 2) +
          opeCost +
          griCost +
          builCost +
          d2Cost +
          staCost +
          linCost +
          efpCost;
      handingOver = bouCost + raiCost + entCost + slaCost + pspCost + hvacCost;
      designFeesA =
          conCost + d3Cost + drawingUptoPlinth + setsOfDrawing + handingOver;
      designFeesB = flpCost +
          fcdCost +
          floCost +
          edpCost +
          ssdCost +
          eswCost +
          tddCost +
          mscCost;

      payDesFees = conCost;

      if (D3FrontRequirment == true) {
        payDesFees = payDesFees + d3Cost;
      }

      if (DrawingRequirment == true) {
        payDesFees = payDesFees + drawingUptoPlinth;
      }

      if (SetofRequirment == true) {
        payDesFees = payDesFees + setsOfDrawing;
      }

      if (HandingRequirment == true) {
        payDesFees = payDesFees + handingOver;
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
    }
    return 0;
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

  bool? ArcDesStatus = false;
  bool? strDesStatus = false;
  bool? BuilDesStatus = false;
  bool? IntDesStatus = false;

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
  var drawingUptoPlinth = 0;
  var setsOfDrawing = 0;
  var handingOver = 0;
  var designFeesA = 0;
  var designFeesB = 0;
  // var payDesFees = 0;
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

// - - - - - - - Categories- - - - - - - - - - - -

  var architecturalValue = 0;
  var structuralValue = 0;
  var buildingValue = 0;
  var interiorValue = 0;

// - - - - - - - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    if (getData != null) {
      ar_design = getData['ar_design'];
      str_design = getData['str_design'];
      mep_design = getData['mep_design'];
      int_design = getData['int_design'];
    }

    // ignore: unnecessary_null_comparison
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
                          color: primaryColor,
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
                            color: primaryColor,
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
                          color: primaryColor,
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
                          color: primaryColor,
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
                            color: primaryColor,
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
                          color: primaryColor,
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
                                                if (SuperRequirment == true) {
                                                  calculation();
                                                } else {
                                                  projectCost = 0;
                                                }
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
                                                calculation();
                                                if (PremiumRequirment == true) {
                                                } else {
                                                  projectCost = 0;
                                                }
                                                print(projectCost);
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
                                                calculation();
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
                                                calculation();
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
                          color: primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                requirementText("Total Project Cost"),
                                // ignore: unnecessary_brace_in_string_interps
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
                            color: primaryColor,
                            padding: const EdgeInsets.all(0),
                            child: ExpansionTile(
                              // backgroundColor: Colors.white,
                              collapsedBackgroundColor: primaryColor,
                              collapsedTextColor: Colors.black,
                              onExpansionChanged: (value) {
                                ArcDesStatus = value;
                              },
                              textColor: Colors.black,
                              title: headingFont('Architectural Design'),

                              children: [
                                Card(
                                  child: Container(
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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

                                                      calculation();
                                                      print(conCost);
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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

                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: WorkingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design3Percent = double
                                                          .parse(ar_design[2][
                                                              'design_percent']);
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        WorkingRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      WorkingNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: OpeningRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design4Percent = double
                                                          .parse(ar_design[3][
                                                              'design_percent']);
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        OpeningRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      OpeningNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      GrillNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: BuildingRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design6Percent = double
                                                          .parse(ar_design[5][
                                                              'design_percent']);
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        BuildingRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      BuildingNotRequire =
                                                          false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      D2NotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: BoundaryRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var design8Percent = double
                                                          .parse(ar_design[7][
                                                              'design_percent']);
                                                      if (ConceptRequirment ==
                                                          true) {
                                                        BoundaryRequirment =
                                                            value;
                                                      } else {
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      BoundaryNotRequire =
                                                          false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      RailingNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                            builder: (context) =>
                                                                alertBox(
                                                                    context));
                                                      }
                                                      EntranceNotRequire =
                                                          false;
                                                      calculation();
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
                            color: primaryColor,
                            // height: 200,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              textColor: Colors.black,
                              onExpansionChanged: (value) {
                                strDesStatus = value;
                                print(structuralValue);
                              },
                              collapsedTextColor: Colors.black,
                              title: headingFont('Structural Design'),
                              children: [
                                Card(
                                  child: Container(
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();

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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                                Colors.black,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }
                                                      StairsNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: LintelRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign7 = double
                                                          .parse(str_design[6][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        LintelRequirment =
                                                            value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }
                                                      LintelNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: SlabRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var strDesign8 = double
                                                          .parse(str_design[7][
                                                              'design_percent']);

                                                      if (SuperRequirment == true ||
                                                          BasicRequirment ==
                                                              true ||
                                                          StandardRequirment ==
                                                              true ||
                                                          PremiumRequirment ==
                                                              true) {
                                                        SlabRequirment = value;
                                                      } else {
                                                        Fluttertoast.showToast(
                                                            backgroundColor:
                                                                Colors.white,
                                                            textColor:
                                                                Colors.black,
                                                            msg:
                                                                'Kindly Select Specification First');
                                                      }

                                                      SlabNotRequire = false;
                                                      calculation();
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
                            color: primaryColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              onExpansionChanged: (value) {
                                BuilDesStatus = value;
                              },
                              collapsedTextColor: Colors.black,
                              textColor: Colors.black,
                              title: headingFont('Building Service'),
                              children: [
                                Card(
                                  child: Container(
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: HVACRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var mep3 = double.parse(
                                                          mep_design[2][
                                                              'design_percent']);
                                                      HVACRequirment = value;
                                                      HVACNotRequire = false;
                                                      calculation();
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
                              color: primaryColor,
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: checkColor,
                                          value: VisionRequirment,
                                          onChanged: (value) {
                                            setState(
                                              () {
                                                VisionRequirment = value;
                                                VisionNotRequire = false;
                                                calculation();
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
                                      items: const [],
                                      onChanged: (it) =>
                                          setState(() => country = it!)),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            color: primaryColor,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ExpansionTile(
                              textColor: Colors.black,
                              collapsedTextColor: Colors.black,
                              onExpansionChanged: (value) {
                                IntDesStatus = value;
                                // print(projectCost);
                                print(interiorValue);
                              },
                              title: headingFont('Interior Design'),
                              children: [
                                Card(
                                  child: Container(
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: FalseRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD2 = double.parse(
                                                          int_design[1][
                                                              'design_percent']);
                                                      FalseRequirment = value;
                                                      FalseNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: ElectricalRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      ElectricalRequirment =
                                                          value;
                                                      ElectricalNotRequire =
                                                          false;
                                                      calculation();
                                                    },
                                                  );
                                                }),
                                            requirementText(
                                                int_design[3]['design']),
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
                                                value: ToiletRequirment,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      var intD7 = double.parse(
                                                          int_design[6][
                                                              'design_percent']);
                                                      ToiletRequirment = value;
                                                      ToiletNotRequire = false;
                                                      calculation();
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
                                    color: requirementColor,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                                activeColor: checkColor,
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
                                                      calculation();
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
                  color: primaryColor,
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
                                  child: Checkbox(
                                      activeColor: checkColor,
                                      value: AtGoodRequirment,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            AtGoodRequirment = true;
                                            // AtGoodNotRequire = true;
                                            calculation();
                                          },
                                        );
                                      }),
                                  // decoration: BoxDecoration(
                                  //     color: checkColor,
                                  //     borderRadius: BorderRadius.circular(1)),
                                  // child: Icon(
                                  //   Icons.check,
                                  //   color: Colors.white,
                                  //   size: 18,
                                  // ),
                                )
                              ]),
                              Column(children: [
                                InkWell(
                                  child: Text('$conCost'),
                                  onTap: (() {
                                    calculation();
                                    print(conCost);
                                  }),
                                )
                              ]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('2.')]),
                              Column(
                                  children: const [Text('3D Front Elevation')]),
                              Column(children: const [Text('7 Days')]),
                              Column(children: [
                                Checkbox(
                                    activeColor: checkColor,
                                    value: D3FrontRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          D3FrontRequirment = value;
                                          D3FrontNotRequire = false;
                                          calculation();
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
                                    activeColor: checkColor,
                                    value: DrawingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          DrawingRequirment = value;
                                          DrawingNotRequire = false;
                                          calculation();
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$drawingUptoPlinth')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('4.')]),
                              Column(children: const [
                                Text('Sets of Drawings(Start)')
                              ]),
                              Column(children: const [Text('30 Days')]),
                              Column(children: [
                                Checkbox(
                                    activeColor: checkColor,
                                    value: SetofRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          SetofRequirment = value;
                                          SetofNotRequire = false;
                                          calculation();
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$setsOfDrawing')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('5.')]),
                              Column(
                                  children: const [Text('Handing Over Ste')]),
                              Column(children: const [Text('---')]),
                              Column(children: [
                                Checkbox(
                                    activeColor: checkColor,
                                    value: HandingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          HandingRequirment = value;
                                          HandingNotRequire = false;
                                          calculation();
                                        },
                                      );
                                    }),
                              ]),
                              Column(children: [Text('$handingOver')]),
                            ]),
                            TableRow(children: [
                              Column(children: const [Text('6.')]),
                              Column(
                                  children: const [Text('With Super Vision')]),
                              Column(children: const [Text('---')]),
                              Column(children: [
                                Checkbox(
                                    activeColor: checkColor,
                                    value: WithSuperRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          WithSuperRequirment = value;
                                          WithSuperNotRequire = false;
                                          calculation();
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
                                requirementText('$designFeesA'),
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
                                    activeColor: checkColor,
                                    value: FurnitureLayoutRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          FurnitureLayoutRequirment = value;
                                          FurnitureLayoutNotRequire = false;
                                          calculation();
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
                                    activeColor: checkColor,
                                    value: CeilingRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          CeilingRequirment = value;
                                          CeilingNotRequire = false;
                                          calculation();
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
                                    activeColor: checkColor,
                                    value: ToiletDadoRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          ToiletDadoRequirment = value;
                                          ToiletDadoNotRequire = false;
                                          calculation();
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
                                    activeColor: checkColor,
                                    value: EachRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          EachRequirment = value;
                                          EachNotRequire = false;
                                          calculation();
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
                                    activeColor: checkColor,
                                    value: MaterialSelectionRequirment,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          MaterialSelectionRequirment = value;
                                          MaterialSelectionNotRequire = false;
                                          calculation();
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
                                requirementText('$designFeesB'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: primaryColor,
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
                                  child: requirementText('$payDesFees'),
                                ),
                                requirementText(
                                    '${designFeesA + designFeesB + superCost}'),
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
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: buttonColor,
                                  ),
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
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          payDesFees = payDesFees;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Payment()));
                                      },
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
                ),
              ],
            ),
          );
  }

  AlertDialog alertBox(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text(
          'Kindly finallize Conceptual and Elevation plan to proceed further!'),
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
}
