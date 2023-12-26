import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/model/tesk_model.dart';
import 'package:habit_tracker/view/homescreen/widgets/task_editor.dart';

class MyListTile extends StatefulWidget {
  MyListTile(this.task, this.inex, {super.key});
  Task task;
  int inex;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(widget.task.title!,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              // Edit and delete functions
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskEditor(
                          task: widget.task,
                        ),
                      ));
                },
                // here we use an image for edit
                child: Container(
                  height: 18,
                  child: Image.asset("assets/image/pencil (2).png"),
                ),
              ),
              SizedBox(
                width: 20,
              ),

              InkWell(
                onTap: () {
                  widget.task.delete();
                },
                // here we use an image for delete
                child: Container(
                  height: 22,
                  child: Image.asset("assets/image/delete.png"),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black87,
            height: 28,
            thickness: 1.0,
          ),
          Text(
            widget.task.note!,
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
