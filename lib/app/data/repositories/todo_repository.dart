import 'package:getx_example/app/data/api/api.dart';

class TodoRepository with UseApi {
  Future<List> getTodos() async {
    final res = await todoApi.getTodos();
    return res.body?['todos'] ?? [];
  }
}
