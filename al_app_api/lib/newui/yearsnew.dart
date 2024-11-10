import 'dart:async';
import 'dart:convert';
import 'package:al_app_api/newui/pdfnew.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Yearsnew extends StatefulWidget {
  final String url1;

  const Yearsnew(this.url1, {super.key});

  @override
  State<Yearsnew> createState() => _YearsnewState();
}

class _YearsnewState extends State<Yearsnew> {
  List<dynamic> users = [];
  bool isDataLoaded = false;

  Future<void> fetchdata() async {
    var url = widget.url1;
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      setState(() {
        isDataLoaded = true;
      });
      final json = jsonDecode(body);
      setState(() {
        users = json['data'];
      });
    } else {}
  }

  @override
  void initState() {
    super.initState();
    fetchdata();
    // initbannerad();
    // _loadInterstitialAd();

    if (!isDataLoaded) {
      Timer.periodic(const Duration(seconds: 3), (timer) {
        fetchdata();
        if (isDataLoaded) {
          timer.cancel(); // Stop timer once data is loaded
        }
        // print(
        //     "hi");// You might want to remove or replace this with a loading  indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isDataLoaded
        ? Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
              title: Text(
                users[0]['title'],
                style: GoogleFonts.rosario(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    // color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final head = user['head'];

                    final subtitle = user['subtitle'];
                    final url1 = user['url'];
                    final paper = user['paper'];
                    final marking = user['marking'];
                    return ListTile(
                      title: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: PdfViewPage(paper),
                                    ),
                                  ).then((_) {
                                    // .then() executes after returning from Booknew
                                    // if (isloadfull) {
                                    //   interstitialAd.show();
                                    //   isloadfull =
                                    //       false; // Reset the flag to prevent multiple ad shows
                                    // } else {
                                    //   print("Interstitial ad not loaded yet");
                                    // }
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      subtitle,
                                      // textAlign: TextAlign.start,
                                      style: GoogleFonts.notoSerifSinhala(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.blueAccent,
                                          fontSize:25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // const SizedBox(
                              //   width: 10,
                              // ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: PdfViewPage(marking),
                                    ),
                                  ).then((_) {
                                    // .then() executes after returning from Booknew
                                    // if (isloadfull) {
                                    //   interstitialAd.show();
                                    //   isloadfull =
                                    //       false; // Reset the flag to prevent multiple ad shows
                                    // } else {
                                    //   print("Interstitial ad not loaded yet");
                                    // }
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.5,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                      width: 2,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(7.0)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      head,
                                      overflow: TextOverflow.fade,
                                      style: GoogleFonts.notoSerifSinhala(
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Lottie.asset("assets/bh.json"),
            ),
          );
  }
}

// onTap: ()  {
// // Navigate first, THEN show the ad if it's loaded
// Navigator.push(
// context,
// PageTransition(
// type: PageTransitionType.fade,
// child: PdfViewPage(url1),
// ),
// ).then((_) { // .then() executes after returning from Booknew
// // if (isloadfull) {
// //   // interstitialAd.show();
// //   isloadfull = false; // Reset the flag to prevent multiple ad shows
// // } else {
// //   // print("Interstitial ad not loaded yet");
// // }
// });
// },
