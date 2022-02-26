
import 'package:ecommerce/map/map1.dart';
import 'package:ecommerce/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapView2 extends StatefulWidget {
  num total;
  List<CartProductModel>cartmodel;

  MapView2({this.total,this.cartmodel});



   @override
   _MapView2State createState() => _MapView2State();
 }
 
 class _MapView2State extends State<MapView2> {
   var locationMessage="";
   var position;



   @override
  void initState() {
     currentLocation();
    // TODO: implement initState
    super.initState();
  }


   void currentLocation()async{
     position = await
     Geolocator().getCurrentPosition(desiredAccuracy:LocationAccuracy.high);


     var lastposition=await Geolocator().getLastKnownPosition();
     print(lastposition);
     locationMessage="$position";
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
           child:Center(
             child: Column(
               children: [

                 Container(
                   height:400,
                   child: GoogleMap(
                     initialCameraPosition: CameraPosition(
                         target: LatLng(37.43296265331129, -122.08832357078792),
                         zoom: 19.151926040649414
                     ),

                   ),
                 ),
                 SizedBox(
                     height:10
                 ),
                 //    Text(locationMessage),
                 RaisedButton(
                   onPressed:(){
                     currentLocation();
                     print("jjjj");
                     // print("lll=" +locationMessage);
                     // print( "ooo="+position.latitude.toString(),);
                     // print( "yyy="+position.longitude.toString(),);
                     Get.to
                       (
                         Map1(
                           // l1,l2
                           position.latitude,
                           position.longitude,
                           widget.total,
                           widget.cartmodel,
                         )
                     );
                     print("ddd");
                   },
                   color:Colors.lightGreen,
                   child:
                   Text(
                     "تحديد الموقع الحالي",
                     style:TextStyle(color:Colors.white),
                   ),
                 ),
                 // GoogleMap(
                 //   initialCameraPosition: CameraPosition(
                 //     target: LatLng( l1, l2),
                 //     zoom: 14.4746,
                 //   ),
                 // ),
                 // RaisedButton(onPressed:(){
                 //
                 // },
                 //   color:Colors.lightGreen,
                 //   child:Text("Ok",style:TextStyle(color:Colors.white),),
                 // ),

               ],
             ),
           )
       ),
     );
   }
 }
 