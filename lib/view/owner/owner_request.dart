









import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/owner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class  OwnerRequest extends GetWidget<AuthViewModel> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key:_formKey,
              child: ListView(

                children: [

                  SizedBox(
                      height:70
                  ),
                  Container(
                      height:120,
                      width:200,
                      color: Colors.white,
                      child:Image.asset('assets/wh3.jpeg',fit:BoxFit.fill,)
                  ),
                  SizedBox(
                      height:30
                  ),
                  CustomTextFormField(
                    // controller: controller.email,
                      text: "                                                        ادخل ايميل للتواصل   ",
                      hint: "dev@yahoo.com",
                      onSave: (value) {

                        controller.email=value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                      }),
                  SizedBox(height: 20),
                  CustomTextFormField(
                    // controller: controller.pass1,
                      text: "                                                     ادخل رقم هاتف للتواصل ",
                      hint: "+968..........",
                      onSave: (value) {
                        controller.mobile = value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                      }),
                  SizedBox(
                      height:11
                  ),
                  CustomTextFormField(
                      text: "                                                 نوع المنتجات التي تقوم ببيعها  ",
                      //controller: controller.code1,
                      hint: "مثال : ملابس ",
                      onSave: (value) {
                        controller.cat= value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                        // if(value!="123456"){
                        //   print("error");
                        // }
                      }),
                  SizedBox(height: 8),
                  CustomTextFormField(
                      text: "                                                                   اسم متجرك ",
                      //controller: controller.code1,
                      hint: "  ",
                      onSave: (value) {
                        controller.brand_name= value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                      }),

                  SizedBox(height: 6),
                  CustomTextFormField(
                      text: "                                                                             الدولة  ",
                      //controller: controller.code1,
                      hint: "  ",
                      onSave: (value) {
                        controller.country= value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                      }),

                  SizedBox(height: 6),
                  CustomTextFormField(
                      text: "                                                                            الولاية    ",
                      //controller: controller.code1,
                      hint: "  ",
                      onSave: (value) {
                        controller.city= value;
                      },
                      validator: (value) {
                        if (value == null || value =="") {
                          print("error");
                        }
                      }),

                  SizedBox(height: 6),
                  CustomTextFormField(
                      text: " لماذا تريد التسجيل كتاجر و ماذا يمكن ان يضيف متجرك داخل التطبيق  ",
                      //controller: controller.code1,
                      hint: "  ",
                      onSave: (value) {
                        controller.details= value;
                      },
                      validator: (value) {
                        if (value == null || value =="" ) {
                          print("error");
                        }
                      }),
                  SizedBox(
                      height:20
                  ),
                  InkWell(
                    child:Container(
                      width:190,
                      child: Card(
                        color: HexColor("#ff68682A"),
                        child: Center(
                          child: Text(" ارسال طلب  ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                          ),),
                        ),
                      ),
                    ),
                    onTap:(){
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        controller.ownerSendRequest();
                      }
                    },
                  ),
                  SizedBox(
                      height:20
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }



}