import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/services/data_controller.dart';
import 'package:ecommerce/view/products/products_screen.dart';
import 'package:ecommerce/view/products/products_view.dart';
import 'package:ecommerce/view/widgets/slider_drawer.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/view/search/search_view.dart';
import 'package:ecommerce/viewmodel/control_view_model.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../products/all_products_view.dart';
import '../brands/brands_view.dart';
import '../cart/cart_view.dart';
import '../products/details_view.dart';
import '../widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  String email;
  HomeView({this.email});

  bool isExecuted = false;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeViewModel());
    TextEditingController search_txt = new TextEditingController();
    QuerySnapshot querySnapshot;

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
              backgroundColor:Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              title:Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        // Colors.white,
                        Colors.white,
                        //Colors.lightBlueAccent,

                        // Colors.lightBlueAccent,
                        Colors.white,
                      ])),
                  height:30,
                  child: Center(child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                      ),
                      Text("Luban   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
                          fontWeight:FontWeight.w700

                      ),),
                      SizedBox(
                        width: 80,
                      ),
                      Text("لبان   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
                          fontWeight:FontWeight.w700

                      ),),
                    ],
                  ))
              ),
              //backgroundColor: Colors.lightBlueAccent,
              // actions: <Widget>[
              //   IconButton(
              //       color:Colors.red,
              //       icon: Icon(Icons.apps,size:34,),
              //
              //       onPressed: () {
              //
              //
              //       }),
              //
              //   SizedBox(
              //       width:7
              //   ),
              //   IconButton(
              //       color:Colors.black,
              //       icon: Icon(Icons.apps_sharp,size:34,),
              //
              //       onPressed: () {
              //
              //
              //       })

              //]
          ),


          endDrawer: Padding(
            padding: const EdgeInsets.only(right:60),
            child: SidebarPage(),
          ),
              body: isExecuted
                  ? searchedData
                  : Container(
                      padding: EdgeInsets.only(top: 5, right: 20, left: 20),
                      child: ListView(children: [

                        Card(
                          color: Colors.lightGreen,
                          child: Row(
                            children: [

                              Container(
                                width: 120,
                                height: 70,
                                child: Card(
                                  child: Image.asset(
                                    "assets/lb.jfif",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 55),
                              Container(
                                  child: Text(
                                "Luban",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              )),
                              SizedBox(width: 60),
                              // Container(
                              //     child:Text(" لبان ",style:TextStyle(color:Colors.lightGreen,fontSize:23),)
                              // )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GetBuilder<DataController>(
                            init: DataController(),
                            builder: (controller) => _searchTextFormField()),
                        SizedBox(height: 15),
                        Center(
                            child: SizedBox(
                          height: 120.0,
                          width: 300.0,
                          child: Carousel(
                            boxFit: BoxFit.cover,
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
                            images: [
                              AssetImage('assets/P1.jpg'),
                              AssetImage('assets/P2.jpg'),
                              AssetImage('assets/P3.jfif'),
                              AssetImage('assets/P4.jpg'),
                            ],
                          ),
                        )),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            InkWell(
                              child: Custom_Text(
                                  text: "عرض جميع المتاجر",
                                  color: Colors.lightGreen),
                              onTap: () {
                                Get.to(BrandsView());
                              },
                            ),
                            SizedBox(width: 155),
                            Custom_Text(
                              text: "المتاجر",
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        InkWell(
                          child: _listViewCategory(),
                          onTap: () {},
                        ),
                        SizedBox(height: 40),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  child: Custom_Text(
                                    text: " عرض جميع المنتجات",
                                    fontSize: 16,
                                    color: Colors.lightGreen,
                                  ),
                                  onTap: () {
                                    Get.to(AllProductsView());
                                  }),
                              Custom_Text(
                                text: "  المنتجات   ",
                                fontSize: 18,
                              ),
                            ]),
                        SizedBox(height: 50),
                        _listViewProducts(),
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

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: 4, //controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 70,
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                          width: 200,
                          child: Image.network(
                              controller.categoryModel[index].image)),
                      onTap: () {
                        print("br: " + controller.categoryModel[index].name);
                        Get.to(ProductsView(
                            br: controller.categoryModel[index].name));
                        // Get.to(ProductScreen(
                        //     productmodel: controller.productModel,
                        //     brand: controller.categoryModel[index].namecontroller.categoryModel[index].name));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Custom_Text(
                  text: controller.categoryModel[index].name,
                )
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => SingleChildScrollView(
        child: Container(
          height: 200,
          child: ListView.separated(
            itemCount: controller.productModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                //height:40,
                // width: MediaQuery.of(context).size.width * .4,
                child: InkWell(
                  child: Card(
                    child: Column(
                      children: [
                        GestureDetector(
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.green.shade100,
                              ),
                              height: 100,
                              child: Container(
                                // height: 250,
                                child: Image.network(
                                  controller.productModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            onTap: () {
                              Get.to(DetailsView(
                                model: controller.productModel[index],
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
                        // Expanded(
                        //   child: Custom_Text(
                        //     text:controller.productModel[index].des,
                        //     alignment:Alignment.bottomLeft,
                        //     color:Colors.grey
                        //   ),
                        // ),
                        // SizedBox(
                        //  height:10,
                        // ),
                        Custom_Text(
                            text: controller.productModel[index].price
                                    .toString() +
                                "  ريال",
                            alignment: Alignment.bottomLeft,
                            color: Colors.lightGreen),
                      ],
                    ),
                  ),
                  onTap: () {
                      Get.to(DetailsView(
                                model: controller.productModel[index],
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
