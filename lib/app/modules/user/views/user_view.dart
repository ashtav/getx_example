import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          actions: [
            const Icon(Ti.plus).onPressed(() {
              controller.create();
            })
          ],
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return LzLoader.bar(message: 'Loading...');
          }

          final users = controller.users;

          if (users.isEmpty) {
            return const LzNoData(message: 'No data found');
          }

          return Refreshtor(
            onRefresh: () => controller.fetch(),
            child: LzListView(
              children: users.generate((item, i) {
                final key = GlobalKey();

                return InkTouch(
                  onTap: () {
                    DropX.show(key,
                        options: ['Edit', 'Delete'].options(options: {
                          1: ['Confirm', 'Cancel']
                              .options(pops: [1], dangers: [0])
                        }), onSelect: (state) {
                      if (state.option == 'Confirm') {
                        controller.delete(i);
                      }
                    });
                  },
                  padding: Ei.all(20),
                  border: Br.only(['t'], except: i == 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Columnize(
                        children: [
                          Text(item),
                        ],
                      ).flexible(),
                      Icon(
                        Ti.dotsVertical,
                        color: Colors.black45,
                        key: key,
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        }));
  }
}
