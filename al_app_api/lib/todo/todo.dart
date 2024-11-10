import 'package:al_app_api/admob/admob.dart';
import 'package:al_app_api/model.dart/Home/imageModel.dart';
import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'frostedGlass.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late final InterstitialAd interstitialAd;

  late BannerAd bannerAd;
  bool isloadad = false;
  List<TodoItem> todos = [];

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    _loadTodoList();
    initbannerad();
  }

  initbannerad() {
    bannerAd = BannerAd(
        size: AdSize.largeBanner,
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

  Future<void> _loadTodoList() async {
    sharedPreferences = await SharedPreferences.getInstance();
    List<String>? storedList = sharedPreferences.getStringList('todoList');
    if (storedList != null) {
      setState(() {
        todos = storedList.map((item) => TodoItem.fromMapString(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    todos.sort((a, b) {
      if (a.isDone && !b.isDone) {
        return 1; // Move checked todos to the bottom
      } else if (!a.isDone && b.isDone) {
        return -1; // Move unchecked todos to the top
      } else {
        return a.index.compareTo(b
            .index); // Sort by index if both todos have the same checked status
      }
    });
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Todo List'),

      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5,left: 5,top: 5),
            child: ClipRRect(

              borderRadius: BorderRadius.circular(10),
              child: Container(

                color: Colors.teal,
                // margin: const EdgeInsets.only(top: 5),
                child: ListTile(
                    // leading: StatefulBuilder(
                    //   builder: (BuildContext context, StateSetter setState) {
                    //     return Theme(
                    //       data: Theme.of(context).copyWith(
                    //         unselectedWidgetColor: Colorlab.white,
                    //       ),
                    //       child: Checkbox(
                    //         // activeColor: Colors.amber,
                    //         // checkColor: Colors.amber,
                    //         // focusColor: Colors.amber,
                    //         // hoverColor: Colors.amber,
                    //         value: todos[index].isDone,
                    //         onChanged: (bool? value) {
                    //           setState(() {
                    //             todos[index].isDone = value!;
                    //             _saveTodoList();
                    //             _loadTodoList();
                    //           });
                    //         },
                    //       ),
                    //     );
                    //   },
                    // ),
                    leading: MSHCheckbox(
                      size: 35,
                      value: todos[index].isDone,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: Colors.tealAccent,
                      ),
                      style: MSHCheckboxStyle.fillScaleCheck,
                      onChanged: (value) {
                        setState(() {
                          todos[index].isDone = value;
                          _saveTodoList();
                          _loadTodoList();
                        });
                      },
                    ),
                    title: Text(
                      todos[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: Colorlab.white,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          todos.removeAt(index);
                          _saveTodoList();
                        });
                      },
                    )),
              ),
            ),
          );
          //   Slidable(
          //   endActionPane: ActionPane(
          //     motion: const BehindMotion(),
          //     children: [
          //       SlidableAction(
          //         spacing: 5,
          //         onPressed: (context) {
          //           setState(() {
          //             todos.removeAt(index);
          //             _saveTodoList();
          //           });
          //         },
          //         backgroundColor: Colorlab.red,
          //         icon: Icons.delete,
          //         label: 'Delete',
          //       ),
          //     ],
          //   ),
          //   // actionPane: SlidableDrawerActionPane(),
          //   // actionExtentRatio: 0.25,
          //
          //   child: Container(
          //     color: const Color.fromARGB(255, 63, 63, 63),
          //     margin: const EdgeInsets.only(
          //       top: 5,
          //     ),
          //     child: ListTile(
          //       leading: StatefulBuilder(
          //         builder: (BuildContext context, StateSetter setState) {
          //           return Theme(
          //             data: Theme.of(context).copyWith(
          //               unselectedWidgetColor: Colorlab.white,
          //             ),
          //             child: Checkbox(
          //               // activeColor: Colors.amber,
          //               // checkColor: Colors.amber,
          //               // focusColor: Colors.amber,
          //               // hoverColor: Colors.amber,
          //               value: todos[index].isDone,
          //               onChanged: (bool? value) {
          //                 setState(() {
          //                   todos[index].isDone = value!;
          //                   _saveTodoList();
          //                   _loadTodoList();
          //                 });
          //               },
          //             ),
          //           );
          //         },
          //       ),
          //       title: Text(
          //         todos[index].title,
          //         style: const TextStyle(
          //           fontWeight: FontWeight.w800,
          //           fontSize: 25,
          //           color: Colorlab.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.tealAccent,
        // foregroundColor: Colors.black,
        onPressed: () {
          _addTodoItem();
        },
      ),
      bottomNavigationBar: isloadad
          ? SizedBox(
              height: bannerAd.size.height.toDouble(),
              width: bannerAd.size.width.toDouble(),
              child: AdWidget(ad: bannerAd),
            )
          : const SizedBox(),
    );
  }

  Future<void> _saveTodoList() async {
    List<String> serializedList =
        todos.map((item) => item.toMapString()).toList();
    await sharedPreferences.setStringList('todoList', serializedList);
  }

  void _addTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _textFieldController = TextEditingController();
        return FrostedGlassBox(
          theWidth: 1,
          theHeight: 1,
          theChild: AlertDialog(
            backgroundColor: Colorlab.transparent,
            elevation: 0,
            title: const Text(
              'Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
                color: Colorlab.white,
              ),
            ),
            content: TextField(
              maxLines: null,
              autofocus: true,
              controller: _textFieldController,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 25,
                color: Colorlab.white,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'CANCEL',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colorlab.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Colorlab.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    todos.add(
                      TodoItem(
                        title: _textFieldController.text,
                        isDone: false,
                        index: 0,
                      ),
                    );
                    _saveTodoList();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class TodoItem {
  String title;
  bool isDone;
  int index;

  TodoItem({required this.title, required this.isDone, required this.index});

  TodoItem.fromMapString(String mapString)
      : title = mapString.split('::')[0],
        isDone = mapString.split('::')[1] == 'true',
        index = 0;

  String toMapString() {
    return '$title::${isDone.toString()}';
  }
}
