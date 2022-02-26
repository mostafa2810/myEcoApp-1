

 import 'package:ecommerce/view/category/cateogry_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
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
        ),
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
                        Get.to(CategoryProducts(cat:'عطر',));
                      },
                    ),
                    const Text("عطور",style:TextStyle(color:Colors.black,fontSize:22),),
                  ],
                )),
                color: Colors.teal[100],
              ),
              onTap:(){
                Get.to(CategoryProducts(cat:'عطر',));
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
                        Get.to(CategoryProducts(cat:'حلوي',));
                      },

                    ),
                    const Text("حلوي",style:TextStyle(color:Colors.black,fontSize:22),),
                  ],
                )),
                color: Colors.red[300],
              ),
              onTap:(){
                Get.to(CategoryProducts(cat:'حلوي',));
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
                          child: Image.asset("assets/w3.png",fit:BoxFit.fill,)),
                      onTap:(){
                        Get.to(CategoryProducts(cat:'تكنولوجي',));
                      },
                    ),
                    const Text("منتجات",style:TextStyle(color:Colors.black,fontSize:22),),
                  ],
                )),
                color: Colors.lightGreen,

              ),
              onTap:(){Get.to(CategoryProducts(cat:'تكنولوجي',));},
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Center(child: Column(
                children: [
                  Container(
                      height:100,
                      width:400,
                      child: Image.asset("assets/w6.png",fit:BoxFit.fill,)),
                  const Text("اخري",style:TextStyle(color:Colors.black,fontSize:22),),
                ],
              )),
              color: Colors.teal[400],
            ),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   child: Column(
            //     children: [
            //       Container(
            //           height:100,
            //           width:400,
            //           child: Image.asset("assets/P4.jpg",fit:BoxFit.fill,)),
            //       const Text('Revolution is coming...'),
            //     ],
            //   ),
            //   color: Colors.teal[500],
            // ),
            // Container(
            //   padding: const EdgeInsets.all(8),
            //   child: Column(
            //     children: [
            //       Container(
            //           height:100,
            //           width:600,
            //           child: Image.asset("assets/P4.jpg",fit:BoxFit.fill,)),
            //       const Text('Revolution, they...'),
            //     ],
            //   ),
            //   color: Colors.teal[600],
            // ),
          ],
        )
      ),
    );
  }
}
