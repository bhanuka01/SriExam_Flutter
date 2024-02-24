import 'package:al_app_api/model.dart/apimodel/getRow.dart';
// import 'package:al_app_api/sample/detail.dart';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:http/http.dart' as http;
// import 'dart:convert';

import '../../admob/admob.dart';
import '../../apijson/cmathsjsn.dart';
import '../../model.dart/Home/homeBack.dart';
import '../../model.dart/Home/imageModel.dart';


class Chem extends StatefulWidget {
  @override
  State<Chem> createState() => _CmathsState(/*this.url*/);
}

class _CmathsState extends State<Chem> {
  late Cmathsjson paper;

  bool isDataLoaded = false;

  String errorMessage = '';
  Future<Cmathsjson> getDataFromAPI() async {
    Uri uri = Uri.parse("https://bhanuka01.github.io/alapi/science/chem.json");
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
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //   image: AssetImage(AbImage1.year),
      //   fit: BoxFit.cover,
      // )),
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
                            // Expanded(
                            //   child: ListView.builder(
                            //     itemCount: paper.data.length,
                            //     itemBuilder: (context, index) => getRow(index),
                            //   ),
                            // ),
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
                    children: [
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

  // Widget getRow(int index) {
  //   return Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(15),
  //           image: DecorationImage(
  //             image: AssetImage("assets/image/w1.jpg"),
  //             fit: BoxFit.cover,
  //           )),
  //       child: ListTile(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => Paper(userPet: paper.data[index]),
  //             ),
  //           );
  //         },
  //         title: Center(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Text(
  //                 paper.data[index].year,
  //                 style: TextStyle(
  //                   fontSize: 30,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

//   Widget getRow2(int index) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             image: DecorationImage(
//               image: AssetImage("assets/image/w1.jpg"),
//               fit: BoxFit.cover,
//             )),
//         child: ListTile(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Marking(userPet: paper.data[index]),
//               ),
//             );
//           },
//           title: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   "Marking",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
}
