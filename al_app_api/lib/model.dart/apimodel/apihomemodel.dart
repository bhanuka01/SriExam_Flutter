import 'package:al_app_api/model.dart/Home/imageModel.dart';
import 'package:al_app_api/model.dart/apimodel/papertapp.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'dart:convert';

import '../../apijson/cmathsjsn.dart';


class Home1 extends StatefulWidget {
  const Home1({super.key});

  // const Home1({super.key});

  // late String url;
  // Home1(this.url);

  @override
  State<Home1> createState() => _Home1State(/*this.url*/);
}

class _Home1State extends State<Home1> {
  // _Home1State(this.url);

  // late String url;
  late Cmathsjson paper;
  // for data is loaded flag
  bool isDataLoaded = false;
  // error holding
  String errorMessage = '';
  Future<Cmathsjson> getDataFromAPI() async {
    Uri uri = Uri.parse("https://bhanuka01.github.io/alapi/maths11.json");
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/image/b1.jpg"),
        fit: BoxFit.cover,
      )),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colorlab.transparent,
          // appBar: AppBar(
          //   title: const Text('Rest API Call'),
          //   centerTitle: true,
          // ),
          body: isDataLoaded
              ? errorMessage.isNotEmpty
                  ? Text(errorMessage)
                  : paper.data.isEmpty
                      ? const Text('No Data')
                      : ListView.builder(
                          itemCount: paper.data.length,
                          itemBuilder: (context, index) => getRow(index),
                        )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: const AssetImage("assets/image/w1.jpg"),
              fit: BoxFit.cover,
            )),
        child: ListTile(
          onTap: () {
            // Navigate to Next Details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Paper1(userPet: paper.data[index]),
              ),
            );
          },
          // leading: CircleAvatar(
          //   radius: 21,
          // backgroundColor:
          //     usersPets.data[index].isFriendly ? Colors.green : Colors.red,
          // child: CircleAvatar(
          //   radius: 20,
          // backgroundColor:
          //     usersPets.data[index].isFriendly ? Colors.green : Colors.red,
          // backgroundImage: NetworkImage(usersPets.data[index].image),
          //   ),
          // ),
          title: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  paper.data[index].year,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colorlab.white,
                  ),
                ),
                // Text('${usersPets.data[index].paper}'),
              ],
            ),
          ),
          // trailing: Text("ID ${usersPets.data[index].id}"),
          // trailing: Icon(
          //   usersPets.data[index].isFriendly ? Icons.pets : Icons.do_not_touch,
          //   color: usersPets.data[index].isFriendly ? Colors.green : Colors.red,
          // ),
        ),
      ),
    );
  }
}
