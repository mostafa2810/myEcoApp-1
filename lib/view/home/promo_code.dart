import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/adsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';

class PromoCode extends StatefulWidget {
  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  TextEditingController promo = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController ser_name = TextEditingController();

  final _nativeAd = NativeAdmobController();
  AdmobBannerSize bannerSize;
  AdmobInterstitial intersitialAd;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   intersitialAd = AdmobInterstitial(
  //       adUnitId: AdsManger.interstitialAd,
  //       listener: (AdmobAdEvent event, Map<String, dynamic> args) {
  //         if (event == AdmobAdEvent.closed) intersitialAd.load();
  //       });
  //   intersitialAd.load();
  //   intersitialAd.show();
  //   _nativeAd.reloadAd(forceRefresh: true);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
                child: Column(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(height: 13),
                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Container(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "ادخل الكود الخاص ب prmga club واحضل علي خصم  ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                 // color: Colors.red,
                  child: Image.asset('assets/pr1.png'),
                ),
                SizedBox(height: 7),

                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: 400,
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: "ادخل اسمك ",
                          hintStyle: TextStyle(fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "ادخل اسمك";
                        }
                      },
                      onSaved: (value) {
                        print(value);
                        name.text = value;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Directionality(
                  textDirection: TextDirection.rtl,
                child:Container(
                  width: 400,
                  child: TextFormField(
                    controller: ser_name,
                    decoration: InputDecoration(
                        hintText: "ادخل  اسم الخدمة ",
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "ادخل اسمك";
                      }
                    },
                    onSaved: (value) {
                      print(value);
                      ser_name.text = value;
                    },
                  ),
                )),
                SizedBox(height:3),
                Directionality(
                  textDirection: TextDirection.rtl,
               child: Container(
                  width: 400,
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: "ادخل البرومو كود ",
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "ادخل البرومو كود  ";
                      }
                    },
                    onSaved: (value) {
                      print(value);
                      promo.text = value;
                    },
                  ),
                )),
                SizedBox(height: 3),
             //    Directionality(
             //      textDirection: TextDirection.rtl,
             // child:   Container(
             //      width: 400,
             //      child: TextFormField(
             //        controller: promo,
             //        decoration: InputDecoration(
             //            hintText: "ادخل باسورد عشوائئ  ",
             //            hintStyle: TextStyle(fontSize: 15),
             //            border: OutlineInputBorder(
             //                borderRadius: BorderRadius.circular(10))),
             //        validator: (value) {
             //          if (value.isEmpty) {
             //            return "ادخل باسورد عشوائئ  ";
             //          }
             //        },
             //        onSaved: (value) {
             //          print(value);
             //          password.text = value;
             //        },
             //      ),
             // ) ),
                SizedBox(height: 3),
                RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "تفعيل البرومو ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        print("add2222");
                        print("add1111");
                        if(promo.text=='prmgaclubx2022'|| promo.text=='noob2022'||promo.text=='codex2022'||promo.text=='codingx2022'||promo.text=='youtube2022'){
                          sendService();
                        }else{
                          print("xxx");
                          Get.snackbar(
                            '!!!! ',
                            'البرومو كود غير صحيح ',
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        }
                      }
                    }),
                SizedBox(height: 3),
                RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "   الخدمات   ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                  //    Get.to(AllServicesVies());
                    }),
                // Container(
                //     width: 310,
                //     height: 60,
                //     child: NativeAdmob(
                //       adUnitID: AdsManger.nativeAdunit,
                //       numberAds: 3,
                //       controller: _nativeAd,
                //       type: NativeAdmobType.banner,
                //     )),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void sendService() async {
    print("add6666");
    await Firestore.instance.collection('promo_code').document().setData({
      'name': name.text.toString(),
      'service_name': ser_name.text.toString(),
      'password': password.text.toString(),
      'promo_code': promo.text.toString(),
    });
    name.text = "";
    ser_name.text = "";
    promo.text = "";

    Get.snackbar(
      'done ',
      'تم ارسال طلبك بنجاح ',
      backgroundColor: Colors.lightBlue,
      colorText: Colors.white,
    );

    //   Get.to(HomeView());
    print("add999");
  }
}
