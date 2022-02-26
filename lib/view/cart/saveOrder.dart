


 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/view/widgets/custom_text.dart';
import 'package:ecommerce/viewmodel/cart_viewmodel.dart';
import 'package:ecommerce/viewmodel/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SaveOrder extends StatefulWidget {


  final ud;
  SaveOrder(this.ud);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<SaveOrder> {
  String allposts;
  String v;
  Future resultsLoaded;


  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title:Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.white,
                  ])),
              height:30,
              child: Center(
                  child: Row(
                    children: [
                      SizedBox(
                        width:29,
                      ),
                      /* Container(
                 width:80,
                 child:Image.asset('assets/l1.jfif')
               ),*/
                      Text(" E",style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.w300,fontSize:22)),
                      Text(" Commerce",style:TextStyle(color:Colors.green,fontWeight:FontWeight.w300,fontSize:22)),
                      //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                    ],
                  ))
          ),
          //backgroundColor: Colors.lightBlueAccent,
          actions: <Widget>[
            SizedBox(
              height:5,
            ),
            IconButton(
                color:Colors.red,
                icon: Icon(Icons.logout,size:32,),
                onPressed: () async {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) {
                     //   return  LoginScreen();
                      }));

                })



          ]
      ),
      // drawer: SidebarPage(),

      body:
        GetBuilder<CartViewModel>(
    init:Get.find(),
    builder:(controller) =>
    controller.loading.value?Center(child: CircularProgressIndicator()):
    Container(
        color: Colors.white,
        child: Column(
            children: [
           //   Text("my Cart "),
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Custom_Text(color:Colors.black,text:"MY Cart",fontSize:22,),
              )),
              SizedBox(
                height:7,
              ),
              Flexible(
                //child: Expanded(
                child: StreamBuilder(
                    stream:
                    FirebaseFirestore.instance.collection('Orders')
                    // .where("cat",isNotEqualTo:null)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      final docs =snapshot.data.docs;
                      if (!snapshot.hasData) return Center(child: Text('Loading'));
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new Text('Loading...');
                        default:
                          return Expanded(
                            child: ListView.builder(
                                itemCount: snapshot.data.documents.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot posts = snapshot.data.documents[index];
                                  // int len=snapshot.data.documents.length;
                                  if(snapshot.data == null) return CircularProgressIndicator();
                                  // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
                                  return
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            height: 80,
                                            width: MediaQuery.of(context).size.width / 2,
                                            child: InkWell(
                                              child: Card(
                                                child:
                                                Container(
                                                  child:
                                                  Image.network(posts.data()['img']??" ",
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                              onTap: ()  {

                                              },
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            child: ListTile(
                                              // leading: Image.network(posts.data()['img']),
                                              title: Text(posts.data()['name']??" ",
                                                  style:TextStyle(color:Colors.black,fontSize:24,fontWeight:FontWeight.w300)),
                                              subtitle: Container(
                                                height:30,
                                                child: Text(

                                                  posts.data()['price'].toString()??" ",style:TextStyle(color:Colors.black,fontSize:15,fontWeight:FontWeight.w300),),),
                                           //   trailing: Text(posts.data()['price'] ,style:TextStyle(color:Colors.green,fontSize:20,fontWeight:FontWeight.w300)),
                                            ),
                                          ),

                                        ],
                                      ),

                                    );
                                }),
                          );
                      }
                    }
                ),
              ),
             Center(
               child: Container(
                 child:Center(
                   child: Row(
                     children:[
                       SizedBox(
                         width:120
                       ),
                       Custom_Text(color:Colors.black,text:"total = ",fontSize:22,),
                      // Custom_Text(color:Colors.black,text:controller.totalPrice.toString(),fontSize:16,),
                     ]
                   ),
                 )
               ),
             )


            ]),
      ),



        ));
  }
}
