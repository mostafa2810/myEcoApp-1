
import 'package:admob_flutter/admob_flutter.dart';
import 'package:ecommerce/view/adsManger.dart';
import 'package:ecommerce/view/booking_form.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailsView3 extends StatefulWidget {
  String name;
String city;
  String details;
  String image;
 // String  link;
//  String video;


  DetailsView3(
      {this.name,
        this.image,
        this.city,
        this.details,
        //this.link,
      //  this.video
      });

  @override
  State<DetailsView3> createState() => _DetailsView2State();
}

class _DetailsView2State extends State<DetailsView3> {
  int index = 0;

  String lg = '';


  final _nativeAd=NativeAdmobController();
  AdmobBannerSize bannerSize;
  AdmobInterstitial intersitialAd;

  // @override
  // void initState() {
  //   super.initState();
  //   intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
  //       listener:(AdmobAdEvent event , Map<String, dynamic> args ){
  //         if(event==AdmobAdEvent.closed) intersitialAd.load();
  //       } );
  //   intersitialAd.load();
  //
  //   _nativeAd.reloadAd(forceRefresh:true);
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [

            SizedBox( height: 7,),
            // Container(
            //     width:310,
            //     height:65,
            //     child:NativeAdmob(
            //       adUnitID:AdsManger.nativeAdunit,
            //       numberAds:3,
            //       controller: _nativeAd,
            //       type:NativeAdmobType.banner,
            //     )
            // ),
            SizedBox(
              height: 4,
            ),
            Container(
                color: Colors.white,
                // width: MediaQuery
                //     .of(context)
                //     .size
                //     .width,
                height: 250,
                width: 420,
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
                          color: Colors.black
                      ),
                    //  SizedBox(height: 15),
                      SizedBox(
                        height: 20,
                      ),

                      Custom_Text(
                        text: 'تفاصيل',
                        fontSize: 18,
                        color: Colors.cyan,
                      ),

                      SizedBox(
                        height: 20,
                      ),


                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(widget.details,
                            style: TextStyle(color: Colors.lightBlue, fontSize: 16)),
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
                  SizedBox(width: 2,),

                  SizedBox(width: 55),

                ],
              ),
            ),
            Container(height: 30),

                    // InkWell(
                    //   child: Container(
                    //     //   width:333,
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.green)
                    //     ),
                    //     height: 60,
                    //     child: Card(
                    //       color: Colors.red,
                    //       child: Row(
                    //         children: [
                    //
                    //           SizedBox(width: 111),
                    //           //Text(controller.totalPrice.toString(),style:TextStyle(color:Colors.white,fontSize:17),),
                    //           SizedBox(width: 10),
                    //           Container(
                    //             // height: 60,
                    //             child: Text("    شاهد فيديو لوصف الخدمة  ",
                    //               style: TextStyle(
                    //                   color: Colors.white, fontSize: 17),),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    //   onTap: () {
                    //
                    //     // print("ww" + widget.video);
                    //     // launchVideo(widget.video);
                    //
                    //     // Get.to(WebViewScreen(
                    //     //   url:widget.link
                    //     // ));
                    //
                    //
                    //     //  Get.to(CartView2());
                    //   },
                    // ),

                    InkWell(
                      child: Container(
                        //   width:333,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.cyanAccent)
                        ),
                        height: 60,
                        child: Card(
                          color: Colors.lightBlue,
                          child: Row(
                            children: [

                              SizedBox(width: 111),
                              //Text(controller.totalPrice.toString(),style:TextStyle(color:Colors.white,fontSize:17),),
                              SizedBox(width: 10),
                              Container(
                                // height: 60,
                                child: Text("     احجز الان   ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {

                          Get.to(BookingForm(
                            city: widget.city,
                            trip: widget.name,
                          ));
                      },
                    ),

          ])),
    );
  }

  Future<void> launchVideo(String url) async {
    try {
      canLaunch(url);
      await launch(url,enableJavaScript:true,forceWebView:false);

    }
    catch(e){
      print("e="+e.toString());
    }
  }

  Future<void> launchServices(String url) async {
    try {
      canLaunch(url);
      await launch(url,enableJavaScript:true,forceWebView:false,webOnlyWindowName: "prmga club");

    }
    catch(e){
      print("e="+e.toString());
    }
  }
}
