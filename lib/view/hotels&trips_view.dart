




import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/adsManger.dart';
import 'package:ecommerce/view/category/Allcat.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';

import 'hotel&trips/details_view3.dart';



class  AllhotelsAndTrips extends StatefulWidget {

  String city,trip;


  AllhotelsAndTrips({this.city,this.trip});


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllhotelsAndTrips> {

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
                      FirebaseFirestore.instance.collection(widget.trip) .where('city',isEqualTo:widget.city)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GridView.builder(
                                  itemCount: snapshot.data.documents.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2/3,
                                    crossAxisSpacing: 4,
                                    mainAxisSpacing: 10,
                                  ),
                                  itemBuilder: (BuildContext context, int index) {
                                    DocumentSnapshot posts =
                                    snapshot.data.documents[index];
                                    return GetBuilder<HomeViewModel>(
                                        init: Get.find(),
                                        builder: (controller) => Container(
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
                                                        width: 230,
                                                        height: 174,
                                                        child: Image.network(
                                                            posts.data()['image'],
                                                            fit: BoxFit.cover),
                                                      ),

                                                      SizedBox(height:11),

                                                      Column(
                                                        children: [
                                                          Container(
                                                            //width:100,
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 4,
                                                                ),
                                                                Text((posts.data()['hotel'])
                                                                  ,style:TextStyle(color:Colors.black,fontSize:16,
                                                                      fontWeight:FontWeight.w600),),
                                                              ],
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
                                                      name: posts.data()['hotel'],
                                                      city:widget.city,
                                                      // price: posts.data()['price'],
                                                      //      x:posts.data()['x'],
                                                      details: posts.data()['details'],
                                                      image: posts.data()['image'],
                                                      //link:posts.data()['link'],
                                                      //    brand:posts.data()['brand'],
                                                      //  brandemail:posts.data()['brandemail']
                                                    )
                                                );

                                              },
                                            )));
                                  }),
                            );
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

