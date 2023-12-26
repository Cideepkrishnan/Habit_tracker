import 'package:flutter/material.dart';
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
                child: Text(
                  widget.task.title!,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TaskEditor(
                            task: widget.task,
                          ),
                        ));
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Color.fromARGB(255, 46, 83, 47),
                  )),
              IconButton(
                  onPressed: () {
                    widget.task.delete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          Divider(
            color: Colors.black87,
            height: 28,
            thickness: 1.0,
          ),
          Text(widget.task.note!)
        ],
      ),
    );
  }
}
