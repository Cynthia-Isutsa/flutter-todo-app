import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

class TodoList extends StatelessWidget {
  const TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged, 
      required this.deleteFunction
      });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane:  ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(15),
              // backgroundColor: Colors.red.shade300,
            ), 
          ],
          ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged, 
                checkColor: Colors.black, 
                side: const BorderSide(color: Colors.white, width: 2),
                //fillColor: Colors.white, 
                activeColor: Colors.white,
                ),
              Text(
                taskName,
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.white,
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                  decorationColor: Colors.white,
                  decorationThickness: 2,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
