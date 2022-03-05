
  import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/model/product_moidel.dart';
import 'package:ecommerce/view/cart/saveOrder.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/sqflite.dart';

import '../../viewmodel/cart_viewmodel.dart';
import '../widgets/custom_text.dart';

class DetailsView extends StatelessWidget {

 ProductModel model;
 DateTime now = DateTime.now();
 DetailsView({this.model});
 int index=0;
  @override
  Widget build(BuildContext context) {


    // Sqflite.devSetDebugModeOn(true);
     WidgetsFlutterBinding.ensureInitialized();
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        builder: (controller)=> Container(
          child:Column(
            children:[
              SizedBox(
                height:30,
              ),
              Container(
                  width:MediaQuery.of(context).size.width,
                  height:180,
                  child: Image.network(model.image,fit:BoxFit.fill)),
              SizedBox(
                  height:15
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding:EdgeInsets.all(17),
                    child: Column(
                      children: [

                        Custom_Text(
                          text:model.name.toString(),
                          fontSize:26,
                        ),

                        SizedBox(
                            height:15
                        ),

                        SizedBox(
                          height:20,
                        ),

                        Custom_Text(
                          text:'  '+model.x.toString(),
                          color:Colors.red,
                          fontSize:18,
                        ),

                        SizedBox(
                          height:20,
                        ),

                        Custom_Text(
                          text:'تفاصيل  ',
                          fontSize:18,
                          color: HexColor("#ff68682A"),
                        ),
                        SizedBox(
                          height:20,
                        ),
                        Text(
                          model.des,
                          style:TextStyle(color:Colors.black,fontSize:16)
                        ),
                        SizedBox(
                          height:20,
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
                          text:"السعر",
                          fontSize:18,
                          color:Colors.grey,
                        ),
                        Custom_Text(
                            text:'  '+model.price.toString(),
                          color: HexColor("#ff68682A"),
                          fontSize:18,

                        ),

                      ],
                    ),
                    SizedBox(
                      width:55
                    ),

                   GetBuilder<CartViewModel>(
                   init:CartViewModel(),
                     builder:(controller)
                     =>
          Container(
            width:130,
            height:80,
            child: CustomButton(
                text:' اضف',

                onPressed:(){

                  print("ttt");
                  print(model.name);
    final box = GetStorage();
    final box_brand=box.read('brand')??'x';

     if(model.brand==box_brand || box_brand =='x'){
                  controller.addProduct2(
                    CartProductModel
                      (name:model.name,image:model.image,
                      price:model.price.toString(),quantity: 1,
                       productId:model.productId,
                       brand:model.brand,
                       brand_email: model.brand_email
                    ),
                        model.productId,
                        //productId:model.productId)
                  );
                  box.write('brand',model.brand);
                  box.write('brand_email',model.brand_email);
     }
     else{
       controller.dialogAndDelete(
         CartProductModel(
             name:model. name,
             image: model.image,
             price:model.price.toString(),
             quantity: 1,
             productId: model.productId,
             brand:model.brand,
             brand_email: model.brand_email
         ),
         model.productId,
       );
       box.write('brand_email',model.brand_email);
     }
                  // controller.addProduct
                  //   (model.name,model.image,model.price,controller.quant2,model.productId);
                }
            )),
                   ),


                  ],
                ),
              ),

            ]
          )
        ),
      )
    );
  }
}
