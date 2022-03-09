

 import 'package:ecommerce/view/brands/brand_cat_view.dart';
import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      width: 188
                    ),
                    Container(
                      width:57,
                      child: Image.asset("assets/wh3.jpeg",
                        fit:BoxFit.cover
                      ),
                    ),
                    SizedBox(
                      width: 5
                    ),

                  ],
                ))),
      ),
      body:Container(
        color:Colors.white,
        child:
        GridView.count(
          primary: false,
          padding: const EdgeInsets.only(top:50,left: 20,right:20,bottom:20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c2.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'العسل العُماني',));
                      },
                    ),
                    const Text("العسل العُماني",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){
                Get.to(BrandsCatView(cat:'العسل العُماني',));
              },
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child:Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c8.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'الحلوى العُمانيه',));
                      },

                    ),
                    const Text("الحلوى العُمانيه",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){
                Get.to(BrandsCatView(cat:'الحلوى العُمانيه',));
              },
            ),

            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c7.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'الطيب العُماني',));
                      },
                    ),
                    const Text("الطيب العُماني",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'الطيب العُماني',));},
            ),
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c6.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'جمال و طبيعه',));
                      },
                    ),
                    const Text("جمال و طبيعه",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'جمال و طبيعة',));},
            ),

            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c5.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'المذاق العُماني',));
                      },
                    ),
                    const Text("المذاق العُماني",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){Get.to(BrandsCatView(cat:'المذاق العُماني',));},
            ),


            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c4.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'تمور',));
                      },
                    ),
                    const Text("تمور",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'تمور',));},
            ),
            //
            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q6.jpeg",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'مكسرات',));
            //           },
            //         ),
            //         const Text("مكسرات",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'مكسرات',));},
            // ),
            //
            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q5.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'فضيات',));
            //           },
            //         ),
            //         const Text("فضيات",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'فضيات',));},
            // ),


            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c3.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'المشغولات العُمانيه',));
                      },
                    ),
                    const Text("المشغولات العُمانيه",style:TextStyle(color:Colors.white,fontSize:18),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'المشغولات العُمانيه',));},
            ),



            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/w3.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'سعفيات',));
            //           },
            //         ),
            //         const Text("سعفيات",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'سعفيات',));},
            // ),


            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q7.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'خلطات',));
            //           },
            //         ),
            //         const Text("خلطات",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'خلطات',));},
            // ),

            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/c1.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'الزي العُماني',));
                      },
                    ),
                    const Text("الزي العُماني",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'الزي العُماني',));},
            ),

            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q10.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'الزيوت',));
            //           },
            //         ),
            //         const Text("الزيوت",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'الزيوت',));},
            // ),

            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q11.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'ماء الورد',));
            //           },
            //         ),
            //         const Text("ماء الورد",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'ماء الورد',));},
            // ),

            // InkWell(
            //   child: Container(
            //     padding: const EdgeInsets.all(8),
            //     child: Center(child: Column(
            //       children: [
            //         InkWell(
            //           child: Container(
            //               height:100,
            //               width:400,
            //               child: Image.asset("assets/q12.png",fit:BoxFit.fill,)),
            //           onTap:(){
            //             Get.to(BrandsCatView(cat:'العسل',));
            //           },
            //         ),
            //         const Text("العسل",style:TextStyle(color:Colors.white,fontSize:22),),
            //       ],
            //     )),
            //     color: HexColor("#ff68682A"),
            //
            //   ),
            //   onTap:(){Get.to(BrandsCatView(cat:'العسل',));},
            // ),
            //
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   child: Center(child: Column(
            //     children: [
            //       Container(
            //           height:100,
            //           width:400,
            //           child: Image.asset("assets/q13.jpg",fit:BoxFit.fill,)),
            //       const Text("اخري",style:TextStyle(color:Colors.white,fontSize:22),),
            //     ],
            //   )),
            //   color: HexColor("#ff68682A"),
            // ),

          ],
        )
      ),
    );
  }
}
