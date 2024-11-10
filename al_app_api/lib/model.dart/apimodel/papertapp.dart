// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/services.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../../apijson/cmathsjsn.dart';

// import '../Home/homeModel.dart';
import '../Home/imageModel.dart';
import 'package:quickalert/quickalert.dart';

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

  // String? pdfFlePath;

  // Future<String> downloadAndSavePdf() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final file = File('${directory.path}/bb');
  //   // if (await file.exists()) {
  //   //   return file.path;
  //   // }
  //   final response = await http.get(Uri.parse(widget.userPet.paper));
  //   await file.writeAsBytes(response.bodyBytes);
  //   return file.path;
  // }

  // void loadPdf() async {
  //   // pdfFlePath = await downloadAndSavePdf();
  //   setState(() {});
  // }

  // late PdfViewerController _pdfViewerController;
  @override
  void initState() {
    // _pdfViewerController = PdfViewerController();
    super.initState();
    // setState(() {
    //   loadPdf();
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
              onPressed: () async {
                // try {
                //   final taskId = await FileDownloader.downloadFile(
                //     url: widget.userPet.paper,
                //   );
                // } catch (e) {
                //   print('downloadFile error: $e');
                //   // Show an error message to the user.
                //   if (e is PlatformException && e.code == 1008) {
                //     // Handle storage issue specifically (e.g., show a dialog suggesting clearing space).
                //   }
                // }
                FileDownloader.downloadFile(
                  url: widget.userPet.paper,
                    notificationType: NotificationType.all
                );
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: const Text('Downloaded'),
                //       content: const Text('Go => File => Document or Download'),
                //       actions: [
                //         // TextButton(
                //         //   onPressed: () => Navigator.pop(context, 'Cancel'),
                //         //   child: Text('Cancel'),
                //         // ),
                //         TextButton(
                //           onPressed: () => Navigator.pop(context, 'OK'),
                //           child: const Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
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
                  ).cachedFromUrl(widget.userPet.paper),

                  // child: SfPdfViewer.network(
                  //   widget.userPet.paper,
                  //
                  //   controller: _pdfViewerController,
                  //
                  // ),
                )
                // Column(
                //   children: <Widget>[
                //
                //     // ElevatedButton(
                //     //   child: Text("Load pdf"),
                //     //   onPressed: loadPdf,
                //     // ),
                //     if (pdfFlePath == null)
                //       const LodingPDF() // Show CircularProgressIndicator if pdfFlePath is null
                //     else if (pdfFlePath != null)
                //       Expanded(
                //         child: Container(
                //           // child: PdfView(path: pdfFlePath!),
                //           child:PDF(
                //            autoSpacing: false,
                //             swipeHorizontal: false,
                //             enableSwipe: true,
                //             pageFling: true,
                //             fitEachPage: true,
                //           ).cachedFromUrl(widget.userPet.paper),
                //
                //
                //           // child: SfPdfViewer.network(
                //           //   widget.userPet.paper,
                //           //
                //           //   controller: _pdfViewerController,
                //           //
                //           // ),
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

  // @override
  // void dispose() {
  //   // _pdfViewerController.dispose(); // Dispose of the controller
  //   super.dispose();
  // }
}
