import 'package:ecommerce/map/map1.dart';
import 'package:ecommerce/map/map_screen.dart';
import 'package:ecommerce/map/map_view.dart';
import 'package:ecommerce/view/cart/saveOrder.dart';
import 'package:ecommerce/view/cart/cart_view.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/home/home_view.dart';

import 'package:ecommerce/view/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  get navigotorValue => _navigatorValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;

  @override
  void onInit() {
    _currentScreen = HomeView();
    print('onitttt');
    // Here you can fetch you product from server
    super.onInit();
    update();
  }

  @override
  void onReady() {
    print("ready");
    _currentScreen = HomeView();
    super.onReady();
  }

  @override
  void onClose() {
    print("close");
    _currentScreen = HomeView();

    // Here, you can dispose your StreamControllers
    // you can cancel timers
    super.onClose();
  }

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;

    switch (selectedValue) {
      case 0:
        {
          _currentScreen = HomeView();

          break;
        }
      case 1:
        {
        //  _currentScreen = CartView2();
  // Get.to(MapView());
          // _currentScreen = CartView2();
          Get.to(CategoryView()); // SaveOrder('x');
          break;
        }
      case 2:
        {
          Get.to(CartView2()); // SaveOrder('x');
          break;
          // _currentScreen = ProfileView();

        }
      case 3:
        {
          Get.to(ProfileView());
          break;
        }
    }
    update();
  }
}
