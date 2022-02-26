import 'package:ecommerce/view/auth/login_view.dart';
import 'package:ecommerce/view/check/allorders_view.dart';
import 'package:ecommerce/view/profile/update_profile.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';

import 'package:ecommerce/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package/ecommerce/view/widgets/Custom_Text';


class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
          body: controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Container(
                              //   width: 120,
                              //   height: 120,
                              //   decoration: BoxDecoration(
                              //       color: Colors.red,
                              //       borderRadius:
                              //           BorderRadius.all(Radius.circular(100)),
                              //       image: DecorationImage(
                              //           image: AssetImage('assets/lb.jfif')
                              //           //NetworkImage(controller.userModel.pic)
                              //           )),
                              // ),
                              Column(children: [
                                Custom_Text(
                                  text: controller.userModel.name,
                                ),
                                SizedBox(height: 10),
                                Custom_Text(
                                  text: controller.userModel.email,
                                ),
                              ])
                            ],
                          )),
                          SizedBox(height: 50),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                Get.to(UpdateProfile());
                              },
                              child: ListTile(
                                  title: Custom_Text(
                                    text: "تغير كلمة المرور",
                                    fontSize: 15,
                                  ),
                                  leading: Image.asset('assets/pe2.png'),
                                  trailing: Icon(Icons.navigate_next)),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                Get.to(AllOrders(
                                user:controller.userModel.email,
                                ));
                              },
                              child: ListTile(
                                  title: Custom_Text(
                                    text: "سجل طلباتك",
                                    fontSize: 15,
                                  ),
                                  leading: Image.asset('assets/ord.png'),
                                  trailing: Icon(Icons.navigate_next)),
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            child: FlatButton(
                              onPressed: () {
                                controller.signOut();
                                Get.offAll(LoginView());
                              },
                              child: ListTile(
                                  title: Custom_Text(
                                    text: "تسجيل خروج",
                                    fontSize: 15,
                                  ),
                                  leading: Image.asset('assets/log3.jpg'),
                                  trailing: Icon(Icons.navigate_next)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )

                  // Center(
                  //   child: FlatButton(
                  //     onPressed: () {
                  //       controller.signOut();
                  //       Get.offAll(LoginView());
                  //     },
                  //     child: Text("Sign Out"),
                  //   ),
                  // ),
                  )),
    );
  }
}
