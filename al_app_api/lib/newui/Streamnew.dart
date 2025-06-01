import 'dart:async';
import 'dart:convert';

import 'package:al_app_api/newui/yearsnew02.dart';
import 'package:al_app_api/newui/yearsnew03.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'homenew.dart';
import 'package:al_app_api/newui/yearsnew.dart';

class Streamnew extends StatefulWidget {
  final String url1;
  const Streamnew(this.url1, {super.key});

  @override
  State<Streamnew> createState() => _StreamnewState();
}

class _StreamnewState extends State<Streamnew> {
  static const Color backgroundColor = Color(0xfffef5ec);

  static const List<Color> cardColors = [
    Color.fromARGB(255, 34, 100, 255),
    Color.fromARGB(255, 133, 57, 255),
    Color(0xFFFF8C00),
    Color(0xFF00BFA5),
    Color(0xFFFF5252),
  ];
  static const List<Color> colors = [
    Color(0xffdae1eb),
    Color(0xffdde2db),
    Color(0xffded2e0),
    Color(0xfff5dfc7),
    Color(0xfff5cec7),
  ];
  static const List<Color> textColor = [
    Color(0xff6782af),
    Color(0xff6b8e7d),
    Color(0xff85779a),
    Color(0xffd69958),
    Color(0xffdc7966),
  ];
  static const List<IconData> cardIcons = [
    Icons.school,
    Icons.book,
    Icons.science,
    Icons.psychology,
    Icons.lightbulb,
  ];
  static const List<String> cardTexts = [
    "Never Stop Learning",
    "Knowledge is Power",
    "Explore & Discover",
    "Dream Big Achieve More",
    "Innovate Tomorrow",
  ];

  List<dynamic> users = [];
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!isDataLoaded) {
        fetchData();
      } else {
        timer.cancel();
      }
    });
  }

  Future<void> fetchData() async {
    try {
      final uri = Uri.parse(widget.url1);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          users = jsonData['data'];
          isDataLoaded = true;
        });
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: isDataLoaded
          ? AppBar(
        foregroundColor: Color(0xff464743),
        title: Text(
          users[0]['title'],
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      )
          : null,
      body: isDataLoaded
          ? ListView.builder(
        itemCount: users.length,
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemBuilder: (context, index) {
          final user = users[index];
          final url = user['url'];
          final subtitle = user['subtitle'];
          final head = user['head'];
          // final head = "user";
          final body = user['body'];

          final destination = body == "1"
              ? Homenew(url)
              : body == "2"
              ? Streamnew(url)
              : body == "3"
              ? Yearsnew02(url)
              : body == "4"
              ? Yearsnew03(url)
              : Yearsnew02(url);

          final colorIndex = index % cardColors.length;
          final colorsIndex = index % colors.length;
          final textColorIndex = index % textColor.length;
          final iconIndex = index % cardIcons.length;
          final textIndex = index % cardTexts.length;

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: destination,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.5,
                height: MediaQuery.of(context).size.height / 8,
                decoration: BoxDecoration(
                  color: colors[colorsIndex],
                  border: Border.all(
                    color: colors[colorsIndex],
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtitle,
                            style: TextStyle(
                              color: textColor[textColorIndex],
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            head,
                            style: TextStyle(
                              color: textColor[textColorIndex],
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 270,
                      child: Icon(
                        cardIcons[iconIndex],
                        size: 70,
                        color: textColor[textColorIndex],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
          : Center(
        child: Lottie.asset("assets/bh.json"),
      ),
    );
  }
}
