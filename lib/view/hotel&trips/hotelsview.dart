





import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:get/get.dart';


import 'details_view2.dart';


class  HotelsView extends StatefulWidget {

  String cat;

  HotelsView({this.cat});


  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<HotelsView> {

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

                SizedBox(
                  height:7,
                ),

                SizedBox(
                  height:7,
                ),

                Flexible(
                  child: StreamBuilder(
                      stream:
                      FirebaseFirestore.instance.collection('hotels') //.where('cat',isEqualTo:widget.cat)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                //   crossAxisCount: 2,
                                //   crossAxisSpacing: 3,
                                //   mainAxisSpacing: 3,),


                                itemBuilder: (BuildContext context, int index) {
                                  DocumentSnapshot posts =
                                  snapshot.data.documents[index];

                                  return GetBuilder<HomeViewModel>(
                                      init: Get.find(),
                                      builder: (controller) => Container(
                                        height:190,
                                          child: InkWell(
                                            child: Card(
                                              color: Colors.white,
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(height:1,),
                                                    Container(
                                                      width: 420,
                                                      height: 140,
                                                      child: Image.network(
                                                          posts.data()['image'],
                                                          fit: BoxFit.fill),
                                                    ),
                                                    SizedBox(height:12),
                                                    Column(
                                                      children: [
                                                        Directionality(
                                                          textDirection:  TextDirection.rtl,
                                                          child: Container(
                                                      //    width:100,
                                                            child: Text((posts.data()['name']),style:TextStyle(color:Colors.black,fontSize:18,
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


                                              Get.to(DetailsView2(
                                                  name: posts.data()['name'],
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



