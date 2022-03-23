



import 'package:ecommerce/view/home/controll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LastView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body:Center(
        child: Container(
          color:Colors.white,
          child: Column(
            children: [
              SizedBox(
                  height:120
              ),

              Container(

                  height:240,
                  width:330,
                  child: Image.asset('assets/wh3.jpeg',fit:BoxFit.cover,)),


              Container(
                child: Text(" تم الطلب بنجاح  ",
                    style: TextStyle(
                        color: Colors.black, fontSize: 25,
                        fontWeight: FontWeight.w800)),),

              SizedBox(
                  height: 12
              ),


              RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text("  عودة للتصفح   ",style:TextStyle(fontSize:21),),
                  onPressed: () {
                    Get.off(ControlView());
                  })

            ],
          ),
        ),
      ),
    );
  }
}
