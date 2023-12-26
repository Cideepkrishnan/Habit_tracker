import 'package:flutter/material.dart';
import 'package:habit_tracker/model/tesk_model.dart';
import 'package:habit_tracker/view/homescreen/homescreen.dart';
import 'package:hive_flutter/adapters.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  box = await Hive.openBox<Task>("tasks");
  // default task made for intro
  // if you dont want delete this code
  // box.add(Task(
  //     title: "This is the first task",
  //     note: "this is the first  defauld task made with this app",
  //     creation_date: DateTime.now()));

  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
