








import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';


import 'details_view3.dart';


class  AllTrips extends StatefulWidget {

  String cat;

  AllTrips({this.cat});


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllTrips> {

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Container(
              height: 30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.62
                      ),

                      SizedBox(
                          width: 5
                      ),
                    ],
                  ))),
        ),
        body:
        Container(
          color: Colors.white38,
          child: Column(
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

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('services') //.where('cat',isEqualTo:widget.cat)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) => Container(
                                          height:200,
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.white,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(height:3,),
                                                    Container(
                                                      width: 400,
                                                      height: 144,
                                                      child: Image.network(
                                                          posts.data()['image'],
                                                          fit: BoxFit.fill),
                                                    ),
                                                    SizedBox(height:11),
                                                    Column(
                                                      children: [
                                                        Directionality(
                                                          textDirection:TextDirection.rtl,
                                                          child: Container(
                                                            //width:100,
                                                            child: Text((posts.data()['name']),
                                                              style:TextStyle(color:Colors.black,fontSize:18,
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

                                              Get.to(
                                                  DetailsView3(
                                                name: posts.data()['name'],
                                               // price: posts.data()['price'],
                                                //      x:posts.data()['x'],
                                                details: posts.data()['details'],
                                                image: posts.data()['image'],
                                                city:  posts.data()['city'],
                                                //link:posts.data()['link'],
                                                //    brand:posts.data()['brand'],
                                                //  brandemail:posts.data()['brandemail']
                                              )
                                              );
                                            },
                                          )));
                                });
                        }
                      }),
                ),
                //),
                //  ]),
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

