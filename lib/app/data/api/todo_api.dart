part of api;

class TodoApi extends Fetchly {
  Future<ResHandler> getTodos() async => get('todos');
}
