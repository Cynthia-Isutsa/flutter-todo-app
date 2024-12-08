import "package:flutter/material.dart";

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.taskName});

    final String taskName;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 0,
            ),
            child: Container (
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                 color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
             
              child: Text(
                taskName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                ),
            ),
          );
  }
}