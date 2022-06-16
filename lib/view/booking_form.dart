import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

class BookingForm extends StatefulWidget {
  String city, trip;

  BookingForm({this.city, this.trip});

  @override
  State<BookingForm> createState() => _AdressScreenState();
}

class _AdressScreenState extends State<BookingForm> {
  //String brand_email;

  String x = 'Cairo';

  @override
  Widget build(BuildContext context) {
    TextEditingController address3 = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    TextEditingController name = TextEditingController();
    TextEditingController num = TextEditingController();
    TextEditingController mobile = TextEditingController();

    final box = GetStorage();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(
          //   height: 12,
          // ),
          Container(
            height: 220,
            child: Image.asset(
              'assets/t1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            " اختار محافظتك ",
            style: TextStyle(color: Colors.black, fontSize: 19),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Center(
              child: DropdownButton<String>(
                value: x,
                icon: const Icon(Icons.arrow_downward),
                elevation: 18,
                style: const TextStyle(color: Colors.cyanAccent, fontSize: 19),
                underline: Center(
                  child: Container(
                    height: 2,
                    color: Colors.lightBlue,
                  ),
                ),
                onChanged: (String newValue) {
                  x = newValue.toString();
                  setState(() {
                    x = newValue.toString();
                    print('x=' + x.toString());
                  });
                  print('x=' + x.toString());
                },
                items: <String>[
                  'Cairo',
                  'Alex',
                  'Giza',
                  'Fayoum',
                  'Luxor',
                  'Aswan'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Directionality(
              textDirection: TextDirection.ltr,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 88,
                    ),
                    Text(
                      widget.city,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "  الرحلة الي  ",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 3,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 88,
                ),
                Text(
                  widget.trip,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "  الرحلة   ",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0,right: 40,left: 40),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: TextFormField(
                  controller: name,
                  onSaved: (value) {
                    name.text = value;
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return ("ادخل اسمك ");
                    }
                  },


                  // textAlign:TextAlign.end,
                  decoration: InputDecoration(
                    hintText: 'ادخل اسمك    ',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0,right: 40,left: 40),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: TextFormField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    num.text = value;
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return (" ادخل العدد بشكل سليم لا يتجاوز 10 اشخاص للحجز الواحد ");
                    }
                  },


                  // textAlign:TextAlign.end,
                  decoration: InputDecoration(
                    hintText: 'ادخل عدد الاشخاص في الرحلة    ',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0,right: 40,left: 40),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Center(
                child: TextFormField(
                  controller: mobile,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    mobile.text = value;
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return (" ادخل  رقمك للتواصل ");
                    }
                  },

                  // textAlign:TextAlign.end,
                  decoration: InputDecoration(
                    hintText: 'ادخل رقمك للتواصل    ',
                    hintStyle: TextStyle(color: Colors.grey),
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          RaisedButton(
            color:Colors.lightBlue,
            textColor: Colors.white,
            onPressed: (){

            },
          child: Text("احجز الان"),
          )
        ],
      ),
    )
        // GetBuilder<AddressViewModel>(
        //   init:AddressViewModel(),
        //   builder:(controller)=>
        //       SingleChildScrollView(
        //         child: Directionality(
        //           textDirection:TextDirection.rtl,
        //           child: Container(
        //               child:  Form(
        //                 key: _formKey,
        //                 child: Column(
        //                   //  crossAxisAlignment:CrossAxisAlignment.baseline,
        //                     children:[
        //                       SizedBox(
        //                           height:30
        //                       ),
        //                       Column(
        //                         children: [
        //                           Container(
        //                             padding:EdgeInsets.only(left:30),
        //                             width:330,
        //                             child: CustomFormField(
        //                                 controller:controller.country,
        //                                 hint: 'الدولة ',
        //                                 text: '',
        //                                 color:Colors.black,
        //                                 onSave: (value) {
        //                                   controller.country.text= value;
        //                                   print("ttt ="+controller.country.toString());
        //                                 },
        //                                 validator: (value) {
        //                                   if (value == null || value=='' ) {
        //                                     return ("ادخل الدولة ");
        //                                   }
        //                                 }
        //                             ),
        //                           ),
        //
        //                           Container(
        //                             padding:EdgeInsets.only(left:30),
        //                             width:330,
        //                             child: CustomFormField(
        //                                 controller:controller.city,
        //                                 hint: 'المدينة ',
        //                                 text: '',
        //                                 color:Colors.black,
        //                                 onSave: (value) {
        //                                   controller.city.text= value;
        //                                   print("ttt ="+controller.city.toString());
        //                                 },
        //                                 validator: (value) {
        //                                   if (value == null || value=='' ) {
        //                                     return (" ادخل المدينة ");
        //                                   }
        //                                 }
        //                             ),
        //                           ),
        //
        //                           Container(
        //                             padding:EdgeInsets.only(left:30),
        //                             width:330,
        //                             child: CustomFormField(
        //                                 controller:controller.address,
        //                                 hint: 'عنوان الشارع  ',
        //                                 text: '',
        //                                 color:Colors.black,
        //                                 onSave: (value) {
        //                                   controller.address.text= value;
        //                                   print("ttt ="+controller.address.toString());
        //                                 },
        //                                 validator: (value) {
        //                                   if (value == null || value=='' ) {
        //                                     return ("ادخل العنوان  ");
        //                                   }
        //                                 }
        //                             ),
        //                           ),
        //                           Container(
        //                             padding:EdgeInsets.only(left:30),
        //                             width:330,
        //                             child: CustomFormField(
        //                               controller:controller.apartment,
        //                               hint: 'رقم المبني   ',
        //                               text:'',
        //                               color:Colors.black,
        //                               onSave: (value) {
        //                                 controller.apartment .text= value;
        //                               },
        //                               // validator: (value) {
        //                               //   if (value == null|| value=='' ){
        //                               //     return ("Enter apartment ");
        //                               //   }
        //                               // }
        //                             ),
        //                           ),
        //                           Container(
        //                             padding:EdgeInsets.only(left:30),
        //                             width:330,
        //                             child: CustomFormField(
        //                                 controller: controller.floor,
        //                                 hint: 'رقم الشقة  ',
        //                                 text: '',
        //                                 color:Colors.black,
        //                                 onSave: (value) {
        //                                   print("lll= "+value);
        //                                   controller.floor.text= value;
        //                                 },
        //                                 validator: (value) {
        //                                   if (value == null|| value=='') {
        //                                     return ("ادخل رقم الشقة  ");
        //                                   }
        //                                 }
        //                             ),
        //                           ),
        //
        //                           Directionality(
        //                             textDirection:TextDirection.ltr,
        //                             child: Row(
        //                               children: [
        //
        //                                 SizedBox(
        //                                     width:40
        //                                 ),
        //                                 Padding(
        //                                   padding: const EdgeInsets.only(top:28.0),
        //                                   child: DropdownButton<String>(
        //                                     value: controller.dropdownValue,
        //                                     icon: const Icon(Icons.arrow_downward),
        //                                     elevation: 16,
        //                                     style: const TextStyle(color: Colors.deepPurple),
        //                                     underline: Container(
        //                                       height: 2,
        //                                       color: Colors.green,
        //                                     ),
        //                                     onChanged: (String newValue) {
        //                                       setState(() {
        //                                         controller.dropdownValue = newValue;
        //                                         print(controller.dropdownValue);
        //                                       });
        //                                     },
        //                                     items: <String>['+968', '+971', '+965', '+974','+966','+973']
        //                                         .map<DropdownMenuItem<String>>((String value) {
        //                                       return DropdownMenuItem<String>(
        //                                         value: value,
        //                                         child: Text(value),
        //                                       );
        //                                     }).toList(),
        //                                   ),
        //                                 ),
        //                                 SizedBox(
        //                                     width:11
        //                                 ),
        //                                 Container(
        //                                   // padding:EdgeInsets.only(left:30),
        //                                   width:250,
        //                                   child: CustomFormField(
        //                                       controller:controller.mobile,
        //                                       hint: 'رقم الجوال',
        //                                       text:'',
        //                                       color:Colors.black,
        //                                       onSave: (value) {
        //                                         controller.mobile.text= value;
        //                                       },
        //                                       validator: (value) {
        //                                         if (value == null || value==''|| value.length<7|| value.length>15) {
        //                                           return (" ادخل رقم بشكل صحيح");
        //                                         }
        //                                       }
        //                                   ),
        //                                 ),
        //
        //                               ],
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                       SizedBox(
        //                           height:20
        //                       ),
        //                       Container(
        //                         child: RaisedButton(
        //                           color: HexColor("#ff68682A"),
        //                           onPressed: () {
        //                             // print("brand"+brandname);
        //                             //print("emmmaill="+brand_email);
        //                             //print(cartmodel[3].name);
        //                             _formKey.currentState.save();
        //                             if (_formKey.currentState.validate()) {
        //                               print("add2222");
        //                               print("cont" + controller.address.toString());
        //                               controller.addAddress();
        //                               print("add1111");
        //                               box.write('Adress_details1',
        //                                 controller.address.text.toString(),);
        //
        //                               box.write('Adress_details2', controller.apartment.text.toString(),);
        //                               box.write('Adress_details3', controller.floor.text.toString(),);
        //                               box.write('Adress_details4', controller.dropdownValue+controller.mobile.text.toString(),);
        //                               box.write('Adress_country', controller.country.text.toString(),);
        //                               box.write('Adress_city', controller.city.text.toString(),);
        //                               box.write('Lat', widget.lat,);
        //                               box.write('Long',widget.long);
        //                               //Get.to(AddressCheck());
        //                               Get.to( CheckOutScreen2(
        //                                   controller.country.text.toString(),
        //                                   controller.city.text.toString(),
        //                                   controller.address.text.toString(),
        //                                   controller.apartment.text.toString(),
        //                                   controller.floor.text.toString(),
        //                                   controller.dropdownValue+controller.mobile.text.toString(),
        //                                   widget.total,
        //                                   widget.cartmodel,
        //                                   brand_email,
        //                                   //  brandname,
        //                                   widget.lat,
        //                                   widget.long
        //                               ));
        //                             }
        //
        //                             else{
        //                               Get.snackbar('حدث خطا', 'ادخلت بيانات بطريقة خاطئة');
        //                             }
        //                           },
        //                           child:Text("تاكيد الطلب",style:TextStyle(
        //                               color:Colors.white,
        //                               fontSize:22),),
        //                         ),
        //                       )
        //                     ]
        //                 ),
        //               )
        //           ),
        //         ),
        //       ),
        // )
        );
  }
}
