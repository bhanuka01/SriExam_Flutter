import 'package:al_app_api/model.dart/apimodel/getRow.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:http/http.dart' as http;
// import 'dart:convert';

import '../../admob/admob.dart';
import '../../apijson/cmathsjsn.dart';
import '../../model.dart/Home/homeBack.dart';
// import '../../model.dart/Home/homeModel.dart';
import '../../model.dart/Home/imageModel.dart';

class Bio extends StatefulWidget {
  @override
  State<Bio> createState() => _CmathsState();
}

class _CmathsState extends State<Bio> {
  late Cmathsjson paper;

  bool isDataLoaded = false;

  String errorMessage = '';
  Future<Cmathsjson> getDataFromAPI() async {
    Uri uri = Uri.parse("https://bhanuka01.github.io/alapi/science/bio.json");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      // All ok
      Cmathsjson paper = temperaturesFromJson(response.body);
      setState(() {
        isDataLoaded = true;
      });
      return paper;
    } else {
      errorMessage = '${response.statusCode}: ${response.body} ';
      return Cmathsjson(data: []);
    }
  }

  callAPIandAssignData() async {
    paper = await getDataFromAPI();
  }

  @override
  void initState() {
    callAPIandAssignData();
    super.initState();
    initbannerad();
  }

  late BannerAd bannerAd;
  bool isloadad = false;

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
    return YearBack(
      // decoration:
      // const BoxDecoration(
      //   color: AppColor.sub2,
      //   image: DecorationImage(
      //     image: AssetImage(AbImage1.year),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      thechild: SafeArea(
        child: Scaffold(
          backgroundColor: Colorlab.darkBlue,
          // ),
          body: isDataLoaded
              ? errorMessage.isNotEmpty
                  ? Text(errorMessage)
                  : paper.data.isEmpty
                      ? const Text('No Data')
                      : Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: paper.data.length,
                                itemBuilder: (context, index) =>
                                    ChemRow1(index: index, paper: paper),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: paper.data.length,
                                itemBuilder: (context, index) =>
                                    ChemRow2(index: index, paper: paper),
                              ),
                            ),
                          ],
                        )
              : Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(
                        color: Colorlab.white,
                      ),
                      Text(
                        "Please wait a moment \n Connect to the internet \n Restart the app",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colorlab.white,
                        ),
                      )
                    ],
                  ),
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
