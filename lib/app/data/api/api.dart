library api;

import 'package:fetchly/fetchly.dart';

part 'todo_api.dart';

mixin UseApi {
  TodoApi todoApi = TodoApi();
}