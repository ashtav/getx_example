import 'package:fetchly/fetchly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/app/core/constants/theme.dart';
import 'package:lazyui/lazyui.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LazyUi.config(alwaysPortrait: true);

  UseFetchly(
      baseUrl: 'https://dummyjson.com/',
      onRequest: (status, data) {
        logg('listen to request: $status');
      }).init();

  runApp(
    GetMaterialApp(
        title: "Getx Example",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        builder: LazyUi.builder),
  );
}
