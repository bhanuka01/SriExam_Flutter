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

class Yearsnew02 extends StatefulWidget {
  final String url1;

  const Yearsnew02(this.url1, {super.key});

  @override
  State<Yearsnew02> createState() => _YearsnewState();
}

class _YearsnewState extends State<Yearsnew02> {
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

                    final subtitle = user['subtitle'];
                    final url1 = user['url'];
                    final paper = user['paper'];
                    final marking = user['marking'];

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
                    final bgColor = [
                      Color(0xffdae1eb),
                      Color(0xffdde2db),
                      Color(0xffded2e0),
                      Color(0xfff5dfc7),
                      Color(0xfff5cec7),
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
                    final bgcolorIndex = index % bgColor.length;
                    final bgcardColor = bgColor[bgcolorIndex];

                    return ListTile(
                      title: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: bgcardColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, bottom:20, top: 10, right: 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 28.0),
                                      child: Text(subtitle,
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                              color: cardColor.withOpacity(0.6),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
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
                                                  "PAPER",
                                                  // textAlign: TextAlign.start,
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
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Container(
                                              color: cardColor.withOpacity(0.4),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
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
                                                  head,
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
