// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'newui/homenew.dart';
import 'newui/mainhome.dart';
import 'screen/homeScreen.dart';

void main() async {
  // var device1 = ["23DF511880E18E0B330AD848B1546BB5"];
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  // ca-app-pub-3940256099942544~3347511713 text app
  // RequestConfiguration requestConfiguration =
  //     RequestConfiguration(testDeviceIds: device1);
  // MobileAds.instance.updateRequestConfiguration(requestConfiguration);
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   tools: [
    //     ...DevicePreview.defaultTools,
    //   ],
    //   builder: (context) => MyWidget1(),
    // ),
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainhome(),
      // home: TodoApp(),
    ),
  );
}

/// Represents Homepage for Navigation
// class MyWidget1 extends StatelessWidget {
//   const MyWidget1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: Homenew());
//   }
// }
