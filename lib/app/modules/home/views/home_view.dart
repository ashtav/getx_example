import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app/modules/home/views/conter_view.dart';
import 'package:getx_example/app/routes/app_pages.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx Example'),
        centerTitle: true,
      ),
      body: LzListView(children: [
        Column(
          children: [
            'Counter',
            'Users (Static)',
            'Todos (API)',
          ].generate((item, i) {
            return InkTouch(
              onTap: () {
                switch (i) {
                  case 0:
                    context.bottomSheet(const CounterView());
                    break;

                  case 1:
                    Get.toNamed(Routes.USER);
                    break;

                  case 2:
                    Get.toNamed(Routes.TODO);
                    break;

                  default:
                }
              },
              padding: Ei.all(20),
              color: Colors.white,
              border: Br.only(['t'], except: i == 0),
              child: Row(
                mainAxisAlignment: Maa.spaceBetween,
                children: [
                  Text(item),
                  const Icon(Ti.chevronRight, color: Colors.black45)
                ],
              ),
            );
          }),
        ).clip(all: 7).border(Br.all(), radius: Br.radius(7))
      ]),
    );
  }
}
