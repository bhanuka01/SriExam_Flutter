// import 'dart:async';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../apijson/cmathsjsn.dart';

import '../Home/imageModel.dart';

// void main() {
//   runApp(BBBB());
// }

class Marking1 extends StatefulWidget {
  const Marking1({super.key, required this.userPet});
  final Datum userPet;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Marking1> {
  // final sampleUrl =
  //     "https://pastpapers.wiki/download/14272/2021-a-l-past-papers/52726/2021-al-physics-past-paper-sinhala-medium.pdf";
  // final sampleUrl =widget.userPet.paper;

  // String? pdfFlePath;

  // Future<String> downloadAndSavePdf() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/bb');
  //
  //   // if (await file.exists()) {
  //   //   return file.path;
  //   // }
  //   final response = await http.get(Uri.parse(widget.userPet.marking));
  //   await file.writeAsBytes(response.bodyBytes);
  //
  //   return file.path;
  // }

  // void loadPdf() async {
  //   pdfFlePath = await downloadAndSavePdf();
  //   setState(() {});
  // }

  @override
  void initState() {
    super.initState();

    // setState(() {
    //   // loadPdf();
    // });
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
                  url: widget.userPet.marking,
                  notificationType: NotificationType.all
                );
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: "Downloaded",
                  text: 'Go download or document folder',
                );
              },
              backgroundColor: Colorlab.blue,
              child: const Icon(Icons.download),
            ),
            body: Center(
                child: Container(
                  // child: PdfView(path: pdfFlePath!),
                  child: const PDF(
                      autoSpacing: false,
                      swipeHorizontal: false,
                      enableSwipe: true,
                      pageFling: false,
                      fitEachPage: true,
                      pageSnap: true
                  ).cachedFromUrl(widget.userPet.marking),

                  // child: SfPdfViewer.network(
                  //   widget.userPet.paper,
                  //
                  //   controller: _pdfViewerController,
                  //
                  // ),
                )
              // child: Column(
              //   children: <Widget>[
              //     // ElevatedButton(
              //     //   child: Text("Load pdf"),
              //     //   onPressed: loadPdf,
              //     // ),
              //     if (pdfFlePath == null)
              //       Column(
              //         children: const [
              //           CircularProgressIndicator(),
              //           Text(
              //             "File size 20mb .\nwait a minute",
              //             style: TextStyle(
              //               fontSize: 20,
              //               color: Colorlab.white,
              //             ),
              //           )
              //         ],
              //       ) // Show CircularProgressIndicator if pdfFlePath is null
              //     else if (pdfFlePath != null)
              //       Expanded(
              //         child: Container(
              //           // child: PdfView(path: pdfFlePath!),
              //           child:PDF(
              //               autoSpacing: false
              //           ).cachedFromUrl(widget.userPet.paper),
              //
              //           // SfPdfViewer.network(widget.userPet.marking),
              //         ),
              //       )
              //     else
              //       const Text("Pdf is not Loaded"),
              //   ],
              // ),
            ),
          ),
        );
      }),
    );
  }
}
