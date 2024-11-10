// import 'package:al_app_api/model.dart/Home/picLink.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../admob/admob.dart';
// import '../../model.dart/Home/homeBack.dart';
// import '../../flutterflow/flutter_flow_theme.dart';
import '../../model.dart/Home/imageModel.dart';

class Biology extends StatefulWidget {
  const Biology({super.key});

  @override
  State<Biology> createState() => _BiologyState();
}

class _BiologyState extends State<Biology> {
  @override
  void initState() {
    super.initState();
    initbannerad();
  }

  late BannerAd bannerAd;
  bool isloadad = false;
  // var unitid = "ca-app-pub-3940256099942544/6300978111";
  // var unitid1 = "ca-app-pub-6429842662800808/4457017429";

  initbannerad() {
    bannerAd = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: AdHelper.unitid,
        // adUnitId: unitid1,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isloadad = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            // print(error);
          },
        ),
        request: const AdRequest());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text(
          'Sri Exam',
          style:  GoogleFonts.inter(

            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colorlab.transparent,

      ),


      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(10),

        child: SafeArea(
          child: Column(

            children: [

              Container(
                decoration: BoxDecoration(
                  color: const Color(0xff00011d),
                  borderRadius: BorderRadius.circular(10),

                  // ),
                ),
                // height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Subject",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(


                child:
                GridView.builder(
                  key: const PageStorageKey<String>('mathsGrid'), // Key for preserving scroll position
                  scrollDirection: Axis.vertical, // For horizontal scrolling
                  itemCount: SubjectList.biology.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items in each row (adjust as needed)
                    mainAxisSpacing: 8.0,  // Spacing between rows
                    crossAxisSpacing: 8.0, // Spacing between columns
                    childAspectRatio: 1.0,  // Adjust aspect ratio of grid items
                  ),
                  itemBuilder: (context, index) {
                    return SubjectList.biology[index]; // Your existing widgets in SubjectList.maths
                  },
                )

                // ListView(
                //   scrollDirection: Axis.horizontal,
                //
                //   children: SubjectList.biology,
                // ),
              ),
              // Container(
              //   // height: MediaQuery.of(context).size.height,
              //
              //
              //   decoration: BoxDecoration(
              //
              //     // color: Colors.deepPurple.shade600,
              //     borderRadius: BorderRadius.circular(20),
              //
              //     // ),
              //   ),
              //   height: MediaQuery.of(context).size.height / 4,
              //   width: MediaQuery.of(context).size.width,
              //   child: Padding(
              //     padding: const EdgeInsets.all(20.0),
              //     child: SingleChildScrollView(
              //       child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Level Up Your Brain:",
              //             style: GoogleFonts.poppins(
              //               textStyle: const TextStyle(
              //                 fontSize: 30,
              //                 fontWeight: FontWeight.w600,
              //                 // color: Colors.white,
              //               ),
              //             ),
              //           ),
              //           const SizedBox(height: 10,),
              //           Text(
              //             "Studying unlocks new skills and ways of thinking, making you smarter! ",
              //             style: GoogleFonts.poppins(
              //               textStyle: const TextStyle(
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w400,
              //                 // color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: isloadad
          ? SizedBox(
        height:bannerAd.size.height.toDouble(),
        width: bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd),

      )
          : const SizedBox(height: 100,),

    );
  }
}
