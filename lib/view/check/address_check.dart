


  import 'package:ecommerce/map/map_screen.dart';
import 'package:ecommerce/map/map_view.dart';
import 'package:ecommerce/map/map_view2.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:ecommerce/view/brands/brands_view.dart';
import 'package:ecommerce/view/check/checkout_screen2.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressCheck extends StatefulWidget {


  num total;
  List<CartProductModel>cartmodel;
  double lat,long;
  String adress,building,floor,phone;

  AddressCheck({this.total,this.cartmodel,this.lat,this.long
  ,this.adress,this.building,this.floor,this.phone
  });

  @override
  _AddressCheckState createState() => _AddressCheckState();


}

class _AddressCheckState extends State<AddressCheck> {





  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      body:
      Container(
        child:Column(
          children: [
            Container(
              height:250,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(widget.lat,widget.long),
                    zoom: 19.151926040649414
                ),
              ),
            ),
            SizedBox(
                height:22
            ),
            Container(
              width:4000,
              height:180,
              color:Colors.grey[200],
              child:Card(
                color:Colors.grey[200],
                child:Padding(
                  padding: const EdgeInsets.only(left:70.0),
                  child: Column(
                   mainAxisAlignment:MainAxisAlignment.center,
                    //crossAxisAlignment:CrossAxisAlignment.center,
                    children:[
                      Row(
                        children: [

                          Custom_Text(
                              text:widget.adress),
                          Custom_Text(
                              text:" : العنوان  "),


                        ],
                      ),
                      SizedBox(
                        height:5,
                      ),
                      Row(
                        children: [

                          Custom_Text(
                              text:widget.building),
                          Custom_Text(
                              text:" : المبني  "),


                        ],
                      ),
                      SizedBox(
                        height:5,
                      ),
                      Row(
                        children: [

                          Custom_Text(
                              text:widget.floor),
                          Custom_Text(
                              text:" : الطابق  "),


                        ],
                      ),
                      SizedBox(
                        height:5,
                      ),
                      Row(
                        children: [

                          Custom_Text(
                              text:widget.phone),
                          Custom_Text(
                              text:" : الهاتف  "),


                        ],
                      ),
                    ]
                  ),
                ),
              )
            ),
            SizedBox(
              height:10
            ),
    Column(
      children: [


        RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)),
        color: Colors.lightGreen,
          child:Text("    تاكيد الطلب علي هذا العنوان     ",style:TextStyle(
              color:Colors.white,
              fontSize:19),),

        onPressed: () {
          Get.to(
              CheckOutScreen2(
               widget.adress.toString(),
                  widget.building.toString(),
              widget.floor.toString(),
              widget.phone.toString(),
                widget.total,
               widget.cartmodel
          ));
        }),


        SizedBox(
          height:6
        ),
        RaisedButton(
            color: Colors.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child:Text("   اضافة عنوان اخر    ",style:TextStyle(
                color:Colors.white,
                fontSize:18),),

            onPressed: () {
              Get.to(
                  MapView2(
                     total:  widget.total,
                     cartmodel: widget.cartmodel
                  ));
            }),
      ],
    )
          ],
        ),

      ),
    );
  }

  nav(){
    Get.to(MapView());
  }
}