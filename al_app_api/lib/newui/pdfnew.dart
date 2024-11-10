import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class PdfViewPage extends StatefulWidget {
  final String url;

  const PdfViewPage(this.url, {super.key});

  @override
  State<PdfViewPage> createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: SafeArea(
        child: const PDF(
                autoSpacing: false,
                swipeHorizontal: false,
                enableSwipe: true,
                pageFling: false,
                fitEachPage: true,
                pageSnap: true)
            .cachedFromUrl(widget.url),
      ),
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
          QuickAlert.show(
            context: context,
            type: QuickAlertType.loading,
            title: "Downloading",
            text: 'Your paper downloading ',
          );

          FileDownloader.downloadFile(
            url: widget.url,
            notificationType: NotificationType.all,
            onDownloadCompleted: (path) {
              final File file = File(path);
              setState(() {
                Navigator.pop(context);
                    setState(() {
                      QuickAlert.show(
                        context: context,
                        type: QuickAlertType.success,
                        title: "Downloaded",
                        text: 'Go download or document folder',
                      );
                    });
              });


            },
            // onProgress: (String? fileName, double progress) {
            //   // // setState(() => _progress = progress);
            //   // QuickAlert.show(
            //   //   context: context,
            //   //   type: QuickAlertType.loading,
            //   //   title: "Downloading",
            //   //   text: 'Go $fileName $progress',
            //   // );
            //   if (mounted) { // Check if the widget is still mounted
            //     setState(() {});
            //   }
            //
            //
            // },
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
          // QuickAlert.show(
          //   context: context,
          //   type: QuickAlertType.success,
          //   title: "Downloaded",
          //   text: 'Go download or document folder',
          // );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.download),
      ),
    );
  }
}
