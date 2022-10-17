import 'package:aashiyan/view/residential/bunglow/requirement.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SampleBookPdf extends StatefulWidget {
  var data;
  SampleBookPdf({super.key});

  @override
  State<SampleBookPdf> createState() => _SampleBookPdfState();
}

class _SampleBookPdfState extends State<SampleBookPdf> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technical Drawing Book'),
      ),
      body: Center(
        child: SfPdfViewer.asset('assets/pdf/technicaldrawingbook.pdf'),
      ),
    );
  }
}
