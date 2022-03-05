import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsView2 extends StatelessWidget {

  String name;
  num price;
  String details;
  String image;
  String productId;
  String brand;
  String x;
  String brandemail;

  DetailsView2(
      {this.name, this.image, this.price, this.details,
        this.productId,this.brand,
        this.x,
        this.brandemail
      });


  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        SizedBox(
          height: 30,
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Image.network(image, fit: BoxFit.fill)),
        SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Custom_Text(
                    text: name.toString(),
                    fontSize: 26,
                    color: HexColor("#ff68682A"),
                  ),
                  SizedBox(height: 15),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      x,
                      style:TextStyle(color:Colors.red,fontSize:16,fontWeight:FontWeight.w700)
                  ),
                  Custom_Text(
                      text:'تفاصيل',
                      fontSize:18,
                    color: HexColor("#ff68682A"),
                  ),
                  SizedBox(
                    height:20,
                  ),
                  Text(
                      details,
                      style:TextStyle(color:Colors.black,fontSize:16)
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Custom_Text(
                    text: "السعر",
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                  Custom_Text(
                    text: ' ' + price.toString(),
                    color: HexColor("#ff68682A"),
                    fontSize: 18,
                  ),
                ],
              ),
              SizedBox(width: 55),
              GetBuilder<CartViewModel>(
                init: CartViewModel(),
                builder: (controller) => Container(
                    width: 120,
                    height: 60,
                    child: CustomButton(
                        text: 'اضف',
                        onPressed: () {
                          index=index+1;
                          print("ttt");
                          print(name);
                          print(price);



                          final box = GetStorage();
                          final box_brand=box.read('brand')??'x';


                          if(brand==box_brand || box_brand =='x'){
                            controller.addProduct2(
                                CartProductModel(
                                    name: name,
                                    image: image,
                                    price: price.toString(),
                                    quantity: 1,
                                    productId: productId,
                                    brand:brand,
                                    brand_email:brandemail
                                ),
                                productId,

                              // model.productId
                              //productId:model.productId)
                            );
                            box.write('brand',brand);
                            box.write('brand_email',brandemail);
                          }
                          else{
                            controller.dialogAndDelete(
                              CartProductModel(
                                name: name,
                                image: image,
                                price: price.toString(),
                                quantity: 1,
                                productId: productId,
                                brand:brand,
                                brand_email:brandemail
                            ),
                          productId,
                            );
                            box.write('brand_email',brandemail);
                          }



                          //  controller.addProduct2(
                          //      CartProductModel
                          //        (name:name,image:image,
                          //        price:price.toString(),quantity: 1,
                          //      //  productId:productId,
                          //      ),
                          //    //  model.productId
                          //    //productId:model.productId)
                          //  );
                          //  controller.addProduct
                          //    (model.name,model.image,model.price,controller.quant2,model.productId);
                        })),
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
