

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViewModel extends GetxController{


  TextEditingController mobile= TextEditingController();
  TextEditingController service= TextEditingController();
  TextEditingController name= TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController email = TextEditingController();
  // TextEditingController floor= TextEditingController();
  // TextEditingController mobile = TextEditingController();


  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) => mobile.clear());
    WidgetsBinding.instance.addPostFrameCallback((_) => details.clear());
    super.onInit();
  }


   void sendService() async{

     print("add6666");
     await Firestore.instance.collection('ser').document()
         .setData({
       'name': name.text.toString(),
       'service': service.text.toString(),
       'mobile': mobile.text.toString(),
       'details':details.text.toString(),
       'email':email.text.toString(),
     }

     );
     Get.snackbar('done ', 'تم ارسال طلبك بنجاح ',backgroundColor:Colors.lightBlue,colorText:Colors.white,);

  //   Get.to(HomeView());
     print("add999");
    }


  void sendService2() async{

    print("add6666");
    await Firestore.instance.collection('ser2').document()
        .setData({
      'name': name.text.toString(),
      'astfsar': service.text.toString(),
      'mobile': mobile.text.toString(),
      'details':details.text.toString(),
      'email':email.text.toString(),
    }

    );
    Get.snackbar('done ', 'تم الارسال  بنجاح ',backgroundColor:Colors.lightBlue,colorText:Colors.white,);

    //   Get.to(HomeView());
    print("add999");
  }


  void sendService3() async{

    print("add6666");
    await Firestore.instance.collection('ser3').document()
        .setData({
      'name': name.text.toString(),
      'a3lan': service.text.toString(),
      'mobile': mobile.text.toString(),
      'details':details.text.toString(),
      'email':email.text.toString(),
    }

    );
    Get.snackbar('done ', 'تم الارسال  بنجاح ',backgroundColor:Colors.lightBlue,colorText:Colors.white,);

    //   Get.to(HomeView());
    print("add999");
  }


}