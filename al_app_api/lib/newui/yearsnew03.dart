import 'dart:async';
import 'dart:convert';
import 'package:al_app_api/newui/pdfnew.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../admob/admob.dart';

class Yearsnew03 extends StatefulWidget {
  final String url1;

  const Yearsnew03(this.url1, {super.key});

  @override
  State<Yearsnew03> createState() => _YearsnewState();
}

class _YearsnewState extends State<Yearsnew03> {
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
    _loadInterstitialAd();

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

  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          setState(() => _isAdLoaded = true);
          _interstitialAd.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) => _disposeAd(),
            onAdFailedToShowFullScreenContent: (ad, err) => _disposeAd(),
          );
        },
        onAdFailedToLoad: (error) => _disposeAd(),
      ),
    );
  }

  void _disposeAd() {
    _interstitialAd.dispose();
    setState(() => _isAdLoaded = false);
  }

  @override
  Widget build(BuildContext context) {
    return isDataLoaded
        ? Scaffold(
            appBar: AppBar(
              foregroundColor: Color(0xff464743),
              title: Text(
                users[0]['title'],
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    // color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
              backgroundColor: Color(0xfffef5ec),
            ),
            backgroundColor: Color(0xfffef5ec),
            body: ListView(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final head = user['head'];

                    // final subtitle = user['subtitle'];
                    // final url1 = user['url'];
                    // final paper = user['paper'];
                    // final marking = user['marking'];

                    final Year = user['year'];
                    final mcq = user['mcq'];
                    final paper2 = user['part2'];
                    final marking = user['marking'];


                    final mcq_paper = user['mcq_paper'];
                    final paper2_paper = user['part2_paper'];
                    final marking_paper = user['marking_paper'];


                    // final colors = [
                    //   Color.fromARGB(255, 18, 58, 255),
                    //   Colors.greenAccent,
                    //   Colors.orangeAccent,
                    //   Colors.purpleAccent,
                    //   Colors.redAccent,
                    //   // Add more colors as needed
                    // ];
                    final colors = [
                      Color(0xff94bbe9),
                      Color(0xffb2f19d),
                      Color(0xffd98fe9),
                      Color(0xffe2b88f),
                      Color(0xffefaa9f),
                      // Add more colors as needed
                    ];

                    final textColor = [
                      Color(0xff6782af),
                      Color(0xff6b8e7d),
                      Color(0xff85779a),
                      Color(0xffd69958),

                      Color(0xffdc7966),
                      // Add more colors as needed
                    ];
                    final colorIndex = index % colors.length;
                    final cardColor = colors[colorIndex];
                    final textColorIndex = index % textColor.length;
                    final cardtextColor = textColor[textColorIndex];

                    return ListTile(
                      title: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              // color: bgcardColor,
                              color: cardColor.withOpacity(0.2),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, bottom: 15, top: 10, right: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 28.0),
                                      child: Text(Year,
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w900,
                                              color: cardtextColor,
                                              fontSize: 25,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      type: PageTransitionType
                                                          .fade,
                                                      child: PdfViewPage(mcq_paper),
                                                    ),
                                                  ).then((_) {
                                                    // .then() executes after returning from Booknew
                                                    if (_isAdLoaded) {
                                                      _interstitialAd.show();
                                                      _isAdLoaded =
                                                          false; // Reset the flag to prevent multiple ad shows
                                                    } else {
                                                      print(
                                                          "Interstitial ad not loaded yet");
                                                    }
                                                  });
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    color: cardColor
                                                        .withOpacity(0.6),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            15,
                                                    // decoration: BoxDecoration(
                                                    //   border: Border.all(
                                                    //     color: cardColor,
                                                    //     width: 2,
                                                    //   ),
                                                    //   borderRadius: const BorderRadius.all(
                                                    //       Radius.circular(7.0)),
                                                    // ),
                                                    child: Center(
                                                      child: Text(
                                                        mcq,
                                                        // textAlign: TextAlign.start,
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                cardtextColor,
                                                            fontSize: 25,
                                                          ),
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
                                                      type: PageTransitionType
                                                          .fade,
                                                      child:
                                                          PdfViewPage(paper2_paper),
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
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    color: cardColor
                                                        .withOpacity(0.6),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2.35,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height /
                                                            15,
                                                    // decoration: BoxDecoration(
                                                    //   border: Border.all(
                                                    //     color: cardColor,
                                                    //     width: 2,
                                                    //   ),
                                                    //   borderRadius: const BorderRadius.all(
                                                    //       Radius.circular(7.0)),
                                                    // ),
                                                    child: Center(
                                                      child: Text(
                                                        paper2,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style:
                                                            GoogleFonts.inter(
                                                          textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color:
                                                                cardtextColor,
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 8, top: 10),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .fade,
                                                  child: PdfViewPage(marking_paper),
                                                ),
                                              ).then((_) {
                                                // .then() executes after returning from Booknew
                                                if (_isAdLoaded) {
                                                  _interstitialAd.show();
                                                  _isAdLoaded =
                                                  false; // Reset the flag to prevent multiple ad shows
                                                } else {
                                                  print(
                                                      "Interstitial ad not loaded yet");
                                                }
                                              });
                                            },

                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: cardColor
                                                        .withOpacity(0.6),
                                                    width: 3.0,
                                                  ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  ),
                                                ),
                                                // color: cardColor.withOpacity(0.6),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    15,
                                                // decoration: BoxDecoration(
                                                //   border: Border.all(
                                                //     color: cardColor,
                                                //     width: 2,
                                                //   ),
                                                //   borderRadius: const BorderRadius.all(
                                                //       Radius.circular(7.0)),
                                                // ),
                                                child: Center(
                                                  child: Text(
                                                    marking,
                                                    overflow: TextOverflow.fade,
                                                    style: GoogleFonts.inter(
                                                      textStyle: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: cardtextColor,
                                                        fontSize: 25,
                                                      ),
                                                    ),
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
                              ),
                            ),
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
            backgroundColor: Color(0xfffef5ec),
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
