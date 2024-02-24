// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, unused_local_variable

import 'package:al_app_api/model.dart/Home/imageModel.dart';
import 'package:flutter/material.dart';

class StremBack extends StatelessWidget {
  // const StremBack({super.key});
  Widget thechild;
  StremBack({required this.thechild});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (AppColor.steambool == true)
          Expanded(
            child: Container(
              color: Colorlab.black,

              child: thechild,
            ),
          )
        else
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                // color: AppColor.subCol,
                image: DecorationImage(
                  image: AssetImage(AbImage1.home),
                  fit: BoxFit.cover,
                ),
              ),
              child: thechild,
            ),
          )
      ],
    );
  }
}

class SubBack extends StatelessWidget {
  // const SubBack({super.key});
  Widget thechild;
  SubBack({required this.thechild});

  @override
  Widget build(BuildContext context) {
    bool bh = true;
    return Column(
      children: [
        if (AppColor.subbool == true)
          Expanded(
            child: Container(
              color: Colorlab.black,

              child: thechild,
            ),
          )
        else
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                // color: AppColor.subCol,
                image: DecorationImage(
                  image: AssetImage(AbImage1.subject),
                  fit: BoxFit.cover,
                ),
              ),
              child: thechild,
            ),
          )
      ],
    );
  }
}

class YearBack extends StatelessWidget {
  // const YearBack({super.key});
  Widget thechild;
  YearBack({required this.thechild});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (AppColor.yearbool == true)
          Expanded(
            child: Container(
              color: Colorlab.black,

              child: thechild,
            ),
          )
        else
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                // color: AppColor.subCol,
                image: DecorationImage(
                  image: AssetImage(AbImage1.year),
                  fit: BoxFit.cover,
                ),
              ),
              child: thechild,
            ),
          )
      ],
    );
  }
}
