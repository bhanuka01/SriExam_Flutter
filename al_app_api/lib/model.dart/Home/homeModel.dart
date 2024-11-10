// import 'dart:ffi';
import 'package:card_loading/card_loading.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../admob/admob.dart';
import 'imageModel.dart';

// class HomeModel11 extends StatelessWidget {
//   // const HomeModel({super.key});
//   final String name;
//   final Widget page;
//   // final List<Color> color1;
//
//   const HomeModel11(this.name, this.page);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15),
//         child: GestureDetector(
//           onTap: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => page,
//                 ));
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//                 // colors: Colors.white,
//                 stops: [0.0, 0.9],
//                 // transform: GradientRotation(215 * 3.1415927 / 180),
//               ),
//               borderRadius: BorderRadius.circular(26),
//             ),
//             // color: Colors.amber,
//             height: MediaQuery.of(context).size.height / 9,
//             width: MediaQuery.of(context).size.width / 1,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Center(
//                 // child: Align(
//                 // alignment: Alignment.centerLeft,
//                 child: Text(
//                   name,
//                   style: const TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.w800,
//                     color: Colorlab.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class HomeModel111 extends StatelessWidget {
  // const HomeModel({super.key});
  final String name;
  final String pic;

  final Widget page;
  // final List<Color> color1;

  const HomeModel111(this.name, this.page, this.pic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,

                colors: [
                  Color.fromARGB(16, 255, 255, 255),
                  Color.fromARGB(148, 255, 255, 255),
                ],
                stops: [0.2, 1.0],
                // transform: GradientRotation(215 * 3.1415927 / 180),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 2.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          pic,
                          height: 120,
                          // width: 150,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      // Lottie.asset('assets/lottie/11.json', height: 40),
                    ],
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSub extends StatelessWidget {
  // const HomeModel({super.key});
  final String name;
  final String pic;

  final Widget page;
  // final List<Color> color1;

  const HomeSub(this.name, this.page, this.pic, {super.key});

  @override


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                pic,
              ),
              fit: BoxFit.cover,
            ),
            // ),
          ),
          height: MediaQuery.of(context).size.height/5,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(name,
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
      ),
    );
  }
}

class HomeSub2 extends StatefulWidget {
  // const HomeModel({super.key});
  final String name;
  final String pic;

  final Widget page;
  final double hei;
  final double wid;
  // final List<Color> color1;

  const HomeSub2(this.name, this.page, this.pic, this.hei,this.wid,{super.key});

  @override
  State<HomeSub2> createState() => _HomeSub2State();
}

class _HomeSub2State extends State<HomeSub2> {
  @override
  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
  }

  late final InterstitialAd interstitialAd;

  // final String interstitialAdUnitId = "ca-app-pub-3940256099942544/1033173712";
  bool isloadfull = false;

  late BannerAd bannerAd;

  bool isloadad = false;

  // var unitid = "ca-app-pub-3940256099942544/6300978111";
  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          setState(() {
            isloadfull = true;
          });
          interstitialAd.fullScreenContentCallback =
              FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
                interstitialAd.dispose();
                ad.dispose();
                setState(() {
                  isloadfull = false;
                });
              }, onAdFailedToShowFullScreenContent: (ad, err) {
                ad.dispose();
                interstitialAd.dispose();
                setState(() {
                  isloadfull = false;
                });
              });
        },
        onAdFailedToLoad: (LoadAdError loadAdError) {
          interstitialAd.dispose();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (isloadfull) {
            interstitialAd.show();
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => widget.page,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(
                widget.pic,
              ),
              fit: BoxFit.cover,
            ),
            // ),
          ),
          height: MediaQuery.of(context).size.height/widget.hei,
          width: MediaQuery.of(context).size.width /widget.wid,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.name,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSub1 extends StatelessWidget {
  // const HomeModel({super.key});
  final String name;
  final String pic;

  final Widget page;
  // final List<Color> color1;

  const HomeSub1(this.name, this.page, this.pic, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(9),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: ColorAllApp.homeCardBack,

                // colors: [
                //   // Color.fromARGB(16, 255, 255, 255),
                //   // Color.fromARGB(148, 255, 255, 255),
                //   Color(0xff38419d),
                //   Color(0xff3887be)
                // ],
                stops: [0.2, 1.0],
                // transform: GradientRotation(215 * 3.1415927 / 180),
              ),
              borderRadius: BorderRadius.circular(9),
            ),
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 1.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          pic,
                          height: 220,
                          // width: 150,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      // Lottie.asset('assets/lottie/11.json', height: 40),
                    ],
                  ),
                  Text(name,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,

                          // color: Colors.white,
                          color: Color(0xff52d3d8),
                        ),
                        // fontSize: 35,
                      )
                      // const TextStyle(
                      //     fontSize: 35,
                      //     fontWeight: FontWeight.w800,
                      //     color: Colors.white),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }


}

class TitleYear extends StatelessWidget {
  const TitleYear({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("Years",
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),);
  }
}

class LoadingRow extends StatelessWidget {
  const LoadingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardLoading(
          width: MediaQuery
              .of(context)
              .size
              .width / 2.3,
          height: 75,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          margin: const EdgeInsets.all(10),
        ),
        CardLoading(
          width: MediaQuery
              .of(context)
              .size
              .width / 2.3,
          height: 75,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          margin: const EdgeInsets.all(10),
        ),
      ],
    );
  }
}


class LodingPDF extends StatelessWidget {
  const LodingPDF({super.key});

  @override
  Widget build(BuildContext context) {
    return CardLoading(
      width: MediaQuery
          .of(context)
          .size
          .width / 1.1,
      height: MediaQuery
          .of(context)
          .size
          .height / 1.1,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      margin: const EdgeInsets.all(10),
    );
  }
}
