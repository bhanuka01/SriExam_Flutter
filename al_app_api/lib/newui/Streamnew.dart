import 'dart:async';
import 'dart:convert';

import 'package:al_app_api/newui/yearsnew.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Streamnew extends StatefulWidget {
  final String url1;

  const Streamnew(this.url1,  {super.key});


  @override
  State<Streamnew> createState() => _StreamnewState();
}

class _StreamnewState extends State<Streamnew> {


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
    return
        isDataLoaded
            ? Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            title: Text(
              users[0]['title'],
              style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
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
                  return ListTile(
                    title: InkWell(
                      onTap: ()  {
                        // Navigate first, THEN show the ad if it's loaded
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: Yearsnew(url1),
                          ),
                        )
                            .then((_) { // .then() executes after returning from Booknew
                        //   if (isloadfull) {
                        //     // interstitialAd.show();
                        //     isloadfull = false; // Reset the flag to prevent multiple ad shows
                        //   } else {
                        //     // print("Interstitial ad not loaded yet");
                        //   }
                        }
                        );
                      },

                      child: Container(
                        // color: Colors.blueAccent,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 2,
                          ),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    subtitle,
                                    // textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blueAccent,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    head,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 17,
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
                  );
                },
              ),
            ],
          ),
        )
            :  Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Lottie.asset("assets/bh.json"),
          ),
    );
  }
}
