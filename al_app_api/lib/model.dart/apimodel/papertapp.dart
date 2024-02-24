import 'dart:async';
import 'dart:io';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import '../../apijson/cmathsjsn.dart';

import '../Home/imageModel.dart';

// void main() {
//   runApp(BBBB());
// }

class Paper1 extends StatefulWidget {
  const Paper1({super.key, required this.userPet});
  final Datum userPet;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Paper1> {
  // final sampleUrl =
  //     "https://pastpapers.wiki/download/14272/2021-a-l-past-papers/52726/2021-al-physics-past-paper-sinhala-medium.pdf";
  // final sampleUrl =widget.userPet.paper;

  String? pdfFlePath;

  Future<String> downloadAndSavePdf() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/bb');
    // if (await file.exists()) {
    //   return file.path;
    // }
    final response = await http.get(Uri.parse(widget.userPet.paper));
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }

  void loadPdf() async {
    pdfFlePath = await downloadAndSavePdf();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loadPdf();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colorlab.black,
            // appBar: AppBar(
            //   title: Text('Plugin example app'),
            // ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                FileDownloader.downloadFile(
                  url: widget.userPet.paper,
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Downloaded'),
                      content: Text('Go => File => Document or Download'),
                      actions: [
                        // TextButton(
                        //   onPressed: () => Navigator.pop(context, 'Cancel'),
                        //   child: Text('Cancel'),
                        // ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              backgroundColor: Colorlab.blue,
              child: const Icon(Icons.download),
            ),
            body: Center(
              child: Column(
                children: <Widget>[
                  // ElevatedButton(
                  //   child: Text("Load pdf"),
                  //   onPressed: loadPdf,
                  // ),
                  if (pdfFlePath == null)
                    const CircularProgressIndicator() // Show CircularProgressIndicator if pdfFlePath is null
                  else if (pdfFlePath != null)
                    Expanded(
                      child: Container(
                        child: PdfView(path: pdfFlePath!),
                      ),
                    )
                  else
                    const Text("Pdf is not Loaded"),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
