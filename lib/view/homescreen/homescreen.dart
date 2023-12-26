import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/model/tesk_model.dart';
import 'package:habit_tracker/view/homescreen/widgets/my_list_tile.dart';
import 'package:habit_tracker/view/homescreen/widgets/task_editor.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Habit Tracker",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: Hive.box<Task>("tasks").listenable(),
        builder: (context, box, _) {
          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Todays Task",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  formatDate(DateTime.now(), [d, ",", M, " ", yyyy]),
                ),
                Divider(
                  height: 40,
                  thickness: 1,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) {
                    Task currentTask = box.getAt(index)!;
                    return MyListTile(currentTask, index);
                  },
                ))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // create a screen for add new tasks
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskEditor(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
