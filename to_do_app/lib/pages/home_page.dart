import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
 void checkBoxChanged (int index) {
  setState(() {
    toDoList[index][1] = !toDoList[index][1];
  });
    // toDoList[index][1] = !!toDoList[index][1];
 }

 void addNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
 }

void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
     // _controller.clear();
    });
 }

  List toDoList = [
    ["Learn Flutter", false],
    ["Learn Java", false],
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
          return TodoList(
            taskName: toDoList[index][0],
             taskCompleted:toDoList[index][1], 
            onChanged: (value){
          checkBoxChanged(index);
            },
            deleteFunction: (context){
              deleteTask(index);
            },

          );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller ,
                decoration: InputDecoration(
                  hintText: "Add new todo items",
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.deepPurple),
                    borderRadius: BorderRadius.circular(15),
                  )
        
                ),
              ),
            )),
            FloatingActionButton(
              onPressed: addNewTask,
              //   showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         title: const Text('Add Task'),
              //         content: const TextField(
              //           autofocus: true,
              //           decoration: const InputDecoration(
              //             hintText: 'Enter Task Here',
              //           ),
              //         ),
              //         actions: [
              //           TextButton(
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //             },
              //             child: const Text('Cancel'),
              //           ),
              //           TextButton(
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //             },
              //             child: const Text('Add'),
              //           ),
              //         ],
              //       );
              //     },
              //   );
              // },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
