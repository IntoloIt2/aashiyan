// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

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
    // ignore: todo
    // TODO: implement initState
    super.initState();
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Technical Drawing Book'),
      ),
      body: Center(
        child: SfPdfViewer.asset('assets/pdf/technicaldrawingbook.pdf'),
      ),
    );
  }
}
