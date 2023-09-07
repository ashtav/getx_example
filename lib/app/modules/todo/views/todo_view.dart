import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/todo_controller.dart';

class TodoView extends GetView<TodoController> {
  const TodoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return LzLoader.bar(message: 'Loading...');
        }

        final todos = controller.todos;

        if (todos.isEmpty) {
          return const LzNoData(message: 'No data found');
        }

        return Refreshtor(
          onRefresh: () async => controller.getTodos(),
          child: LzListView(
            padding: Ei.zero,
            children: todos.generate((item, i) {
              bool isCompleted = item.completed ?? false;

              return InkTouch(
                onTap: () {
                  controller.mark(item.id!);
                },
                padding: Ei.all(20),
                border: Br.only(['t'], except: i == 0),
                child: Row(
                  mainAxisAlignment: Maa.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color:
                                isCompleted ? Colors.green : Colors.transparent,
                            border: isCompleted ? null : Border.all(),
                            borderRadius: Br.radius(15),
                          ),
                          margin: Ei.only(r: 20),
                        ),
                        Text('${item.todo}').flexible(),
                      ],
                    ).flexible(),
                    Iconr(Ti.x,
                            padding: Ei.all(13),
                            color: Colors.black45,
                            margin: Ei.only(l: 20))
                        .onTap(() {
                      LzConfirm(
                          title: 'Delete Todo',
                          message: 'Are you sure want to delete this todo?',
                          onConfirm: () {
                            controller.remove(item.id!);
                          }).show(context);
                    })
                  ],
                ),
              );
            }),
          ),
        );
      }),
    );
  }
}
