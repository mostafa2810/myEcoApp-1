import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/map/map_view.dart';
import 'package:ecommerce/map/map_view2.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_check.dart';
import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../viewmodel/cart_viewmodel.dart';
import '../check/address_view.dart';

class CartView2 extends StatelessWidget {
  int id;
  //String brand_email;
  CartView2({this.id});

  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    bool x=false;
    final box1=box.read('Adress_details1')??'';
    final box_Lat=box.read('Lat')??37.42796133580664;
    final box_Long=box.read('Long')??122.085749655962;
    final box_address=box.read('Adress_details1')??'x';
    final box_address2=box.read('Adress_details2')??"hh";
    final box_address3=box.read('Adress_details3')??"ogi";
    final box_address4=box.read('Adress_details4')??"yyy";
    final brand_email=box.read('brand_email')??"///";




    return GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => (Scaffold(
              body: controller.cartProductModel.length == 0 || id == 3
                  ? Container(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: SvgPicture.asset(
                          'assets/sss1.svg',
                          height: 200,
                        )),
                        Center(child: Text("Cart Empty ")),
                      ],
                    ))
                  : Column(children: [
                      Expanded(
                        child: Container(
                            child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              height: 140,
                              child: Row(children: [
                                Container(
                                    width: 140,
                                    child: Image.network(
                                        controller.cartProductModel[index].image
                                            .toString(),
                                        fit: BoxFit.fill)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Custom_Text(
                                            text: controller
                                                .cartProductModel[index].name
                                                .toString(),
                                            fontSize: 24),
                                        SizedBox(height: 14),
                                        Custom_Text(
                                            color: HexColor("#ff68682A"),
                                            text: controller
                                                .cartProductModel[index].price
                                                .toString()),
                                        SizedBox(height: 20),
                                        Container(
                                            width: 170,
                                            color: Colors.grey.shade200,
                                            height: 40,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                    child: Icon(Icons.add,
                                                        color: Colors.black),
                                                    onTap: () {
                                                      controller
                                                          .increaseQuantity(
                                                              index);
                                                    },
                                                  ),
                                                  SizedBox(width: 20),
                                                  Custom_Text(
                                                      alignment:
                                                          Alignment.center,
                                                      text: controller
                                                          .cartProductModel[
                                                              index]
                                                          .quantity
                                                          .toString(),
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                  SizedBox(width: 20),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        bottom: 20),
                                                    child: InkWell(
                                                      child: Icon(
                                                          Icons.minimize,
                                                          color: Colors.black),
                                                      onTap: () {
                                                        controller
                                                            .decreaseQuantity(
                                                                index);
                                                      },
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:20
                                                  ),
                                                  InkWell(
                                                    child: Icon(Icons.delete,
                                                        color: Colors.black),
                                                    onTap: () {
                                                      controller.DeleteProducts(
                                                          CartProductModel(
                                                              name: controller
                                                                  .cartProductModel[index].name,
                                                              image: controller
                                                                  .cartProductModel[index].image,
                                                              price: controller
                                                                  .cartProductModel[index].price,
                                                              quantity:
                                                              controller
                                                                  .cartProductModel[index].quantity,
                                                              productId:
                                                              controller
                                                                  .cartProductModel[index].productId),
                                                          controller
                                                              .cartProductModel[index].productId);
                                                    },
                                                  ),
                                                ]))
                                      ]),
                                )
                              ]),
                            );
                          },
                          itemCount: controller.cartProductModel.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10);
                          },
                        )),
                      ),
                      //  ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Custom_Text(
                                      text: "الاجمالي",
                                      fontSize: 22,
                                      color: Colors.grey),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => Custom_Text(
                                      text: controller.totalPrice.toString(),
                                      color: HexColor("#ff68682A"),
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  child: GetBuilder<CartViewModel>(
                                    init: Get.find(),
                                    builder: (controller) => (CustomButton(
                                        onPressed: () {

                                          print("lll="+box_address);

                                          if(box_address=='x'){
                                            Get.to(MapView2(
                                              total:controller.totalPrice,
                                              cartmodel:controller.cartProductModel,
                                            ));
                                          }
                                          if(box_address!='x')
                                          {
                                            Get.off(AddressCheck(
                                              total: controller.totalPrice,
                                              cartmodel:controller.cartProductModel,
                                              adress:box_address,
                                              building:box_address2,
                                              floor:box_address3,
                                              phone:box_address4,
                                              lat:box_Lat,
                                              long:box_Long,
                                             brand_email:brand_email
                                            ));
                                          }




                                           // Get.offAll(
                                           //     AddressCheck(
                                           //   total: controller.totalPrice,
                                           //       cartmodel:
                                           //           controller.cartProductModel)
                                           // );
                                          // Get.to(AdressScreen(
                                          //     total: controller.totalPrice,
                                          //     cartmodel:
                                          //         controller.cartProductModel)
                                          //         );
                                          //
                                          //   Get.to(StatusChange());
                                          // Get.to(CheckOutView());
                                        },
                                        text: "تاكيد الطلب")),
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ]),
            )));

    //  );
  }

}
