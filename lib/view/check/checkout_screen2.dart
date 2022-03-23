import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/order_status.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart'as intl;


class CheckOutScreen2 extends StatefulWidget {
  String country,city;
  String address;
  String apartment;
  String floor;
  String mobile;
  num total;
  List<CartProductModel> cartmodel;
  String brand_email;
  double lat,long;
  CheckOutScreen2(
      this.country,
    this.city,
    this.address,
    this.apartment,
    this.floor,
    this.mobile,
    this.total,
    this.cartmodel,
    this.brand_email,
     // this.brand_name,
      this.lat,this.long
  );

  @override
  State<CheckOutScreen2> createState() => _CheckOutScreen2State();
}

class _CheckOutScreen2State extends State<CheckOutScreen2> {
  @override
  Widget build(BuildContext context) {
    int i2 = widget.cartmodel.length;
    double opacity=0.0;
    num shipping_cost=22;
    TextEditingController _notesController = TextEditingController();
    final box = GetStorage();
    final box_brand=box.read('brand')??'x';
    DateTime now = DateTime.now();

    String time =intl. DateFormat('kk:mm:ss \n EEE d MMM').format(now);
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

                    Colors.white,
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
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListView(
                    children: [
                      Container(
                          width: 300,
                          height: 1000,
                          child: Card(
                           color: Colors.grey[200],
                              child: SingleChildScrollView(
                                child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 3),
                              Container(
                                color:Colors.white,
                                height:120,
                                width:600,
                                child:Image.asset('assets/wh3.jpeg'),
                              ),
                                Card(
                                  color:Colors.white ,
                                  child: Column(
                                    children: [
                                      SizedBox(height:5,),
                                      Center(
                                          child: Text(
                                            "طلبك ",
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 19,fontWeight:FontWeight.w700),
                                          )),
                                      SizedBox(height:5,),
                                      Row(
                                        children: [
                                          SizedBox(width:8,),
                                          Text(" المتجر :",style:TextStyle(color:Colors.black,fontSize: 16),),
                                          Text(
                                             box_brand??"",
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 16,fontWeight:FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height:5,),
                                      Row(
                                        children: [
                                          SizedBox(width:11,),
                                          Text(
                                            time,
                                            style:
                                            TextStyle(color: Colors.black, fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height:10),
                                      for (int i = 0; i < i2; i++)
                                        Row(
                                          children: [
                                            Text(
                                              "   " + widget.cartmodel[i].name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 18),
                                            ),
                                            SizedBox(width: 7),
                                            Text(
                                              "x " + widget.cartmodel[i].quantity.toString(),//" x ",
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16),
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              " = " +
                                                  (int.parse(widget.cartmodel[i].price) *
                                                      widget.cartmodel[i].quantity)
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.black, fontSize: 16),
                                            ),

                                          ],
                                        ),
                                      SizedBox(
                                        height:15
                                      ),
                                    ],
                                  ),
                                ),

                                Card(
                                  color: Colors.white,
                                  child:Column(
                                    children: [
                                      Text("تفاصيل العنوان ",style:TextStyle(color:Colors.black,fontSize:18),),

                                      SizedBox(
                                          height:6
                                      ),

                                      Row(
                                        children: [
                                       //   SizedBox(width:222,),
                                          Text(" الدولة  : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                          Text(
                                              widget.country ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors.black)),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(" المدينة : ",style:TextStyle(color:Colors.black,fontSize:19),),

                                          Text(
                                              widget.city ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors.black)),

                                        ],
                                      ),


                                      Row(
                                        children: [
                                          Container(
                                            height:40,
                                            child: Text("عنوان الشارع :  ",
                                              style:TextStyle(color:Colors.black,fontSize:19),),
                                          ),

                                          Container(
                                            height:40,
                                            child: Text(
                                                widget.address ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.black)),
                                          ),

                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("  الشقة : ",style:TextStyle(color:Colors.black,fontSize:19),),

                                          Text(
                                              widget.apartment ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  color: Colors.black)),

                                        ],
                                      ),

                                      Center(
                                        child: Row(
                                          children: [
                                            Text(" الطابق : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                            Text(
                                                widget.floor??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.black)),

                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(" الهاتف : ",style:TextStyle(color:Colors.black,fontSize:19),),
                                         // Directionality(
                                          //  textDirection:TextDirection.rtl,
                                         //   child:
                                            Text(
                                                widget.mobile.replaceAll('+', '')+"+" ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight:
                                                    FontWeight.w400,
                                                    color: Colors.black)),
                                         // ),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),

                                SizedBox(height: 1),

                                Container(
                                    child: Column(

                                  children: [

                                    SizedBox(width:20),
                                    Container(
                                      height:130,
                                      child: Card(
                                        color: Colors.white,
                                        child: Row(
                                          children: [

                                            SizedBox(width:50),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),

                                                Text(" الاجمالي  ", //+ total.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    )),
                                                Text( widget.total.toString(),
                                                    style: TextStyle(
                                                      color: Colors.black ,
                                                      fontSize: 18,
                                                    )),
                                              ],

                                            ),
                                            SizedBox(width:20),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),
                                                Text(
                                                  "التوصيل",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  shipping_cost.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width:20),
                                            Column(
                                              children: [
                                                SizedBox(
                                                    height:17
                                                ),
                                                Text(" الاجمالي النهائي  ", //+ (total+shipping_cost).toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    )),
                                                Text( (widget.total+shipping_cost).toString(),
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                    )),
                                              ],

                                            ),

                                          ],
                                        ),
                                      ),
                                    ),

                                    SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [



                                      ],
                                    ),
                                    SizedBox(height: 10),

                                 //   SizedBox(height: 50),

                                    Container(
                                        color: Colors.white,
                                        height:100,
                                        width:370,
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
                                              controller:_notesController,style:TextStyle(color:Colors.black),
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
                                                            name: widget.cartmodel[i].name,
                                                            image: widget.cartmodel[i].image,
                                                            price: widget.cartmodel[i]
                                                                .price
                                                                .toString(),
                                                            quantity:
                                                                widget.cartmodel[i].quantity,
                                                            productId:
                                                                widget.cartmodel[i].productId),
                                                        widget.cartmodel[i].productId);




                                                  controller.checkout(
                                                    widget.country,
                                                      widget.city,
                                                      widget.address,
                                                      widget.apartment,
                                                      widget.floor,
                                                      widget.mobile,
                                                      widget.total+shipping_cost,
                                                      widget.cartmodel,
                                                      widget.total+shipping_cost,
                                                       widget.brand_email,
                                                      box_brand,
                                                  _notesController.text.toString(),
                                                    widget.lat,widget.long
                                                  );
                                                  print("doooo");

                                                  box.remove('cart');

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
                          ),
                              ))),
                    ],
                  ),
                ),
              ))),
    );
  }
}
