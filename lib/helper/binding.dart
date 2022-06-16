
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings
{
  @override
  void dependencies() {

     Get.lazyPut(() => AuthViewModel());
     Get.lazyPut(() => ControlViewModel());
     Get.lazyPut(() => HomeViewModel());

  }
}