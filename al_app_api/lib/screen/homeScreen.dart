import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../Subject/streamSub/biology.dart';
import '../Subject/streamSub/cormmes.dart';
import '../Subject/streamSub/maths.dart';
import '../Subject/streamSub/tech.dart';
import '../admob/admob.dart';
import '../model.dart/Home/homeModel.dart';
import '../model.dart/Home/imageModel.dart';
import 'about.dart';
import '../todo/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late InterstitialAd _interstitialAd;
  bool _isAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sri Exam',
          style: GoogleFonts.inter(
            fontSize: 35,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
              size: 30,
            ),
            splashColor: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutMe()),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildStreamHeader(),
              const SizedBox(height: 20),
              const Row(
                children: [
                  HomeSub2(
                    "Maths",
                    Maths(),
                    "assets/image/4.png",
                    5,
                    1.1,
                  ),
                ],
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeSub2(
                    "Bio",
                    Biology(),
                    "assets/image/1.png",
                    3,
                    2.3,
                  ),
                  Column(
                    children: [
                      HomeSub2(
                        "Comme",
                        Commerce(),
                        "assets/new/2.jpg",
                        5.4,
                        2.3,
                      ),
                      HomeSub2(
                        "Tech",
                        Tech(),
                        "assets/new/3.jpg",
                        5,
                        2.3,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorAllApp.homeTodoButton,
        onPressed: () {
          if (_isAdLoaded) _interstitialAd.show();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TodoListScreen()),
          );
        },
        child: const Icon(Icons.mode_edit_outline_outlined
        ,color: Colors.white,),
      ),
    );
  }

  Widget _buildStreamHeader() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff00011d),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "Stream",
          style: GoogleFonts.poppins(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}











// // import 'package:al_app_api/screen/studytips.dart';
// // import 'package:flutter/cupertino.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import '../Subject/streamSub/biology.dart';
// import '../Subject/streamSub/cormmes.dart';
// import '../Subject/streamSub/maths.dart';
// import '../Subject/streamSub/tech.dart';
// import '../admob/admob.dart';
//
// // import '../flutterflow/flutter_flow_theme.dart';
// import '../model.dart/Home/homeBack.dart';
// import '../model.dart/Home/homeModel.dart';
// import '../model.dart/Home/imageModel.dart';
// // import '../model.dart/Home/picLink.dart';
// import '../todo/todo.dart';
// import 'about.dart';
// // import 'package:dynamic_color/dynamic_color.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // initbannerad();
//
//     _loadInterstitialAd();
//   }
//
//   late final InterstitialAd interstitialAd;
//
//   // final String interstitialAdUnitId = "ca-app-pub-3940256099942544/1033173712";
//   bool isloadfull = false;
//
//   // late BannerAd bannerAd;
//   // bool isloadad = false;
//
//   // var unitid = "ca-app-pub-3940256099942544/6300978111";
//   void _loadInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (InterstitialAd ad) {
//           interstitialAd = ad;
//           setState(() {
//             isloadfull = true;
//           });
//           interstitialAd.fullScreenContentCallback =
//               FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
//             interstitialAd.dispose();
//             ad.dispose();
//             setState(() {
//               isloadfull = false;
//             });
//           }, onAdFailedToShowFullScreenContent: (ad, err) {
//             ad.dispose();
//             interstitialAd.dispose();
//             setState(() {
//               isloadfull = false;
//             });
//           });
//         },
//         onAdFailedToLoad: (LoadAdError loadAdError) {
//           interstitialAd.dispose();
//         },
//       ),
//     );
//   }
//
//   // initbannerad() {
//   //   bannerAd = BannerAd(
//   //       size: AdSize.largeBanner,
//   //       adUnitId: AdHelper.unitid,
//   //       listener: BannerAdListener(
//   //         onAdLoaded: (ad) {
//   //           setState(() {
//   //             isloadad = true;
//   //           });
//   //         },
//   //         onAdFailedToLoad: (ad, error) {
//   //           ad.dispose();
//   //           print(error);
//   //         },
//   //       ),
//   //       request: const AdRequest());
//   //   bannerAd.load();
//   // }
//
//   // @override
//   @override
//   Widget build(BuildContext context) {
//     return
//        Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Sri Exam',
//             style: GoogleFonts.inter(
//
//                   fontSize: 35,
//                   fontWeight: FontWeight.w900,
//                   color: Colors.black,
//                 ),
//           ),
//           backgroundColor: Colorlab.transparent,
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const AboutMe(),
//                     ),
//                   );
//                 },
//                 icon: const Icon(
//                   Icons.account_circle_outlined,
//                   color: Color(0xff000000),
//                   size: 30,
//                 ),
//               splashColor: Colors.lightBlueAccent,
//             ),
//           ],
//         ),
//         // backgroundColor: Colorlab.darkBlue,
//         backgroundColor: Colors.white,
//         body: Container(
//           padding: EdgeInsets.all(10),
//
//           alignment: Alignment.topCenter,
//           child: SafeArea(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xff00011d),
//                       borderRadius: BorderRadius.circular(10),
//
//                       // ),
//                     ),
//                     // height: MediaQuery.of(context).size.height/2,
//                     width: MediaQuery.of(context).size.width,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("Stream",
//                               style: GoogleFonts.poppins(
//                                 textStyle: const TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.white,
//                                 ),
//                               )),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//
//                   // Expanded(
//                   //   child: ListView(
//                   //
//                   //
//                   //     scrollDirection: Axis.vertical,
//                   //     children: SubjectList.streamsub,
//                   //   ),
//                   // ),
//                   const Row(
//                     children: [
//                       HomeSub2(
//                         "Maths",
//                         Maths(),
//                         "assets/image/4.png",
//                         5,
//                         1.1,
//                       ),
//                     ],
//                   ),
//                   const Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       HomeSub2(
//                         "Bio",
//                         Biology(),
//                         "assets/image/1.png",
//                         3,
//                         2.3,
//                       ),
//                       const Column(
//                         children: [
//                           HomeSub2(
//                             "Comme",
//                             Commerce(),
//                             "assets/new/2.jpg",
//                             5.4,
//                             2.3,
//                           ),
//                           HomeSub2(
//                             "Tech",
//                             Tech(),
//                             "assets/new/3.jpg",
//                             5,
//                             2.3,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//
//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: ColorAllApp.homeTodoButton,
//           foregroundColor: Color(0xffffffff),
//           onPressed: () {
//             if (isloadfull) {
//               interstitialAd.show();
//             }
//             // interstitialAd.show();
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const TodoListScreen(),
//                 ));
//           },
//           child: const Icon(Icons.mode_edit_outline_outlined),
//         ),
//         // bottomNavigationBar: isloadad
//         //     ? SizedBox(
//         //         height: bannerAd.size.height.toDouble(),
//         //         width: bannerAd.size.width.toDouble(),
//         //         child: AdWidget(ad: bannerAd),
//         //       )
//         //     : const SizedBox(),
//
//     );
//   }
// }
