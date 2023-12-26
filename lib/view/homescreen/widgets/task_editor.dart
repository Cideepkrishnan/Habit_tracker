import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/model/tesk_model.dart';
import 'package:habit_tracker/view/homescreen/homescreen.dart';
import 'package:hive/hive.dart';

class TaskEditor extends StatefulWidget {
  TaskEditor({this.task, Key? key}) : super(key: key);
  Task? task;
  @override
  State<TaskEditor> createState() => _TaskEditorState();
}

class _TaskEditorState extends State<TaskEditor> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _taskTitle = TextEditingController(
        text: widget.task == null ? null : widget.task!.title!);
    TextEditingController _taskNote = TextEditingController(
        text: widget.task == null ? null : widget.task!.note!);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.task == null ? "Add a new Task" : "Update your Task",
            style: GoogleFonts.robotoSlab(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your task title",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 12,
            ),
            TextField(
              controller: _taskTitle,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade200.withAlpha(75),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Title"),
            ),
            SizedBox(
              height: 40,
            ),
            Text("Your task Note",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 12,
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              maxLength: 25,
              controller: _taskNote,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue.shade200.withAlpha(75),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Write some note"),
            ),
            Expanded(
                child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                child: RawMaterialButton(
                  onPressed: () async {
                    // function for Add or Update  our task
                    var newTask = Task(
                      title: _taskTitle.text,
                      note: _taskNote.text,
                      creation_date: DateTime.now(),
                      done: false,
                    );
                    Box<Task> taskbox = Hive.box<Task>("tasks");
                    if (widget.task != null) {
                      widget.task!.title = newTask.title;
                      widget.task!.note = newTask.note;
                      widget.task!.save();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    } else {
                      await taskbox.add(newTask);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }
                  },
                  fillColor: Colors.blueAccent.shade400,
                  child:
                      Text(widget.task == null ? "Add new Task" : "Update task",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
