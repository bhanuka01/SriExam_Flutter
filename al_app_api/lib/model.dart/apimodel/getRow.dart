import 'package:al_app_api/model.dart/apimodel/papertapp.dart';

import 'package:flutter/material.dart';

import '../../apijson/cmathsjsn.dart';

import '../Home/imageModel.dart';
import 'markingtap.dart';

class ChemRow1 extends StatelessWidget {
  final int index;
  final Cmathsjson paper;

  const ChemRow1({
    super.key,
    required this.index,
    required this.paper,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
        child: Container(
          color: const Color(0xff010b2b),
          // decoration: BoxDecoration(
          //
          //   borderRadius: BorderRadius.circular(15),
          //   image:  DecorationImage(
          //     image: const AssetImage("assets/png/math.png"),
          //     fit: BoxFit.cover,
          //     colorFilter:ColorFilter.mode(
          //       Colors.black
          //           .withOpacity(0.4),
          //       BlendMode.srcATop,
          //     ),
          //   ),
          //
          //   // borderRadius: BorderRadius.circular(9),
          // ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Paper1(userPet: paper.data[index]),
                ),
              );
            },
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    paper.data[index].year,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colorlab.white,
                    ),
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

class ChemRow2 extends StatelessWidget {
  final int index;
  final Cmathsjson paper;

  const ChemRow2({
    super.key,
    required this.index,
    required this.paper,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: const Color(0xff010b2b),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   image:  DecorationImage(
          //     image: const AssetImage("assets/png/math.png"),
          //     fit: BoxFit.cover,
          //     colorFilter:ColorFilter.mode(
          //       Colors.black
          //           .withOpacity(0.5),
          //       BlendMode.srcATop,
          //     ),
          //   ),
          //
          // ),
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Marking1(userPet: paper.data[index]),
                ),
              );
            },
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    paper.data[index].mark,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colorlab.white,
                    ),
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
