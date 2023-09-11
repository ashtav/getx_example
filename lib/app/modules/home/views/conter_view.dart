import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<CounterController>(() => CounterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() =>
            Text('${controller.counter.value}', style: Gfont.fs(50).bold)),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: Maa.end,
          crossAxisAlignment: Caa.end,
          children: [Ti.plus, Ti.minus].generate((item, i) {
            return FloatingActionButton(
              heroTag: 'tag-$i',
              child: Icon(item),
              onPressed: () {
                i == 0 ? controller.increment() : controller.decrement();
              },
            ).margin(t: 10);
          })),
    );
  }
}
