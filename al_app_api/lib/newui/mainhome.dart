import 'dart:async';
import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:al_app_api/newui/yearsnew.dart';
import 'package:al_app_api/screen/about.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../admob/admob.dart';
import 'Streamnew.dart';
import 'homenew.dart';

class Mainhome extends StatefulWidget {
  const Mainhome({super.key});

  @override
  State<Mainhome> createState() => _MainhomeState();
}

class _MainhomeState extends State<Mainhome> {
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

  List<dynamic> users = [];
  bool isDataLoaded = false;
  String versioninfo = URLInfo.version;

  Future<void> fetchdata() async {
    const url =
        "https://raw.githubusercontent.com/bhanuka01/alapi/main/full.json";
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

  // late BannerAd bannerAd;
  // bool isloadad = false;

  // initbannerad() {
  //   bannerAd = BannerAd(
  //       size: AdSize.largeBanner,
  //       adUnitId: AdHelper.unitid,
  //       listener: BannerAdListener(
  //         onAdLoaded: (ad) {
  //           setState(() {
  //             isloadad = true;
  //           });
  //         },
  //         onAdFailedToLoad: (ad, error) {
  //           ad.dispose();
  //           // print(error);
  //         },
  //       ),
  //       request: const AdRequest());
  //   bannerAd.load();
  // }

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
    final String version =
        users.isNotEmpty ? users[0]['version'] ?? "1.0.0" : "1.0.0";
    return isDataLoaded
        ? Scaffold(
            backgroundColor: Color(0xfffef5ec),
            appBar: AppBar(
              backgroundColor: Color(0xfffef5ec),
              foregroundColor: Colors.white,
              title: Text(
                "Sri Exam",
                style: GoogleFonts.inter(
                  textStyle:  TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xff464743),
                    fontSize: 40,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: AboutMe(),
                        // Booknew(url, img),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 30,
                    color: Color(0xff464743),
                  ),
                )
              ],
              // backgroundColor: Colors.white,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 0),
                  child: SizedBox(
                    height: 70,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'A/L Paper',
                           speed: Duration(milliseconds: 100),
                          // alignment: Alignment.centerLeft,
                          textStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff464743),
                            fontSize: 30,
                          ),
                        ),
                        TypewriterAnimatedText(
                          'O/L Paper',
                          speed: Duration(milliseconds: 100),
                          // speed: Duration(seconds: 1),
                          // alignment: Alignment.centerLeft,
                          textStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff464743),
                            fontSize: 30,
                          ),
                        ),
                        TypewriterAnimatedText(
                          'Marking Scheme',
                          speed: Duration(milliseconds: 100),
                          // speed: Duration(seconds: 1),
                          // alignment: Alignment.centerLeft,
                          textStyle:  TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color(0xff464743),
                            fontSize: 30,
                          ),
                        ),

                        // FadeAnimatedText(
                        //   'Fade First',
                        //   textStyle: TextStyle(
                        //       fontSize: 32.0, fontWeight: FontWeight.bold),
                        // ),
                        // ScaleAnimatedText(
                        //   'Then Scale',
                        //   textStyle:
                        //       TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
                        // ),
                      ],

                      // totalRepeatCount: 4,
                      repeatForever: true,
                      pause: const Duration(milliseconds: 1000),
                      displayFullTextOnTap: true,
                      stopPauseOnTap: true,
                      // controller: myAnimatedTextController
                    ),
                  )
                  // Text(
                  //   "Past Papers & Marking Scheme ",
                  //   style: TextStyle(
                  //     color: Color(0xff464743),
                  //     fontSize: 25,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                ),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
                    final head = user['head'];
                    final url = user['url'];
                    final subtitle = user['subtitle'];
                    // final img = user['img'];
                    final body = user['body'];
                    Widget destination;

                    // if (body == "1") {
                    //   destination = Homenew(url, head); //
                    // }
                    // else {
                    //   destination = Streamnew(url);//
                    // }
                    if (body == "1") {
                      destination = Homenew(url); //
                    } else if (body == "2") {
                      destination = Streamnew(url); //
                    } else if (body == "3") {
                      destination = Yearsnew(url); //
                    } else {
                      destination = Yearsnew(url); //
                    }

                    // if (body == "1") {
                    //   destination = Homenew(url, head); //
                    // } if(body == "2"){
                    //   destination = Streamnew(url);
                    // }
                    // if(body == "3") {
                    //   destination = Yearsnew(url);//Yearsnew
                    // }

                    // Define a list of colors to cycle through
                    final colors = [
                      Color(0xffdde2db),
                      Color(0xffdae1eb),
                      Color(0xffded2e0),
                      Color(0xfff5dfc7),

                      Color(0xfff5cec7),
                      // Add more colors as needed
                    ];
                    final textColor = [
                      Color(0xff6b8e7d),
                      Color(0xff6782af),
                      Color(0xff85779a),
                      Color(0xffd69958),

                      Color(0xffdc7966),
                      // Add more colors as needed
                    ];
                    final icons = [
                      Icons.school, // Icon for A/L education
                      Icons.menu_book, // Icon for O/L education
                      // Add more icons as needed
                    ];

                    // Calculate the color index based on the current index
                    final colorIndex = index % colors.length;

                    final iconIndex = index % icons.length;
                    final cardColor = colors[colorIndex];
                    final cardicon = icons[iconIndex];
                    final textColorIndex = index % textColor.length;
                    final cardTextColor = textColor[textColorIndex];
                    return GestureDetector(
                      onTap: () {
                        // Navigate first, THEN show the ad if it's loaded

                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: destination,
                            // Booknew(url, img),
                          ),
                        ).then((_) {
                          // .then() executes after returning from Booknew
                          if (_isAdLoaded) {
                            _interstitialAd.show();
                            _isAdLoaded =
                                false; // Reset the flag to prevent multiple ad shows
                          } else {
                            // print("Interstitial ad not loaded yet");
                          }
                        });
                      },
                      // ... rest of your GestureDetector

                      // return GestureDetector(
                      //   onTap: () {
                      //     if (isloadfull) {
                      //       interstitialAd.show();
                      //     } else {
                      //       print("Interstitial ad not loaded yet");
                      //     }
                      //     Navigator.push(
                      //       context,
                      //       PageTransition(
                      //         type: PageTransitionType.fade,
                      //         child: Booknew(url, img),
                      //       ),
                      //     );
                      //   },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cardColor.withOpacity(0.6), // Border color
                              width: 1,
                              // Border width
                            ),
                            color: cardColor,
                            // boxShadow: [
                            // BoxShadow(
                            //   color: Colors.black
                            //       .withOpacity(0.5), // Shadow color
                            //   spreadRadius:
                            //       3, // How far the shadow should extend
                            //   blurRadius:
                            //       20, // How blurry the shadow should be
                            //   offset:
                            //       Offset(5, 10), // X, Y offset of the shadow
                            // ),
                            // ],
                            // gradient: LinearGradient(
                            //   colors: [cardColor.withAlpha(80), cardColor],
                            //   // Color(0xFF034dc7)]
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.bottomCenter,
                            // ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              // A/L text
                              Positioned(
                                top: 30,
                                left: 20,
                                child: Text(
                                  head,
                                  style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              // Spiral graphic placeholder
                              Center(
                                child: Container(
                                  width: 20,
                                  height: 100,
                                  child: Icon(
                                    cardicon,
                                    size: 120,
                                    color: cardTextColor.withAlpha(150),
                                  ),
                                ),
                              ),
                              // "Believe in yourself" text
                              Positioned(
                                bottom: 30,
                                left: 20,
                                child: subtitle == ""
                                    ? Text(
                                        "Only Sinhala Medium",
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.3),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : Text(
                                        subtitle,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.3),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                version == versioninfo
                // version != versioninfo
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GestureDetector(
                          onTap: () async {
                            final Uri url = Uri.parse(
                                'https://play.google.com/store/apps/details?id=com.bhanu.sriexam&hl=en');
                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width / ,
                            height: MediaQuery.of(context).size.height / 11,
                            decoration: BoxDecoration(
                              color: Color(0xfff5cec7),
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //   color: Color(0xffdc7966),
                              //   width: 2,
                              //
                              // ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    "Update",
                                    style: TextStyle(
                                      color: Color(0xffdc7966),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Now Available New Version",
                                    style: TextStyle(
                                      color: Color(0xffdc7966),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(""),
                // version != "2.1.0" ? Text("data") : Text("data")
              ],
            ),
            // floatingActionButton: version != "2.1.0"
            //     ? FloatingActionButton(
            //         onPressed: () async {
            //           final Uri url = Uri.parse(
            //               'https://play.google.com/store/apps/details?id=com.bhanu.sriexam&hl=en');
            //           if (!await launchUrl(url)) {
            //             throw Exception('Could not launch $url');
            //           }
            //         },
            //         backgroundColor: Color(0xffdc7966),
            //         foregroundColor: Colors.white,
            //         child: Text("Update"),
            //       )
            //     : null,
            // bottomNavigationBar: isloadad
            //     ? SizedBox(
            //         height: bannerAd.size.height.toDouble(),
            //         width: bannerAd.size.width.toDouble(),
            //         child: AdWidget(ad: bannerAd),
            //       )
            //     : const SizedBox(),
          )
        : Scaffold(
            backgroundColor: Color(0xfffef5ec),
            body: Center(
              child: Lottie.asset("assets/bh.json"),
            ),
          );
  }
}
