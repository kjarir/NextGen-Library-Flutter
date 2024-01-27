import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PDFViewer(
            pdfPath:
                'assets/books/book1.pdf'), // Replace with your PDF file path
      ),
    );
  }
}

class PDFViewer extends StatelessWidget {
  final String pdfPath;

  PDFViewer({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: pdfPath,
        onPageChanged: (int? page, int? total) {
          if (page != null && total != null) {
            print('Page changed: $page/$total');
          }
        },
        onViewCreated: (PDFViewController pdfViewController) {
          print('PDFView initialized');
          // You can use pdfViewController to interact with the PDF view
        },
      ),
    );
  }
}
