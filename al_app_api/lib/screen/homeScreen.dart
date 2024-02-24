import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../admob/admob.dart';

import '../flutterflow/flutter_flow_theme.dart';
import '../model.dart/Home/homeBack.dart';
import '../model.dart/Home/imageModel.dart';
import '../model.dart/Home/picLink.dart';
import '../todo/todo.dart';
import 'about.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initbannerad();

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

  initbannerad() {
    bannerAd = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: AdHelper.unitid,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isloadad = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print(error);
          },
        ),
        request: const AdRequest());
    bannerAd.load();
  }

  // @override
  @override
  Widget build(BuildContext context) {
    return StremBack(
      thechild: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello',
            style:
            FlutterFlowTheme.of(context).titleMedium.override(
              fontFamily: 'Inter',
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colorlab.transparent,
          actions: [

            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutMe(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.account_box,
                  color: Colors.greenAccent,
                  size: 30,
                ))
          ],
        ),
        backgroundColor: Colorlab.darkBlue,
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //       "assets/svg/666.jpg",
          //     ),
          //     fit: BoxFit.cover
          //   ),
          // ),
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SizedBox(height: 60),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        PicLink_23_07_01.home,
                        height: 200,
                        width: 400,
                        // height: MediaQuery.of(context).size.height / 2,
                        fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          );
                        },
                      ),
                    )
                    // padding: const EdgeInsets.all(15.0),
                    // child: ClipRRect(
                    //   borderRadius: BorderRadius.circular(25),
                    //   child: Image.asset(
                    //     "assets/svg/333.jpg",
                    //   ),
                    // ),
                    ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: SubjectList.streamsub),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                    primary: false,
                    padding: const EdgeInsets.all(5),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    children: SubjectList.streamsub,
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            if (isloadfull) {
              interstitialAd.show();
            }
            // interstitialAd.show();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoApp(),
                ));
          },
          child: const Text("Todo"),
        ),
        // bottomNavigationBar: isloadad
        //     ? SizedBox(
        //         height: bannerAd.size.height.toDouble(),
        //         width: bannerAd.size.width.toDouble(),
        //         child: AdWidget(ad: bannerAd),
        //       )
        //     : const SizedBox(),
      ),
    );
  }
}
