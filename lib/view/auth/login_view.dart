import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/owner/owner_request_view.dart';
import 'package:ecommerce/view/widgets/custom_button_social.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_phone.dart';
import 'second_Screen.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class LoginView extends GetWidget<AuthViewModel> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
          child: Column(
            children: [
              Container(
                height:120,
                width:300,
                child:Image.asset('assets/lb.jfif',fit:BoxFit.fitHeight,)
              ),
              SizedBox(
                height:10
              ),
              Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(
                          text: "Welcome",
                          fontSize: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                       //     Get.to(AuthView());
                          Get.to(RegisterView());
                          },
                          child: Custom_Text(
                            text: "Sign Up",
                            fontSize: 18,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 7),
                    Custom_Text(
                      text: "Sign in to Continue",
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
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
                    CustomButton(
                      onPressed: () {
                        _formKey.currentState.save();
                        if (_formKey.currentState.validate()) {

                          //controller.signInWithPhoneAndPassword();
                          controller.signInWithEmailAndPassword();
                        }
                      },
                      text: "تسجيل دخول",
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      onPressed: () {
                       Get.to( OwnerRequestView());
                      },
                      text: "تسجيل دخول كصاحب متجر",
                    ),
                    // Custom_Text(
                    //   text: '_OR_',
                    //   alignment: Alignment.center,
                    // ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // CustomButtonSocial(
                    //   text: 'Sign In With Facebook',
                    //   imageName: 'assets/f1.png',
                    // ),
                    // CustomButtonSocial(
                    //   text: 'Sign In With Google',
                    //   imageName: 'assets/g1.png',
                    //   onPressed: () {
                    //   //  controller.sginInWithGoogle();
                    //      controller.googleSignInMehtod();
                    //   },
                    // ),
                  ])),
            ],
          ),
        ));
  }
}
