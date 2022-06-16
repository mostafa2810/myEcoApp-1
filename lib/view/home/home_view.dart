import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/notification/test_notofication.dart';
import 'package:ecommerce/services/data_controller.dart';
import 'package:ecommerce/view/adsManger.dart';
import 'package:ecommerce/view/hotel&trips/all_trips.dart';
import 'package:ecommerce/view/hotel&trips/details_view2.dart';
import 'package:ecommerce/view/hotel&trips/details_view3.dart';
import 'package:ecommerce/view/hotel&trips/hotelsview.dart';
import 'package:ecommerce/view/widgets/slider_drawer.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/view/search/search_view.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/custom_text.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:admob_flutter/admob_flutter.dart';



class HomeView extends StatefulWidget {

  String email;
  HomeView({this.email});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isExecuted = false;
  FirebaseMessaging fcm=FirebaseMessaging();

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
  //   _nativeAd.reloadAd(forceRefresh:true);
  // }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModel());
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    final box = GetStorage();
    String box_token=box.read('token')??"x";

    Widget searchedData() {
      return ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage(querySnapshot.docs[index].data()['image']),
              ),
              title: Text(querySnapshot.docs[index].data()['name']),
            );
          });
    }

    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            iconTheme: IconThemeData(color: Colors.white),
            title: Container(
                height: 30,
                child: Center(
                child:  Text("Travira",style:TextStyle(
                  fontStyle:  FontStyle.italic
                ),)
                )),
          ),
              drawer: Padding(
                padding: const EdgeInsets.only(right: 60),
                child: SidebarPage(),
              ),
              body: isExecuted
                  ? searchedData
                  : Container(
                      padding: EdgeInsets.only(top: 5, right: 10, left: 20),
                      child: ListView(children: [

                        // Container(
                        //     width:310,
                        //     height:73,
                        //     child:NativeAdmob(
                        //       adUnitID:AdsManger.nativeAdunit,
                        //       numberAds:3,
                        //       controller: _nativeAd,
                        //       type:NativeAdmobType.banner,
                        //     )
                        // ),
                        // SizedBox(height: 17),
                        SizedBox(height: 5),



                        _listViewCarsoul(),


                        SizedBox(height: 33),
                      //  SizedBox(height: 22),
                          Row(
                              children: [
                                Directionality(
                                  textDirection:TextDirection.rtl,
                                  child: InkWell(
                                      child: Custom_Text(
                                        text: "  top_places ",
                                        fontSize: 16,
                                        color:Colors.grey,
                                      ),
                                      onTap: () async {
                                      //  intersitialAd.show();
                                       // Get.to(AllVideosView());
                                         //   AllProductsView()
                                      }),
                                ),
                                SizedBox(width:162,),

                                InkWell(
                                  child: Custom_Text(
                                    text: "See All  ",
                                    fontSize: 16,
                                    color:Colors.lightBlue,
                                  ),
                                  onTap:(){
                                    Get.to(HotelsView());
                                  },
                                ),
                              ]),

                          SizedBox(height: 15),
                          _listViewHotels(),
                        SizedBox(height: 50),
                        Row(
                          children: [
                            Custom_Text(
                              text: "  trips ",
                              fontSize: 16,
                              color:Colors.grey,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left:180),
                              child: InkWell(
                                child: Text(
                                    "All Trips ",style:TextStyle(color:Colors.lightBlue,fontSize:16,
                                    fontWeight:FontWeight.w700
                                )),
                                onTap: () {
                                  Get.to(AllTrips());
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        _listViewTrips(),
                        SizedBox(height: 10),
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

                      ]),
                    )),
    );
  }

  Widget _searchTextFormField() {
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;
    // bool isExecuted = false;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: GetBuilder<DataController>(
          init: DataController(),
          builder: (controller) => TextFormField(
                controller: search_txt,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: InkWell(
                      child: Icon(Icons.search, color: Colors.black),
                      onTap: () {
                        controller.queryData(search_txt.text).then((value) {
                          querySnapshot = value;
                          isExecuted = true;
                          print("issss" + isExecuted.toString());
                          print("qqq=" + querySnapshot.docs.toString());
                          print("sss=" + search_txt.text.toString());
                          Get.to(SearchView(
                            search_txt: search_txt.text.toString(),
                          ));
                        });
                      }),
                ),
              )
          //}
          ),
    );
  }



  Widget _listViewTrips() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 245,
          child: ListView.separated(
            itemCount: controller.categoryModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white,
                              ),
                              height: 180,
                              child: Container(
                                // height: 250,
                                child: Image.network(
                                  controller.categoryModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(DetailsView3(
                                  name: controller.categoryModel[index].name,
                                  details: controller.categoryModel[index].des,
                                  image: controller.categoryModel[index].image,
                                city: controller.categoryModel[index].city,


                              ));

                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Custom_Text(
                          text: controller.categoryModel[index].name.toString(),
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),


                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(DetailsView3(
                        name: controller.categoryModel[index].name,
                        //      x:posts.data()['x'],
                        details: controller.categoryModel[index].des,
                        image: controller.categoryModel[index].image,
                      //  link:controller.categoryModel[index].link,
                     //   video: controller.categoryModel[index].video,
                      //    brand:posts.data()['brand'],
                      //  brandemail:posts.data()['brandemail']
                    ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }



  Widget _listViewCarsoul() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 230,
          child: ListView.separated(
            itemCount: controller.carsoulModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.white,
                              ),
                              //  height: 150,
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                child: Carousel(
                                  autoplay: true,
                                  animationCurve: Curves.fastOutSlowIn,
                                  animationDuration: Duration(milliseconds: 1000),
                                  dotSize: 6.0,
                                  dotIncreasedColor: Color(0xFFFF335C),
                                  dotBgColor: Colors.transparent,
                                  dotPosition: DotPosition.topRight,
                                  dotVerticalPadding: 10.0,
                                  showIndicator: true,
                                  indicatorBgPadding: 7.0,
                                  boxFit:BoxFit.fill,

                                  images: [

                                    NetworkImage(controller.carsoulModel[index].img1),
                                    NetworkImage(controller.carsoulModel[index].img2),
                                    NetworkImage(controller.carsoulModel[index].img3),
                                    NetworkImage(controller.carsoulModel[index].img4),
                                    NetworkImage(controller.carsoulModel[index].img5),
                                    NetworkImage(controller.carsoulModel[index].img6),
                                  ],

                                ),
                              ),
                            ),
                            onTap: () {
                             // intersitialAd.show();
                              Get.to(DetailsView3(
                                  name: controller.categoryModel[index].name,
                                  details: controller.categoryModel[index].des,
                                  image: controller.categoryModel[index].image,
                              ));

                            }),
                        SizedBox(
                          height: 20,
                        ),



                      ],
                    ),
                  ),
                  onTap: () {
                    Get.to(DetailsView3(
                      name: controller.categoryModel[index].name,
                      //      x:posts.data()['x'],
                      details: controller.categoryModel[index].des,
                      image: controller.categoryModel[index].image,
                   //   link:controller.categoryModel[index].link,
                      //video: controller.categoryModel[index].video,
                      //    brand:posts.data()['brand'],
                      //  brandemail:posts.data()['brandemail']
                    ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewHotels() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 235,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  // color: Colors.orange,
                    shape: BoxShape.circle
                ),
                //height:40,
                // width: MediaQuery.of(context).size.width * .4,
                child: InkWell(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(200),
                                color: Colors.white,
                              ),
                              height: 170,
                              child: Container(

                                // height: 250,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                           //   intersitialAd.show();
                              Get.to(DetailsView2(
                                name: controller.productModel[index].name,
                                //price:controller.productModel[index].price,
                                //      x:posts.data()['x'],
                                details: controller.productModel[index].des,
                                image: controller.productModel[index].image,
                               city:controller.productModel[index].city,
                                //    brand:posts.data()['brand'],
                                //  brandemail:posts.data()['brandemail']
                              ));
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        Custom_Text(
                          text: controller.productModel[index].name.toString(),
                          alignment: Alignment.bottomLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    //intersitialAd.show();
                    Get.to(DetailsView2(
                      name: controller.productModel[index].name,
                      //      x:posts.data()['x'],
                      details: controller.productModel[index].des,
                      image: controller.productModel[index].image,
                    city: controller.productModel[index].city,
                      //    brand:posts.data()['brand'],
                      //  brandemail:posts.data()['brandemail']
                    ));
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              width: 20,
            ),
          ),
        ),
      ),
    );
  }
}
