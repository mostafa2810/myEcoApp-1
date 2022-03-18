import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/view/auth/forget_password.dart';
import 'package:ecommerce/view/auth/register_view.dart';
import 'package:ecommerce/view/widgets/custom_button_social.dart';
import 'package:ecommerce/view/widgets/custom_textformfield.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'auth_phone.dart';
import 'second_Screen.dart';
import 'package:ecommerce/view/widgets/custom_button.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

class LoginView extends GetWidget<AuthViewModel> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.white,
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.white,
        // ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height:120,
                  width:690,
                  color:Colors.white,
                  child:Image.asset('assets/wh3.jpeg',fit:BoxFit.fitHeight,)
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
                              color: HexColor("#ff68682A"),
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
                          obs: false,
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
                          obs: true,
                          hint: "************",
                          onSave: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("error");
                            }
                          }),
                      SizedBox(height: 20),


                      SizedBox(height: 8),
                      InkWell(
                        child: Custom_Text(
                          color: HexColor("#ff68682A"),
                          text: "نسيت كلمة المرور",
                          fontSize: 13,
                          alignment: Alignment.topRight,
                        ),
                        onTap:(){
                          Get.to(ForgetPasswordView());
                        },
                      ),
                      SizedBox(height: 20),

                      Container(
                        width: 230,
                        child: CustomButton(

                          onPressed: () {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              final box = GetStorage();
                              final box1=box.write('email', controller.email);
                              final box2=box.write('pass', controller.password);
                                controller.signInWithEmailAndPassword();

                              // else{
                              //   controller.signInWithEmailAndPassword();
                              // }

                            }
                          },
                          text: "تسجيل دخول",
                        ),
                      ),

                      SizedBox(height: 10),

                    ])),
              ],
            ),
          ),
        ));
  }
}
