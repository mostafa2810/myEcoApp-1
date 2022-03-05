

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
                      width: 25,
                    ),
                    Row(
                      children: [

                        Text(
                          "Luban   ",
                          style: TextStyle(
                              color: HexColor("#ff68682A"),
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width:70,
                          child: Image.asset("assets/wh3.jpeg",
                            fit:BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
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
                          child: Image.asset("assets/P4.jpg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'عطور',));
                      },
                    ),
                    const Text("عطور",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){
                Get.to(BrandsCatView(cat:'عطور',));
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
                          child: Image.asset("assets/h1.jfif",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'حلوي',));
                      },

                    ),
                    const Text("حلوي",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){
                Get.to(BrandsCatView(cat:'حلوي',));
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
                          child: Image.asset("assets/q2.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'بخور',));
                      },
                    ),
                    const Text("بخور",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'بخور',));},
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
                          child: Image.asset("assets/q1.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'ادوات صحية',));
                      },
                    ),
                    const Text("ادوات صحية",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'ادوات صحية',));},
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
                          child: Image.asset("assets/q4.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'بهارات',));
                      },
                    ),
                    const Text("بهارات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),
              ),
              onTap:(){Get.to(BrandsCatView(cat:'بهارات',));},
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
                          child: Image.asset("assets/q3.jpg",fit:BoxFit.fill,)),
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

            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Center(child: Column(
                  children: [
                    InkWell(
                      child: Container(
                          height:100,
                          width:400,
                          child: Image.asset("assets/q6.jpeg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'مكسرات',));
                      },
                    ),
                    const Text("مكسرات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'مكسرات',));},
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
                          child: Image.asset("assets/q5.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'فضيات',));
                      },
                    ),
                    const Text("فضيات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'فضيات',));},
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
                          child: Image.asset("assets/q8.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'فخاريات',));
                      },
                    ),
                    const Text("فخاريات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'فخاريات',));},
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
                          child: Image.asset("assets/w3.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'سعفيات',));
                      },
                    ),
                    const Text("سعفيات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'سعفيات',));},
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
                          child: Image.asset("assets/q7.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'خلطات',));
                      },
                    ),
                    const Text("خلطات",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'خلطات',));},
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
                          child: Image.asset("assets/q9.jpg",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'الزي العماني',));
                      },
                    ),
                    const Text("الزي العماني",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'الزي العماني',));},
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
                          child: Image.asset("assets/q10.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'الزيوت',));
                      },
                    ),
                    const Text("الزيوت",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'الزيوت',));},
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
                          child: Image.asset("assets/q11.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'ماء الورد',));
                      },
                    ),
                    const Text("ماء الورد",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'ماء الورد',));},
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
                          child: Image.asset("assets/q12.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(BrandsCatView(cat:'العسل',));
                      },
                    ),
                    const Text("العسل",style:TextStyle(color:Colors.white,fontSize:22),),
                  ],
                )),
                color: HexColor("#ff68682A"),

              ),
              onTap:(){Get.to(BrandsCatView(cat:'العسل',));},
            ),

            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Column(
                children: [
                  Container(
                      height:100,
                      width:400,
                      child: Image.asset("assets/q13.jpg",fit:BoxFit.fill,)),
                  const Text("اخري",style:TextStyle(color:Colors.white,fontSize:22),),
                ],
              )),
              color: HexColor("#ff68682A"),
            ),

          ],
        )
      ),
    );
  }
}
