import 'package:al_app_api/model.dart/Home/picLink.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../admob/admob.dart';
// import '../../model.dart/Home/homeBack.dart';
import '../../model.dart/Home/imageModel.dart';

class Maths extends StatefulWidget {
  const Maths({super.key});

  @override
  State<Maths> createState() => _MathsState();
}

class _MathsState extends State<Maths> {
  @override
  void initState() {
    super.initState();
    initbannerad();
  }

  late BannerAd bannerAd;
  bool isloadad = false;
  // var unitid = "ca-app-pub-3940256099942544/6300978111";

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
            // print(error);
          },
        ),
        request: const AdRequest());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // decoration: const BoxDecoration(
      //   color: AppColor.sub3,
      // image: DecorationImage(
      //   image: AssetImage(AbImage1.subject),
      //   fit: BoxFit.cover,
      // ),
      // ),


      backgroundColor: Colorlab.darkBlue,
        body: Container(
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage(
          //         "assets/svg/77.jpg",
          //       ),
          //       fit: BoxFit.cover
          //   ),
          // ),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.network(
                                PicLink_23_07_01.maths,
                                height: 200,
                                width: 400,
                                // height: MediaQuery.of(context).size.height / 2.4,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  );
                                },
                              ),
                            )),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                    primary: false,
                    padding: const EdgeInsets.all(5),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 3,
                    crossAxisCount: 2,
                    children: SubjectList.maths,
                  ),
                ),
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
            : const SizedBox(),

    );
  }
}
