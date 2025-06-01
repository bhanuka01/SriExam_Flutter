import 'dart:async';
import 'dart:convert';
import 'package:al_app_api/newui/yearsnew.dart';
import 'package:al_app_api/newui/yearsnew02.dart';
import 'package:al_app_api/newui/yearsnew03.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'Streamnew.dart';

class Homenew extends StatefulWidget {
  final String url1;

  // const Homenew({super.key});
  const Homenew(this.url1,  {super.key});

  @override
  State<Homenew> createState() => _HomenewState();
}

class _HomenewState extends State<Homenew> {
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
  Widget build(BuildContext context) {
    return isDataLoaded
        ? Scaffold(
            backgroundColor: Color(0xfffef5ec),
            appBar: AppBar(
              foregroundColor: Color(0xff464743),
              title: Text(
                users[0]['title'],
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                  ),
                ),
              ),
              backgroundColor: Color(0xfffef5ec),
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
                    final subtitle=user['subtitle'];
                    // final head = "user";
                    final url = user['url'];
                    // final img = user['img'];
                    final body = user['body'];
                    Widget destination;
                    // if (body == "2") {
                    //   destination = Yearsnew(url);
                    // } else {
                    //   destination = Streamnew(url);
                    // }
                    if (body == "1") {
                      destination = Homenew(url); //
                    } else if (body == "2") {
                      destination = Streamnew(url); //
                    } else if (body == "3") {
                      destination = Yearsnew02(url); //
                    } else {
                      destination = Yearsnew03(url); //
                    }

                    // Define a list of colors to cycle through
                    final colors = [
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

                    // Define a list of icons to cycle through
                    final icons = [
                      Icons.school,
                      Icons.book,
                      Icons.science,
                      Icons.psychology,
                      Icons.lightbulb,
                    ];

                    // Calculate the color index based on the current index
                    final colorIndex = index % colors.length;
                    final textColorIndex = index % textColor.length;
                    final iconIndex = index % icons.length;
                    final cardColor = colors[colorIndex];
                    final cardTextColor = textColor[textColorIndex];
                    final cardIcon = icons[iconIndex];

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
                        ).then((_) {});
                      },
                      // ... rest of your GestureDetector

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: MediaQuery.of(context).size.height / 7,
                          // color: cardColor,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: cardColor, // Border color
                              width: 1, // Border width
                            ),
                            color: cardColor,
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.black.withOpacity(0.5), // Shadow color
                            //     spreadRadius: 3, // How far the shadow should extend
                            //     blurRadius:20, // How blurry the shadow should be
                            //     offset: Offset(5, 10), // X, Y offset of the shadow
                            //   ),
                            // ],
                            //   gradient: LinearGradient(
                            //     colors: [ cardColor.withAlpha(80),cardColor],
                            //     // Color(0xFF034dc7)]
                            //     begin: Alignment.topCenter,
                            //     end: Alignment.bottomCenter,
                            //   ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 12,
                                  // bottom: 20,
                                  // top: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          head,
                                          style: TextStyle(
                                            color: cardTextColor,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),

                                        // SizedBox(height: 20,),
                                        subtitle=="" ?Text(
                                          "Only Sinhalese Medium",
                                          style: TextStyle(
                                            color: cardTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ):Text(
                                          subtitle,
                                          style: TextStyle(
                                            color: cardTextColor,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20,),
                                    Icon(
                                      cardIcon, // Using different icon based on index
                                      size: 70,
                                      color: cardTextColor,
                                    ),
                                  ],
                                ),
                              ),
                              // A/L text
                              // Positioned(
                              //   top: 30,
                              //   left: 20,
                              //   child: Text(
                              //     head,
                              //     style: TextStyle(
                              //       color:  cardTextColor,
                              //       fontSize: 30,
                              //       fontWeight: FontWeight.w900,
                              //     ),
                              //   ),
                              // ),
                              // Spiral graphic placeholder
                              // Positioned(
                              //   top: 70,
                              //   left: 270,
                              //   child: Container(
                              //     // child: Icon(
                              //     //   cardIcon, // Using different icon based on index
                              //     //   size: 70,
                              //     //   color: cardTextColor,
                              //     // ),
                              //   ),
                              // ),
                              // "Believe in yourself" text
                              // Positioned(
                              //   bottom: 30,
                              //   left: 20,
                              //   child: Text(
                              //     "Believe in yourself",
                              //     style: TextStyle(
                              //       color: cardTextColor,
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.w600,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
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
