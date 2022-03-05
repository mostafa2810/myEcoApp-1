import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/services/database/cart_database_helper2.dart';
import 'package:ecommerce/view/check/order_status.dart';
import 'package:ecommerce/view/check/order_status2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckOutViewModel extends GetxController {
  List<CartProductModel> _cartProductModel = [];

  List<CartProductModel> get cartProductModel => _cartProductModel;

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  DeleteProducts2(CartProductModel cartProductModel, String productId) async {
    var dbHelper = CartDatabaseHelper.db;
    await dbHelper.Delete(cartProductModel);
    print("delete Done");
//    _cartProductModel.add(cartProductModel);
    _totalPrice = 0;
    _cartProductModel = [];
    update();
  }


  void checkout(
      String address, String apartment, String floor, String mobile,
      num total, List<CartProductModel> order, num sub_total,
      String brand_email
      ) async {
    String pr, pr1, pr2, pr3, pr4, pr5, pr6, pr7, pr8, pr9, pr10;
    int q, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10;
    String order_id;
    DateTime now = DateTime.now();
    String time = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    print("add6666");

    for (int i = 0; i <= order.length; i++) {
      pr = order[0].name ?? "";
      q = order[0].quantity ?? 0;
      if (order.length == 1) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;
        pr1 = "";
        pr2 = "";
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q2 = 0;
        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }
      if (order.length == 2) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;
        print("222222222");
        pr1 = order[1].name;
        q1 = order[1].quantity;

        pr2 = "";
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        //  q1 = 0;
        q2 = 0;
        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 3) {
        pr = order[0].name ?? "";
        q = order[0].quantity ?? 0;
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        pr3 = "";
        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";


        q3 = 0;
        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 4) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;

        pr4 = "";
        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q4 = 0;
        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 5) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;

        pr5 = "";
        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q5 = 0;
        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 6) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;

        pr6 = "";
        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q6 = 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 7) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";

        pr7 = "";
        pr8 = "";
        pr9 = "";
        pr10 = "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 8) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";

        pr8 = "";
        pr9 = "";
        pr10 = "";

        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = 0;
        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 9) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";
        pr8 = order[8].name ?? "";

        pr9 = '';
        pr10 = '';
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = order[8].quantity ?? 0;

        q9 = 0;
        q10 = 0;

        update();
      }

      if (order.length == 10) {
        pr1 = order[1].name ?? "";
        pr2 = order[2].name ?? "";
        pr3 = order[3].name ?? "";
        pr4 = order[4].name ?? "";
        pr5 = order[5].name ?? "";
        pr6 = order[6].name ?? "";
        pr7 = order[7].name ?? "";
        pr8 = order[8].name ?? "";
        pr9 = order[9].name ?? "";
        pr10 = "";
        q1 = order[1].quantity ?? 0;
        q2 = order[2].quantity ?? 0;
        q3 = order[3].quantity ?? 0;
        q4 = order[4].quantity ?? 0;
        q5 = order[5].quantity ?? 0;
        q6 = order[6].quantity ?? 0;
        q7 = order[7].quantity ?? 0;
        q8 = order[8].quantity ?? 0;
        q9 = order[9].quantity ?? 0;
        q10 = 0;
        update();
      }

      // if(order.length<=10){
      //   pr1= order[1].name??"" ;
      //   pr2= order[2].name??"" ;
      //   pr3=order[3].name??"" ;
      //   pr4=order[4].name??"" ;
      //   pr5=order[5].name??"" ;
      //   pr6=order[6].name??"" ;
      //   pr7=order[7].name??"" ;
      //   pr8=order[8].name??"" ;
      //   pr9=order[9].name??"" ;
      //   pr10=order[10].name??"" ;
      // }
      // else{
      //
      //   pr10="" ;
      // }

      // q=order[0].quantity??0;
      // q1=order[1].quantity??0;
      // q2=order[2].quantity??0;
      // q3=order[3].quantity??0;
      // q4=order[4].quantity??0;
      // q5=order[5].quantity??0;
      // q6=order[6].quantity??0;
      // q7=order[7].quantity??0;
      // q8=order[8].quantity??0;
      // q9=order[9].quantity??0;
      // q10=order[10].quantity??0;

    }

    print("orderL=" + order.length.toString());

    print("ppp=" + pr3);

    final FirebaseAuth auth = FirebaseAuth.instance;
    final User user = auth.currentUser;
    final uid = user.email;

    if (order.length == 1) {
      print("addd: " + address[0]);

      var random = new Random();
      var x = random.nextInt(5000);
      print('x=' + x.toString());
      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
         'brand_email':brand_email,
        'order_id': mobile[5] +
            x.toString() +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
      });
      order_id = (mobile[5] +
              x.toString() +
              address[0] +
              apartment[1] +
              address[2] +
              floor[0] +
              mobile[4] +
              mobile[2] +
              mobile[8])
          .toString();
    }

    if (order.length == 2) {
      var random = new Random();
      var x = random.nextInt(10000);
      print('x=' + x.toString());

      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': x.toString() +
            mobile[5] +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
      });
      order_id = (x.toString() +
              mobile[5] +
              address[0] +
              apartment[1] +
              address[2] +
              floor[0] +
              mobile[4] +
              mobile[2] +
              mobile[8])
          .toString();
    }

    if (order.length == 3) {
      var random = new Random();
      var x = random.nextInt(1000);
      print('x=' + x.toString());

      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'time': time,
        'total_amount': sub_total,
        'order_status': 'pending',
        'order_id': mobile[5] +
            x.toString() +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8] +
            x.toString()
      });
      order_id = mobile[5] +
          x.toString() +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8] +
          x.toString();
    }

    if (order.length == 4) {
      var random = new Random();
      var x = random.nextInt(1000);
      print('x=' + x.toString());

      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'time': time,
        'total_amount': sub_total,
        'order_status': 'pending',
        'order_id': mobile[5] +
            address[0] +
            x.toString() +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
      });

      order_id = mobile[5] +
          address[0] +
          x.toString() +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8];
    }

    if (order.length == 5) {
      var random = new Random();
      var x = random.nextInt(3000);
      print('x=' + x.toString());

      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': mobile[5] +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            x.toString() +
            mobile[2] +
            mobile[8]
      });

      order_id = mobile[5] +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          x.toString() +
          mobile[2] +
          mobile[8];
    }

    if (order.length == 6) {
      var random = new Random();
      var x = random.nextInt(2200);
      print('x=' + x.toString());
      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'ord 6': pr5 + " *  " + q5.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': mobile[5] +
            x.toString() +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
      });

      order_id = mobile[5] +
          x.toString() +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8];
    }

    if (order.length == 7) {
      var random = new Random();
      var x = random.nextInt(6600);
      print('x=' + x.toString());
      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'brand_email':brand_email,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'ord 6': pr5 + " *  " + q5.toString(),
        'ord 7': pr6 + " * " + q6.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': mobile[5] +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            x.toString() +
            mobile[8]
      });

      order_id = mobile[5] +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          x.toString() +
          mobile[8];
    }

    if (order.length == 8) {
      var random = new Random();
      var x = random.nextInt(8700);
      print('x=' + x.toString());
      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'brand_email':brand_email,
        'username': uid,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'ord 6': pr5 + " *  " + q5.toString(),
        'ord 7': pr6 + " * " + q6.toString(),
        'ord 8': pr7 + " * " + q7.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': mobile[5] +
            address[0] +
            apartment[1] +
            x.toString() +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
      });

      order_id = mobile[5] +
          address[0] +
          apartment[1] +
          x.toString() +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8];
    }

    if (order.length == 9) {
      var random = new Random();
      var x = random.nextInt(8900);
      print('x=' + x.toString());
      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'brand_email':brand_email,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'ord 6': pr5 + " *  " + q5.toString(),
        'ord 7': pr6 + " * " + q6.toString(),
        'ord 8': pr7 + " * " + q7.toString(),
        'ord 9': pr8 + " * " + q8.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': mobile[5] +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8] +
            x.toString()
        //order.toList(),//order[i].name,
      });

      order_id = mobile[5] +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8] +
          x.toString();
    }

    if (order.length == 10) {
      var random = new Random();
      var x = random.nextInt(1000);
      print('x=' + x.toString());

      await Firestore.instance
          .collection('orders_checkout')
          .document()
          .setData({
        'address': address.toString(),
        'apartment': apartment.toString(),
        'floor': floor.toString(),
        'mobile': mobile.toString(),
        'username': uid,
        'brand_email':brand_email,
        'ord 1': pr + " * " + q.toString(),
        'ord 2': pr1 + " * " + q1.toString(),
        'ord 3': pr2 + " * " + q2.toString(),
        'ord 4': pr3 + " * " + q3.toString(),
        'ord 5': pr4 + " * " + q4.toString(),
        'ord 6': pr5 + " *  " + q5.toString(),
        'ord 7': pr6 + " * " + q6.toString(),
        'ord 8': pr7 + " * " + q7.toString(),
        'ord 9': pr8 + " * " + q8.toString(),
        'ord 10': pr9 + " * " + q9.toString(),
        'ord 11': pr10 + " * " + q10.toString(),
        'order_status': 'pending',
        'time': time,
        'total_amount': sub_total,
        'order_id': x.toString() +
            mobile[5] +
            address[0] +
            apartment[1] +
            address[2] +
            floor[0] +
            mobile[4] +
            mobile[2] +
            mobile[8]
        //order.toList(),//order[i].name,
      });
      order_id = x.toString() +
          mobile[5] +
          address[0] +
          apartment[1] +
          address[2] +
          floor[0] +
          mobile[4] +
          mobile[2] +
          mobile[8];
    }
    print("uid=" + uid.toString());
    print("time =" + time.toString());


    Get.offAll(OrderStatusView2(order_id: order_id,cartmodel:_cartProductModel));
    // Get.offAll(OrderStatus(
    //   order_id: order_id,
    //   cartmodel: _cartProductModel,
    // ));



    print("add999");

  }
}
