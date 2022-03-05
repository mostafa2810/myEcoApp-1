

 import 'package:ecommerce/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final Function onPressed;

  const CustomButton({
    this.text,
    this.onPressed
  });


   @override
   Widget build(BuildContext context) {
     return  FlatButton(
         shape:RoundedRectangleBorder(
           borderRadius:BorderRadius.circular(30),

         ),
         padding:EdgeInsets.all(18),
         color: HexColor("#ff68682A"),
         onPressed:onPressed,
         child:Custom_Text(
           text:text,
           fontSize:20,
           alignment:Alignment.center,
           color: Colors.white,
         ));
   }
 }
