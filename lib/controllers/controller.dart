import 'package:get/get.dart';
import 'package:getx_increment_decrem/models/todo_model.dart';

class TodoController extends GetxController {
   var todos=List<Todo>.empty().obs;

   void addTodo(String title){
      todos.add(Todo(title: title));
   }

   void toggleTodoStatus(int index) {
      todos[index].isCompleted = !todos[index].isCompleted;
      todos.refresh();
   }

   void removeTodoAt(int index) {
      todos.removeAt(index);
   }
   void updateTodo(){

   }
}


