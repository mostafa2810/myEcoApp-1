

 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/check/address_check.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'checkout_screen2.dart';



 class AdressScreen extends StatelessWidget {
  //List<>String name;
  num total;
  List<CartProductModel> cartmodel;
  double lat,long;
  //String address;
  AdressScreen({this.total,this.cartmodel,this.lat,this.long});
 // const CheckOutScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController address3= TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final box = GetStorage();
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [

            Text(" Luban   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
              fontWeight:FontWeight.w700
            ),),
            SizedBox(
              width: 100,
            ),
            Text("   لبان ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
                fontWeight:FontWeight.w700

            ),),
          ],
        ),
      ),
      body: GetBuilder<AddressViewModel>(
        init:AddressViewModel(),
        builder:(controller)=>
        Container(
          child:  Form(
            key: _formKey,
            child: Column(
              children:[
                SizedBox(
                  height:30
                ),
              Column(
                children: [
                  Container(
                    padding:EdgeInsets.only(left:30),
                    width:330,
                    child: CustomTextFormField(
                      controller:controller.address,
                      hint: 'العنوان ',
                      text: '',
                      color:Colors.black,
                      onSave: (value) {
                      controller.address.text= value;
                      print("ttt ="+controller.address.toString());
                      },
                        validator: (value) {
                          if (value == null || value=='' ) {
                            return ("Enter address ");
                          }
                        }
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.only(left:30),
                    width:330,
                    child: CustomTextFormField(
                      controller:controller.apartment,
                      hint: 'المبني ',
                      text:'',
                      color:Colors.black,
                      onSave: (value) {
                          controller.apartment .text= value;
                      },
                        validator: (value) {
                          if (value == null|| value=='' ){
                            return ("Enter apartment ");
                          }
                        }
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.only(left:30),
                    width:330,
                    child: CustomTextFormField(
                      controller: controller.floor,
                      hint: 'الطابق ',
                      text: '',
                      color:Colors.black,
                      onSave: (value) {
                        print("lll= "+value);
                          controller.floor.text= value;
                      },
                        validator: (value) {
                          if (value == null|| value=='') {
                            return ("Enter floor ");
                          }
                        }
                    ),
                  ),

                    Container(
                      padding:EdgeInsets.only(left:30),
                      width:330,
                      child: CustomTextFormField(
                        controller:controller.mobile,
                        hint: 'رقم الجوال',
                        text:'',
                        color:Colors.black,
                        onSave: (value) {
                            controller.mobile.text= value;
                        },
                          validator: (value) {
                            if (value == null || value==''|| value.length<9|| value.length>12) {
                              return ("Enter correct mobile number ");
                            }
                          }
                      ),
                    ),
                ],
              ),
                SizedBox(
                  height:20
                ),
                Container(
                      child: RaisedButton(
                         color: Colors.lightGreen,
                        onPressed: () {
                           //print(cartmodel[3].name);
                         _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            print("add2222");
                            print("cont" + controller.address.toString());
                            controller.addAddress();
                            print("add1111");
                            box.write('Adress_details1',
                              controller.address.text.toString(),);

                            box.write('Adress_details2', controller.apartment.text.toString(),);
                            box.write('Adress_details3', controller.floor.text.toString(),);
                            box.write('Adress_details4', controller.mobile.text.toString(),);
                            box.write('Lat', lat,);
                            box.write('Long',long);

                            // Get.to(AddressCheck());
                            Get.to( CheckOutScreen2(
                              controller.address.text.toString(),
                              controller.apartment.text.toString(),
                              controller.floor.text.toString(),
                              controller.mobile.text.toString(),
                              total,
                             cartmodel
                            ));
                          }

                          else{
                            Get.snackbar('حدث خطا', 'ادخلت بيانات بطريقة خاطئة');
                          }
                        },
                        child:Text("تاكيد الطلب",style:TextStyle(
                            color:Colors.white,
                            fontSize:22),),
                      ),
                    )
              ]
            ),
          )
        ),
      )
    );
  }
}
