import 'package:get/get.dart';

import '../controllers/todo_controller.dart';

class TodoBinding extends Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut<TodoController>(() => TodoController()),
    ];
  }
}
