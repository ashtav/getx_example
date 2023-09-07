import 'package:get/get.dart';
import 'package:getx_example/app/data/models/todo_model.dart';
import 'package:getx_example/app/data/repositories/todo_repository.dart';
import 'package:lazyui/lazyui.dart';

class TodoController extends GetxController{
  RxList<Todo> todos = RxList([]);
  RxBool isLoading = false.obs;
  
  Future getTodos() async {
    try {
      isLoading.value = true;

      List data = await TodoRepository().getTodos();
      todos.value = data.map((e) => Todo.fromJson(e)).toList();
    } catch (e, s) {
      Errors.check(e, s);
    } finally {
      isLoading.value = false;
    }
  }

  void mark(int id) async {
    try {
      Todo data = todos.firstWhere((element) => element.id == id, orElse: () => Todo());
      
      if(data.id != null){
        data.completed = !data.completed!;
        todos[todos.indexWhere((element) => element.id == id)] = data;
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  void remove(int id){
    todos.removeWhere((element) => element.id == id);
  }

  @override
  void onInit() {
    getTodos();
    super.onInit();
  }
}
