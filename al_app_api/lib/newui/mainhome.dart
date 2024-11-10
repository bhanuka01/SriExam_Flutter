import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

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

  List<dynamic> users = [];
  bool isDataLoaded = false;

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
  @override
  Widget build(BuildContext context) {
    return isDataLoaded ? Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Sri Exam",
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
        ),
        backgroundColor: Colors.white,
      ),

      body: ListView(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final head = user['head'];
              final url = user['url'];
              final img = user['img'];
              final body = user['body'];
              Widget destination;
              if (body == "1") {
                destination = Homenew(url);
              } else {
                destination = Streamnew(url);
              }

              // Define a list of colors to cycle through
              final colors = [
                Colors.blueAccent,
                Colors.greenAccent,
                Colors.orangeAccent,
                Colors.purpleAccent,
                Colors.redAccent,
                // Add more colors as needed
              ];

              // Calculate the color index based on the current index
              final colorIndex = index % colors.length;
              final cardColor = colors[colorIndex];
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
                    // if (isloadfull) {
                    //   interstitialAd.show();
                    //   isloadfull =
                    //   false; // Reset the flag to prevent multiple ad shows
                    // } else {
                    //   // print("Interstitial ad not loaded yet");
                    // }
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
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          color: cardColor,
                          height:
                          MediaQuery.of(context).size.height / 6,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width /
                                    2.5,
                                child: Text(
                                  head,
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: img,
                                      fit: BoxFit.contain,
                                      progressIndicatorBuilder:
                                          (context, url,
                                          downloadProgress) =>
                                          CircularProgressIndicator(
                                              value:
                                              downloadProgress
                                                  .progress),
                                      errorWidget:
                                          (context, url, error) =>
                                      const Icon(Icons.error),
                                    )
                                  // child: Image.network(img,
                                  //     fit: BoxFit.contain),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ):Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset("assets/bh.json"),
      ),
    );
  }
}
