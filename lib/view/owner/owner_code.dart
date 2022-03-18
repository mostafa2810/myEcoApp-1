






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

import 'owner_request.dart';

  class  OwnerCodeView extends GetWidget<AuthViewModel> {

  String email ,pass,code;

  OwnerCodeView({this.email,this.pass,this.code});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Container(
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key:_formKey,
              child: Column(

                children: [
                  SizedBox(
                      height:70
                  ),
                  Container(
                      height:220,
                      width:120,
                      color:Colors.white,
                      child:Image.asset('assets/wh3.jpeg',fit:BoxFit.cover,)
                  ),
                  SizedBox(
                      height:30
                  ),
                  // CustomTextFormField(
                  //   // controller: controller.email,
                  //     text: "E_mail",
                  //     hint: "dev@yahoo.com",
                  //     onSave: (value) {
                  //       //   controller.email = value;
                  //       controller.email=value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  // SizedBox(height: 20),
                  // CustomTextFormField(
                  //   // controller: controller.pass1,
                  //     text: "Password",
                  //     hint: "************",
                  //     onSave: (value) {
                  //       controller.password = value;
                  //     },
                  //     validator: (value) {
                  //       if (value == null) {
                  //         print("error");
                  //       }
                  //     }),
                  SizedBox(
                      height:11
                  ),
                  CustomTextFormField(
                    obs: true,
                      text: "Code",
                      //controller: controller.code1,
                      hint: "************",
                      onSave: (value) {
                        controller.code= value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("error");
                        }
                        // if(value!="123456"){
                        //   print("error");
                        // }
                      }),
                  SizedBox(height: 8),

                  SizedBox(height: 20),
                  SizedBox(
                      height:20
                  ),
                  InkWell(
                    child:Container(
                      width:190,
                      child: Card(
                        color: HexColor("#ff68682A"),
                        child: Center(
                          child: Text("دخول ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                          ),),
                        ),
                      ),
                    ),
                    onTap:(){
                      _formKey.currentState.save();
                      final box = GetStorage();
                      if(controller.code=='123456'){
                        if (_formKey.currentState.validate()){

                          Get.off(OwnerHomeView(
                            email:email,
                            pass: pass,
                            code:controller.code
                          ));
                          final box1=box.write('code', controller.code);
                          //controller.signInWithEmailAndPassword();
                        }
                      }
                      else{
                        Get.snackbar('خطا', 'ادخلت كود خاطئ',
                        );
                      }


                      //Get.to(OwnerHomeView());
                    },
                  ),
                  SizedBox(
                      height:20
                  ),
                  InkWell(
                    child:Container(
                      width:190,
                      child: Card(
                        color: HexColor("#ff68682A"),
                        child: Center(
                          child: Text("طلب اضافة متجرك ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                          ),),
                        ),
                      ),
                    ),
                    onTap:(){
                    Get.to(  OwnerRequest());
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }



}