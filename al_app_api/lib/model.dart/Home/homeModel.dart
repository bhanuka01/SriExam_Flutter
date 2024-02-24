import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  const HomeModel111(this.name, this.page, this.pic);

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
                  // Row(
                  //   children: [
                  //     GradientText(
                  //       name,
                  //       style: const TextStyle(
                  //         fontSize: 26,
                  //         fontWeight: FontWeight.w800,
                  //       ),
                  //       gradient: LinearGradient(
                  //           colors: color1,
                  //           begin: Alignment.topCenter,
                  //           end: Alignment.bottomCenter,
                  //           stops: [0, 0.1]
                  //
                  //           ),
                  //     ),
                  //
                  //   ],
                  // ),
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
    this.text, {
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
