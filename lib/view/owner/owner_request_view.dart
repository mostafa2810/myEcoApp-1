


import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/owner/owner_home_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:ecommerce/viewmodel/owner_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OwnerRequestView extends GetWidget<AuthViewModel> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    height:120,
                    width:300,
                    child:Image.asset('assets/lb.jfif',fit:BoxFit.fitHeight,)
                ),
                SizedBox(
                  height:30
                ),
                CustomTextFormField(
                   // controller: controller.email,
                    text: "E_mail",
                    hint: "dev@yahoo.com",
                    onSave: (value) {
                      //   controller.email = value;
                      controller.email=value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("error");
                      }
                    }),
                SizedBox(height: 20),
                CustomTextFormField(
                   // controller: controller.pass1,
                    text: "Password",
                    hint: "************",
                    onSave: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        print("error");
                      }
                    }),
                SizedBox(
                  height:11
                ),
                CustomTextFormField(
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
                      if(value!="123456"){
                        print("error");
                      }
                    }),
                SizedBox(height: 8),
                InkWell(
                  child: Custom_Text(
                    text: "Forget Password",
                    fontSize: 14,
                    alignment: Alignment.topRight,
                  ),
                  onTap:(){
                    Get.to(ForgetPasswordView());
                  },
                ),
                SizedBox(height: 20),
                    SizedBox(
                      height:20
                    ),
                InkWell(
                  child:Container(
                    width:190,
                    child: Card(
                      color:Colors.lightGreen,
                      child: Center(
                        child: Text("دخول ",style:TextStyle(color:Colors.white,
                          fontSize:19,

                        ),),
                      ),
                    ),
                  ),
                  onTap:(){
                    _formKey.currentState.save();
                    if (_formKey.currentState.validate()){
                      controller.brandsignInWithEmailAndPassword();

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
                          color:Colors.lightGreen,
                          child: Center(
                            child: Text("طلب اضافة متجرك ",style:TextStyle(color:Colors.white,
                            fontSize:19,

                            ),),
                          ),
                        ),
                      ),
                      onTap:(){},
                    ),

              ],

            ),
          ),
        )
      ),
    );
  }



}