import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class LGPD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A3F6D),
        title: Text('LGPD'),
      ),
      body: SfPdfViewer.asset(
        'assets/L13709compilado.pdf',
      ),
    );
  }
}
