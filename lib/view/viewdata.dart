import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';

class TodoApp extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add a new task',
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = todoController.todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (_) {
                        todoController.toggleTodoStatus(index);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        todoController.removeTodoAt(index);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (textController.text.isNotEmpty) {
            todoController.addTodo(textController.text);
            textController.clear();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

