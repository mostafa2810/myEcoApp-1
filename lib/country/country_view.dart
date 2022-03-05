
import 'package:ecommerce/view/home/controll_view.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

 class CountryView extends StatefulWidget {


  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {

   String _value='';

   @override
   Widget build(BuildContext context) {

     String x;
     return Scaffold(
       backgroundColor: Colors.white,
       appBar:AppBar(
         backgroundColor: Colors.white,
         title: Row(
           children: [
             Text("Luban   ",style:TextStyle(  color: HexColor("#ff68682A"),fontSize:22,
                 fontWeight:FontWeight.w700

             ),),
             SizedBox(
               width: 80,
             ),
             Text("لبان   ",style:TextStyle(  color: HexColor("#ff68682A"),fontSize:22,
                 fontWeight:FontWeight.w700

             ),),
           ],
         ),
       ),
       body:Container(
         child:Center(
           child: Column(
           //  mainAxisAlignment:MainAxisAlignment.center,
             crossAxisAlignment:CrossAxisAlignment.center,
             children: [
              SizedBox(
                height:20
              ),
               Row(
                 children: [
                   Radio(
                      value:'سلطنة عمان',
                     activeColor: Colors.green,

                     groupValue:_value,
                     onChanged:(value){
                        print("val ==="+value.toString());
                        setState(() {
                          _value=value;

                        });

                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'سلطنة عمان ',
                     color: Colors.black,
                   )
                 ],
               ),
               SizedBox(
                   height:20
               ),
               Row(
                 children: [
                   Radio(
                     value:'الكويت',
                     activeColor: Colors.green,

                     groupValue:_value,
                     onChanged:(value){
                       print("val ==="+value.toString());
                       setState(() {
                         _value=value;
                       });

                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'الكويت ',
                     color: Colors.black,
                   )
                 ],
               ),
               SizedBox(
                   height:20
               ),
               Row(
                 children: [
                   Radio(
                     value:'امارات',
                     activeColor: Colors.green,

                     groupValue:_value,
                     onChanged:(value){
                       print("val ==="+value.toString());

                       setState(() {
                         _value=value;
                       });

                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'امارات',
                     color: Colors.black,
                   )
                 ],
               ),
               SizedBox(
                   height:20
               ),
               Row(
                 children: [
                   Radio(
                     activeColor: Colors.green,

                     value:'السعودية',
                     groupValue:_value,
                     onChanged:(value){
                       print("val ==="+value.toString());

                       setState(() {
                         _value=value;
                       });
                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'السعودية',
                     color: Colors.black,
                   )
                 ],
               ),
               SizedBox(
                   height:20
               ),
               Row(
                 children: [
                   Radio(
                     activeColor: Colors.green,

                     value:'البحرين',
                     groupValue:_value,
                     onChanged:(value){
                       print("val ==="+value.toString());

                       setState(() {
                         _value=value;
                       });

                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'البحرين',
                     color: Colors.black,
                   )
                 ],
               ),

               SizedBox(
                   height:20
               ),
               Row(
                 children: [
                   Radio(
                     activeColor: Colors.green,

                     value:'قطر',
                     groupValue:_value,
                     onChanged:(value){
                       print("val ==="+value.toString());

                       setState(() {
                         _value=value;
                       });

                       //  Get.offAll(ControlView());
                     },
                   ),
                   SizedBox(width:22),
                   Custom_Text(
                     text: 'قطر',
                     color: Colors.black,
                   )
                 ],
               ),
               SizedBox(
                 height:12
               ),



               RaisedButton(
                   color: HexColor("#ff68682A"),
                   child:Text("انتقل للرئيسية ",
                   style:TextStyle(
                     color:Colors.white,
                     fontSize:18,
                     fontWeight:FontWeight.w700
                   ),
                   ),
                   onPressed:(){
                     final box = GetStorage();
                     final box_country=box.write('country',_value);
                     print("tt"+_value);
                     Get.offAll(ControlView());
                   })
             ],
           ),
         )
       ),
     );
   }
}
