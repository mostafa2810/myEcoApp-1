import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/notification/test_notofication.dart';
import 'package:ecommerce/services/data_controller.dart';
import 'package:ecommerce/view/brands/brand_cat_view.dart';
import 'package:ecommerce/view/brands/brands_view2.dart';
import 'package:ecommerce/view/brands/offers_brands.dart';
import 'package:ecommerce/view/category/category.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:ecommerce/view/products/products_view.dart';
import 'package:ecommerce/view/products/products_view2.dart';
import 'package:ecommerce/view/widgets/slider_drawer.dart';
import 'package:ecommerce/viewmodel/auth_view_model.dart';
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
import 'package:hexcolor/hexcolor.dart';
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
    final box = GetStorage();
    final box_name=box.read('name').replaceAll('@','').replaceAll('yahoo.com','').replaceAll('gmail.com','').replaceAll('hotmail.com','');
   // final username=user.displayName;
   // final userData =FirebaseFirestore.instance.collection('users').doc(user.displayName).get();
    Get.put(HomeViewModel());
    Get.put(AuthViewModel());
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
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      // Colors.white,
                      Colors.white,
                      //Colors.lightBlueAccent,

                      // Colors.lightBlueAccent,
                      Colors.white,
                    ])),
                height: 30,
                child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.62
                        ),
                        Container(
                          width:40,
                          //width:57,
                          child: Image.asset("assets/wh3.jpeg",
                              fit:BoxFit.fitWidth
                          ),
                        ),
                        SizedBox(
                            width: 5
                        ),
                      ],
                    ))),
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
                        SizedBox(height: 17),
                        Container(
                          height:66,
                          child:Card(
                              child: Row(
                                children: [
                                  SizedBox(width: 12),
                                  Center(
                            child: Row(
                              children: [

                                Text("  ايش في خاطرك اليوم ؟ ",
                                    style:TextStyle(
                                        color: Colors.black,
                                        fontSize:13,
                                        //  fontStyle:FontStyle.italic,
                                        fontWeight:FontWeight.w800
                                    )),
                                SizedBox(
                                    width:3
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Row(
                                    children: [
                                      Text(box_name.toString() ,
                                        style:TextStyle(
                                            color: Colors.red,
                                            fontSize:14,
                                            //  fontStyle:FontStyle.italic,
                                            fontWeight:FontWeight.w700
                                        ),
                                      ),

                                      Text("   اهلا و سهلا  يا  ",
                                      style:TextStyle(
                                            color: Colors.black,
                                            fontSize:13,
                                          //  fontStyle:FontStyle.italic,
                                            fontWeight:FontWeight.bold
                                      ),
),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                                  SizedBox(width:6),

                                  Container(
                                    width:36,
                                    child: Image.asset("assets/wh3.jpeg",
                                      fit:BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ))
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
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.only(left:233),
                          child: InkWell(
                            child: Custom_Text(
                                text: "جميع الاقسام",
                                color: HexColor("#ff68682A")),
                            onTap: () {
                              Get.to(CategoryView());
                            },
                          ),
                        ),
                       SizedBox(height: 10),
                        _listViewCat(),
                        InkWell(
                          child: Row(
                              children: [
                                SizedBox(
                                    width:30
                                ),
                                Container(
                                    width:40,
                                    child:Image.asset("assets/offers.png")
                                ),
                                SizedBox(
                                    width:16
                                ),
                                InkWell(
                                    child: Custom_Text(
                                      text: "عرض جميع العروض و الخصومات  ",
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                    onTap: () {
                                      Get.to(OffersBrands());
                                    }),


                              ]),
                          onTap:(){
                          //  Get.to();
                          },
                        ),
                        SizedBox(height: 22),
                        Row(
                          children: [
                            InkWell(
                              child: Custom_Text(
                                  text: "عرض جميع المتاجر",
                                color: HexColor("#ff68682A")),
                              onTap: () {
                             //   Get.to(BrandsView());
                                Get.to(PostsScreen());
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



                        //   Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         InkWell(
                        //             child: Custom_Text(
                        //               text: " عرض جميع المنتجات",
                        //               fontSize: 16,
                        //               color:Colors.blue[600],
                        //             ),
                        //             onTap: () {
                        //               Get.to(AllProductsView());
                        //             }),
                        //         Custom_Text(
                        //           text: "  المنتجات   ",
                        //           fontSize: 18,
                        //         ),
                        //       ]),
                        //   SizedBox(height: 50),
                        //   _listViewProducts(),
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
        height: 160,
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
                  width:95,
                  height: 107,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Container(
                          height: 90,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(controller.categoryModel[index].image),
                            // child: Image.network(
                            //     controller.categoryModel[index].image),
                          )),
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


  Widget _listViewCat() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 180,
        child: ListView(
          scrollDirection:Axis.horizontal,
          children: [
            InkWell(
              child:Column(
                children: [
                  Container(
                      width:95,
                      height: 107,
                      child:CircleAvatar(
                          backgroundColor:HexColor("#ff68682A"),
                        backgroundImage:AssetImage('assets/c1.jpeg')),
                          // child: Image.asset('assets/c1.jpeg',fit:BoxFit.fill,))
                  ),
                  SizedBox(
                      height:10
                  ),
                  Text("الزي العُماني",style: TextStyle(
                      color:Colors.black,
                      fontSize:17,
                      fontStyle:FontStyle.italic
                  ),)
                ],
              ),
              onTap:(){

                Get.to(BrandsCatView(cat:"الزي العُماني"));
              },
            ),
            SizedBox(
                width:22
            ),
            InkWell(
                child:Column(
                  children: [
                    Container(
                        width:95,
                        height: 107,
                        child:CircleAvatar(
                          backgroundColor:HexColor("#ff68682A"),
                          backgroundImage: AssetImage("assets/c3.jpeg"),
                        )
                    ),
                    SizedBox(
                        height:10
                    ),
                    Text("المشغولات العُمانيه",style: TextStyle(
                        color:Colors.black,
                        fontSize:17,
                        fontStyle:FontStyle.italic
                    ),)
                  ],
                ),
              onTap:(){
                Get.to(BrandsCatView(cat:"المشغولات العُمانيه"));
              },
            ),
            SizedBox(
                width:22
            ),
            InkWell(
              child:Column(
                children: [
                  Container(
                      width:95,
                      height: 107,
                      child:CircleAvatar(
                        backgroundColor:HexColor("#ff68682A"),
                        backgroundImage:AssetImage('assets/c5.jpeg'),
                         )
                  ),
                  SizedBox(
                      height:10
                  ),
                  Text("المذاق العُماني",style: TextStyle(
                      color:Colors.black,
                      fontSize:17,
                      fontStyle:FontStyle.italic
                  ),)
                ],
              ),
              onTap:(){
                Get.to(BrandsCatView(cat:"المذاق العُماني"));
              },
            ),
            SizedBox(
                width:22
            ),

            // InkWell(
            //   child:Column(
            //     children: [
            //       Container(
            //           width:95,
            //           height: 107,
            //           child:Image.asset('assets/q6.jpeg',fit:BoxFit.fill,)
            //       ),
            //       SizedBox(
            //           height:10
            //       ),
            //       Text("مكسرات",style: TextStyle(
            //           color:Colors.black,
            //           fontSize:18
            //       ),)
            //     ],
            //   ),
            //   onTap:(){
            //     Get.to(BrandsCatView(cat:"مكسرات"));
            //   },
            // ),


            SizedBox(
              width:22
            ),

          ],
        )


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
                            color: Colors.blue[600]),
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
