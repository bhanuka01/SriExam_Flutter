import 'package:al_app_api/model.dart/Home/imageModel.dart';
import 'package:al_app_api/model.dart/Home/picLink.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../admob/admob.dart';
import '../../model.dart/Home/homeBack.dart';

class Commerce extends StatefulWidget {
  const Commerce({super.key});

  @override
  State<Commerce> createState() => _BiologyState();
}

class _BiologyState extends State<Commerce> {
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
            print(error);
          },
        ),
        request: AdRequest());
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return SubBack(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage(AbImage1.subject),
      //   fit: BoxFit.cover,
      // )),
      thechild: SafeArea(
        child: Scaffold(
          backgroundColor: Colorlab.darkBlue,
          body: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              PicLink_23_07_01.commerce,
                              height: 200,
                              width: 400,
                              // height: MediaQuery.of(context).size.height / 2,
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
                      // Column(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: SubjectList.biology
                      //     // [
                      //     //   HomeModel("Bio", Bio()),
                      //     //   HomeModel("Physics", Phy()),
                      //     //   HomeModel("Chemitry", Chem()),
                      //     //   HomeModel("Agry", Agry()),

                      //     // ],
                      //     ),
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
                  crossAxisCount: 2, children: SubjectList.commerce,
                  // [
                  //   HomeModel("C Maths", Cmaths()),
                  //   HomeModel("Physics", Phy()),
                  //   HomeModel("Chemitry", Chem()),
                  //   HomeModel("ICT", Ict()),
                  // ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: isloadad
              ? SizedBox(
            height: bannerAd.size.height.toDouble(),
            width: bannerAd.size.width.toDouble(),
            child: AdWidget(ad: bannerAd),
          )
              : const SizedBox(),
        ),
      ),
    );
  }
}
