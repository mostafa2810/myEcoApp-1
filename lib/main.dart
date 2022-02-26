


// ignore_for_file: unused_import
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sqflite/sqflite.dart';
import 'notification/test_notofication.dart';
import 'viewmodel/cart_viewmodel.dart';
import 'view/home/controll_view.dart';
import 'helper/binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 // Get.put(CartViewModel());
  Get.put(ControlViewModel());
  Get.put(CartViewModel());
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Binding(),
  debugShowCheckedModeBanner:false,
      home:Scaffold(
        body:ControlView(),
        //notification_test(),
        //
      ),
      theme:ThemeData()
    );
  }
}
//mvvm ----> model View viewModel

