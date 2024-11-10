import 'package:flutter/material.dart';

import 'dart:ui';

import '../model.dart/Home/imageModel.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox(
      {super.key,
      required this.theWidth,
      required this.theHeight,
      required this.theChild});

  final theWidth;
  final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width / theWidth,
          height: MediaQuery.of(context).size.height / theHeight,
          color: Colorlab.transparent,
          //we use Stack(); because we want the effects be on top of each other,
          //  just like layer in photoshop.
          child: Stack(
            children: [
              //blur effect ==> the third layer of stack
              BackdropFilter(
                filter: ImageFilter.blur(
                  //sigmaX is the Horizontal blur
                  sigmaX: 2.0,
                  //sigmaY is the Vertical blur
                  sigmaY: 3.0,
                ),
                //we use this container to scale up the blur effect to fit its
                //  parent, without this container the blur effect doesn't appear.
                child: Container(),
              ),
              //gradient effect ==> the second layer of stack
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colorlab.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //begin color
                        const Color.fromARGB(255, 255, 255, 255).withOpacity(0.15),
                        //end color
                        const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                      ]),
                ),
              ),
              //child ==> the first/top layer of stack
              Center(child: theChild),
            ],
          ),
        ),
      ),
    );
  }
}

class FrostedGlassBox1 extends StatelessWidget {
  const FrostedGlassBox1(
      {super.key,
      // required this.theWidth,
      // required this.theHeight,
      required this.theChild});

  // final theWidth;
  // final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width / 1,
          height: MediaQuery.of(context).size.height / 1,
          color: Colorlab.transparent,
          //we use Stack(); because we want the effects be on top of each other,
          //  just like layer in photoshop.
          child: Stack(
            children: [
              //blur effect ==> the third layer of stack
              BackdropFilter(
                filter: ImageFilter.blur(
                  //sigmaX is the Horizontal blur
                  sigmaX: 4.0,
                  //sigmaY is the Vertical blur
                  sigmaY: 4.0,
                ),
                //we use this container to scale up the blur effect to fit its
                //  parent, without this container the blur effect doesn't appear.
                child: Container(),
              ),
              //gradient effect ==> the second layer of stack
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colorlab.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //begin color
                        Colorlab.white.withOpacity(0.15),
                        //end color
                        Colorlab.white.withOpacity(0.05),
                      ]),
                ),
              ),
              //child ==> the first/top layer of stack
              Center(child: theChild),
            ],
          ),
        ),
      ),
    );
  }
}
