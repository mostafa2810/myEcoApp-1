



import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/adsManger.dart';

import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'details_view2.dart';


class AllProductsView extends StatefulWidget {
 

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<AllProductsView> {

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
  //
  //   _nativeAd.reloadAd(forceRefresh:true);
  //
  // }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    final box = GetStorage();
    num price;
    final box_country=box.read('country');
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
        color: Colors.white,
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
                      FirebaseFirestore.instance.collection('products')
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
//.where("category", isEqualTo:"tec")
                          default:
                        return GridView.builder(
                        itemCount: snapshot.data.documents.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 3,
                        ),
                            //(orientation == Orientation.portrait) ? 2: 2.2),
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot posts =
                              snapshot.data.documents[index];
                          return
                            GetBuilder<HomeViewModel>(
                              init: Get.find(),
                              builder: (controller) => Container(
                             //   height:220,
                                  padding: EdgeInsets.all(5),
                                  child: InkWell(
                                    child: Card(
                                      color: Colors.grey[100],
                                      child: Column(children: [
                                        SizedBox(height: 20),
                                        Container(
                                          width: 150,
                                          height: 70,
                                          child: Image.network(
                                              posts.data()['image'],
                                              fit: BoxFit.fitWidth),
                                        ),
                                        SizedBox(height: 2),
                                        Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:16,
                                            fontWeight:FontWeight.bold),),
                                        SizedBox(height: 2),
                                          Text((posts.data()['price']).toString(),
                                            style:TextStyle( color: HexColor("#ff68682A"),fontSize:16,
                                                fontWeight:FontWeight.bold),
                                          ),
                                      ]),
                                    ),
                                    onTap: () {
                             Get.to(DetailsView2(
                               name: posts.data()['name'],

                               //x:posts.data()['x'],
                               details: posts.data()['des'],
                               image: posts.data()['image'],
                               city: posts.data()['city'],
                                                                ));
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
