










import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/adsManger.dart';
import 'package:ecommerce/view/hotels&trips_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';



class  AllCat extends StatefulWidget {



 String city;
 AllCat({this.city});



  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllCat> {

  String allposts;
  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  List _allResults = [];
  List _resultsList = [];

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();



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
  //   intersitialAd.show();
  //   _nativeAd.reloadAd(forceRefresh:true);
  //
  // }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   iconTheme: IconThemeData(color: Colors.black),
        //   title: Container(
        //       height: 30,
        //       child: Center(
        //           child: Row(
        //             children: [
        //               SizedBox(
        //                   width: MediaQuery.of(context).size.width * 0.62
        //               ),
        //
        //               SizedBox(
        //                   width: 5
        //               ),
        //             ],
        //           ))),
        // ),
        body:
        Container(
          color: Colors.white38,
          child: ListView(
          //  mainAxisAlignment:MainAxisAlignment.center,
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(
                //     width:310,
                //     height:82,
                //     child:NativeAdmob(
                //       adUnitID:AdsManger.nativeAdunit,
                //       numberAds:3,
                //       controller: _nativeAd,
                //       type:NativeAdmobType.banner,
                //     )
                // ),
                SizedBox(
                  height:7,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                //  SizedBox(height:3,),

                                Container(
                                  width: 330,
                                  height: 160,
                                  child: Image.asset('assets/sum1.jpg',fit:BoxFit.fill)
                                ),

                                SizedBox(height:3),

                                Column(
                                  children: [
                                    Directionality(
                                      textDirection:TextDirection.rtl,
                                      child: Container(
                                        //width:100,
                                        child: Text('رحلات مبيت '
                                          ,style:TextStyle(color:Colors.black,fontSize:18,
                                              fontWeight:FontWeight.bold),),
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                              Get.to(AllhotelsAndTrips(
                                city: widget.city,
                                trip: 'trips1',
                              ));

                        },
                      )),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                //  SizedBox(height:3,),

                                Container(
                                    width: 330,
                                    height: 160,
                                    child: Image.asset('assets/sum2.jpg',fit:BoxFit.fill)
                                ),

                                SizedBox(height:3),

                                Column(
                                  children: [
                                    Directionality(
                                      textDirection:TextDirection.rtl,
                                      child: Container(
                                        //width:100,
                                        child: Text('رحلات اليوم الواحد '
                                          ,style:TextStyle(color:Colors.black,fontSize:18,
                                              fontWeight:FontWeight.bold),),
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                          Get.to(AllhotelsAndTrips(
                            city: widget.city,
                            trip: 'trips2',
                          ));

                        },
                      )),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: InkWell(
                        child: Card(
                          elevation: 6,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.white,
                          child: Container(
                            child: Column(
                              children: [
                                //  SizedBox(height:3,),

                                Container(
                                    width: 330,
                                    height: 160,
                                    child: Image.asset('assets/sum3.png',fit:BoxFit.fill,)
                                ),

                                SizedBox(height:3),

                                Column(
                                  children: [
                                    Directionality(
                                      textDirection:TextDirection.rtl,
                                      child: Container(
                                        //width:100,
                                        child: Text('رحلات شبابية '
                                          ,style:TextStyle(color:Colors.black,fontSize:18,
                                              fontWeight:FontWeight.bold),),
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                        onTap: () {

                          Get.to(AllhotelsAndTrips(
                            city: widget.city,
                            trip: 'trips3',
                          ));

                        },
                      )),
                )
              ] ),
        ));
  }
}

//                         }
//                       }
//                   ),
//                 ),
//               //),


//             ]),
//       ),


//     );
//   }
// }

