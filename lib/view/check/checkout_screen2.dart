import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/order_status.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckOutScreen2 extends StatelessWidget {
  String country,city;
  String address;
  String apartment;
  String floor;
  String mobile;
  num total;
  List<CartProductModel> cartmodel;
  String brand_email;

  CheckOutScreen2(
      this.country,
    this.city,
    this.address,
    this.apartment,
    this.floor,
    this.mobile,
    this.total,
    this.cartmodel,
    this.brand_email
  );

  @override
  Widget build(BuildContext context) {
    int i2 = cartmodel.length;
    double opacity=0.0;
    num shipping_cost=22;
    TextEditingController _notesController = TextEditingController();
    // String cartmodel2=cartmodel.toString();
    return
      Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    // Colors.white,
                    Colors.white,
                    //Colors.lightBlueAccent,

                    // Colors.lightBlueAccent,
                    Colors.white,
                  ])),
              height: 30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                          width:120
                        //MediaQuery.of(context).size.width * 0.62
                      ),
                      Container(
                        width:40,
                        //width:57,
                        child: Image.asset("assets/wh3.jpeg",
                            fit:BoxFit.fitWidth
                        ),
                      ),
                      SizedBox(
                          width: 5
                      ),
                    ],
                  ))),
        ),
      body: GetBuilder<CheckOutViewModel>(
          init: CheckOutViewModel(),
          builder: (controller) => Container(
                  child: Center(
                child: ListView(
                  children: [

                    SizedBox(height: 3),
                    Container(
                      color:Colors.white,
                      height:120,
                      width:600,
                      child:Image.asset('assets/wh3.jpeg'),
                    ),
                    Container(
                        width: 300,
                        height: 580,
                        child: Card(
                        //  color: Colors.grey[100],
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              "Your Order",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 22),
                            )),
                            for (int i = 0; i < i2; i++)
                              Row(
                                children: [
                                  Text(
                                    "     " + cartmodel[i].name.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    "*  " + cartmodel[i].quantity.toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    " = " +
                                        (int.parse(cartmodel[i].price) *
                                                cartmodel[i].quantity)
                                            .toString(),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ],
                              ),
                            SizedBox(height: 10),
                            Text(
                              " -----------------------------------------",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            SizedBox(height: 6),
                            Container(
                                child: Column(
                              children: [
                                Text(" الاجمالي  " + total.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      shipping_cost.toString()+"=",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "التوصيل",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),

                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(" الاجمالي النهائي = " + (total+shipping_cost).toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    )),
                                SizedBox(height: 50),

                                Container(
                                   color: Colors.white24,
                                    height:100,
                                    width:330,
                                    child:Center(
                                      child: Directionality(
                                        textDirection:TextDirection.rtl,
                                        child: TextFormField(
                                          maxLines:4,
                                          decoration: InputDecoration(
                                            hintStyle: TextStyle(fontSize: 16,color:Colors.grey),
                                            hintText: 'اضافة ملاحظة ',
                                            //suffixIcon: Icon(Icons.search),
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(22),
                                          ),
                                          controller:_notesController,
                                        ),
                                      ),
                                    )
                                ),


                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //SizedBox(width:120),
                                    GetBuilder<CartViewModel>(
                                        init: Get.find(),
                                        builder: (controller) => Container()),
                                    Center(
                                      child: Column(
                                        children: [
                                          RaisedButton(
                                            shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(30.0),
    ),
                                            color: HexColor("#ff68682A"),
                                            onPressed: () {
                                              for (int i = 0; i < i2; i++)
                                                controller.DeleteProducts2(
                                                    CartProductModel(
                                                        name: cartmodel[i].name,
                                                        image: cartmodel[i].image,
                                                        price: cartmodel[i]
                                                            .price
                                                            .toString(),
                                                        quantity:
                                                            cartmodel[i].quantity,
                                                        productId:
                                                            cartmodel[i].productId),
                                                    cartmodel[i].productId);


                                              controller.checkout(
                                                country,
                                                  city,
                                                  address,
                                                  apartment,
                                                  floor,
                                                  mobile,
                                                  total+shipping_cost,
                                                  cartmodel,
                                                  total+shipping_cost,
                                                   brand_email,
                                              _notesController.text.toString()
                                              );
                                              print("doooo");
                                              opacity=1.0;

                                            },
                                            child: Center(
                                              child: Text(
                                                "تاكيد الطلب ",
                                                style: TextStyle(
                                                    color: Colors.white, fontSize: 22),
                                              ),
                                            ),
                                          ),
                                        //     Opacity(
                                        //       opacity:opacity,
                                        //       child: GetBuilder<CartViewModel>(
                                        //       init: CartViewModel(),
                                        // builder: (controller) =>
                                        //         RaisedButton(
                                        //           shape: new RoundedRectangleBorder(
                                        //             borderRadius: new BorderRadius.circular(30.0),
                                        //           ),
                                        //           color: Colors.red,
                                        //           onPressed: () {
                                        //             for (int i = 0; i < i2; i++)
                                        //               controller.DeleteProducts(
                                        //                   CartProductModel(
                                        //                       name: cartmodel[i].name,
                                        //                       image: cartmodel[i].image,
                                        //                       price: cartmodel[i]
                                        //                           .price
                                        //                           .toString(),
                                        //                       quantity:
                                        //                       cartmodel[i].quantity,
                                        //                       productId:
                                        //                       cartmodel[i].productId),
                                        //                   cartmodel[i].productId);
                                        //
                                        //             Get.offAll(OrderStatus(
                                        //               order_id:'kkk',
                                        //               cartmodel: cartmodel,
                                        //             ));
                                        //
                                        //           },
                                        //           child: Center(
                                        //             child: Text(
                                        //              "تم",
                                        //               style: TextStyle(
                                        //                   color: Colors.white, fontSize: 16),
                                        //             ),
                                        //           ),
                                        //         )
                                        //
                                        //   ),
                                        //     ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ))),
                  ],
                ),
              ))),
    );
  }
}
