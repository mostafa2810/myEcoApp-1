import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailsView2 extends StatefulWidget {

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

  @override
  State<DetailsView2> createState() => _DetailsView2State();
}

class _DetailsView2State extends State<DetailsView2> {
  int index=0;

  String lg = '';


  @override
  void initState() {


    final box = GetStorage();
    final box_country=box.read('country')??'x';

    if(box_country=='امارات'){
      lg ='د.ا';
    }
    if(box_country=='البحرين'){
      lg='د.ب';
    }
    if(box_country=='قطر'){
      lg='ر.ق';
    }
    if(box_country=='سلطنة عمان'){
      lg='ر.ع';
    }

    if(box_country=='كويت'){
      lg='د.ك';
    }
    if(box_country=='السعودية'){

      lg='ر.س' ;
    }
    if(box_country=='x'){
      lg='ر.س' ;
    }
    super.initState();
  }


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
            child: Image.network(widget.image, fit: BoxFit.fill)),
        SizedBox(height: 15),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(17),
              child: Column(
                children: [
                  Custom_Text(
                    text: widget.name.toString(),
                    fontSize: 26,
                    color: HexColor("#ff68682A"),
                  ),
                  SizedBox(height: 15),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      widget.x,
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
                      widget.details,
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
                  Row(
                    children: [

                      SizedBox(
                          width:5
                      ),
                      Custom_Text(
                        text:lg,
                        color: HexColor("#ff68682A"),
                        fontSize:18,

                      ),
                      SizedBox(
                          width:5
                      ),
                      Custom_Text(
                        text:'  '+widget.price.toString(),
                        color: HexColor("#ff68682A"),
                        fontSize:18,

                      ),
                    ],
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
                          print(widget.name);
                          print(widget.price);



                          final box = GetStorage();
                          final box_brand=box.read('brand')??'x';


                          if(widget.brand==box_brand || box_brand =='x'){
                            controller.addProduct2(
                                CartProductModel(
                                    name: widget.name,
                                    image: widget.image,
                                    price: widget.price.toString(),
                                    quantity: 1,
                                    productId: widget.productId,
                                    brand:widget.brand,
                                    brand_email:widget.brandemail
                                ),
                                widget.productId,

                              // model.productId
                              //productId:model.productId)
                            );
                            box.write('brand',widget.brand);
                            box.write('brand_email',widget.brandemail);
                          }
                          else{
                            controller.dialogAndDelete(
                              CartProductModel(
                                name: widget.name,
                                image: widget.image,
                                price: widget.price.toString(),
                                quantity: 1,
                                productId: widget.productId,
                                brand:widget.brand,
                                brand_email:widget.brandemail
                            ),
                          widget.productId,
                            );
                            box.write('brand_email',widget.brandemail);
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
