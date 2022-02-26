

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressViewModel extends GetxController{


  TextEditingController address= TextEditingController();
  TextEditingController apartment= TextEditingController();
  TextEditingController floor= TextEditingController();
  TextEditingController mobile = TextEditingController();

   void addAddress() async{
     print("add6666");
     await Firestore.instance.collection('address').document()
         .setData({
       'address': address.text.toString(),
       'apartment': apartment.text.toString(),
       'floor': floor.text.toString(),
       'mobile':mobile.text.toString(),
       'username':'z',

     }
     );
     print("add999");
    }



}