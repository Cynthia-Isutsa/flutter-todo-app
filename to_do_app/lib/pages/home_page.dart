import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_list.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

 
   

  List toDoList = [
    ["Learn Flutter", false],
    ["Learn Dart", false],
    ["Learn React", false],
    ["Learn Node", false],
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Center(child: Text("To Do App")),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,

      ),
      body: ListView.builder(itemCount: toDoList.length, itemBuilder: (BuildContext context, index){
          return TodoList()
      })
    );
  }
}
