import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';

class UserController extends GetxController {
  RxList<String> users = RxList([]);
  RxBool isLoading = false.obs;

  Future fetch() async {
    try {
      isLoading.value = true;
      await Future.delayed(1.s);
      users.value = 5.generate((item) => Faker.name());
    } catch (e, s) {
      Errors.check(e, s);
    } finally {
      isLoading.value = false;
    }
  }

  void create() {
    users.add(Faker.name());
  }

  void delete(int index) {
    users.removeAt(index);
  }

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}
