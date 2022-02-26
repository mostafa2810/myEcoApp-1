// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/model/product_moidel.dart';
// import 'package:ecommerce/view/details_view.dart';
// import 'package:ecommerce/view/widgets/custom_text.dart';
// import 'package:ecommerce/viewmodel/home_view_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'details_view2.dart';
//
// class ProductScreen extends StatefulWidget {
//   List<ProductModel> productmodel;
//   String brand;
//   ProductScreen({this.productmodel, this.brand});
//
//   @override
//   _PostsScreenState createState() => _PostsScreenState();
// }
//
// class _PostsScreenState extends State<ProductScreen> {
//   String allposts;
//   String v;
//   TextEditingController _searchController = TextEditingController();
//   Future resultsLoaded;
//   List _allResults = [];
//   List _resultsList = [];
//
//   GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
//
//   @override
//   void initState() {
//     setState(() {
//       print("brand =" + widget.productmodel.toString());
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final userData =
//         FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     final orientation = MediaQuery.of(context).orientation;
//     final br=[widget.brand];
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar:AppBar(
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             Text("Luban   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
//                 fontWeight:FontWeight.w700
//
//             ),),
//             SizedBox(
//               width: 80,
//             ),
//             Text("لبان   ",style:TextStyle(color:Colors.lightGreen,fontSize:22,
//                 fontWeight:FontWeight.w700
//
//             ),),
//           ],
//         ),
//       ),
//       //  drawer: SidebarPage(),
//
//       body: Container(
//         color: Colors.grey[200],
//         child: Column(
//           children: [
//             Flexible(
//               child: StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection('products')
//                       .where("brand", isEqualTo: br)
//                       .snapshots(),
//                   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if(snapshot.hasData==null)return Center(child:Text("Loading"));
//                     if(snapshot.data==null)return Center(child:Text("Loading"));
//                     if(snapshot.error)return Center(child:Text("Loading"));
//                     if (!snapshot.hasData) return Center(child: Text('Loading'));
//                     switch (snapshot.connectionState) {
//                       case ConnectionState.waiting:
//                         return new Text('Loading...');
//                       default:
//                         return GridView.builder(
//                             itemCount: snapshot.data.documents.length,
//                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               crossAxisSpacing: 2,
//                               mainAxisSpacing: 3,
//
//                             ), //(orientation == Orientation.portrait) ? 2: 2.2),
//                             itemBuilder: (BuildContext context, int index) {
//                               DocumentSnapshot posts =
//                                   snapshot.data.documents[index];
//                               //           snapshot.data.documents[index];
//                               // return ListView.builder(
//                               //     itemCount: snapshot.data.documents.length,
//                               //     itemBuilder: (context, index) {
//                               //       DocumentSnapshot posts =
//                               //           snapshot.data.documents[index];
//                               // (profile.imgUrl == null) ? AssetImage('images/user-avatar.png') : NetworkImage(profile.imgUrl)
//                               return GetBuilder<HomeViewModel>(
//                                   init: Get.find(),
//                                   builder: (controller) => Container(
//                                       padding: EdgeInsets.all(5),
//                                       child: InkWell(
//                                         child: Card(
//                                           color: Colors.grey[300],
//                                           child: Column(
//                                               children: [
//                                             SizedBox(height: 5),
//                                             Container(
//                                               width: 150,
//                                               height: 90,
//                                               child: Image.network(
//                                                   posts.data()['image']??"",
//                                                   fit: BoxFit.fitWidth),
//                                             ),
//                                             SizedBox(height: 5),
//                                             Text(posts.data()['name']??"",
//                                             style:TextStyle(color:Colors.black,
//                                             fontWeight:FontWeight.bold,
//                                             fontSize:16
//                                             )
//
//                                             ),
//                                             SizedBox(height: 5),
//                                             Text(
//                                                 (posts.data()['price'].toString()??""
//                                                 ), style:TextStyle(color:Colors.green,
//                                             fontWeight:FontWeight.bold,
//                                             fontSize:16)),
//                                           ]),
//                                         ),
//                                         onTap: () {
//                                            Get.to(DetailsView2(
//                                                                       name: posts.data()['name'],
//                                                                       price: posts.data()['price'],
//                                                                       details: posts.data()['des'],
//                                                                       image: posts.data()['image'],
//                                                                       productId:posts.data()['productid'],
//                                                                     ));
//                                         },
//                                       )));
//                             });
//                     }
//                   }),
//             ),
//           ],
//         ),
//         //),
//         //  ]),
//       ),
//     );
//   }
// }
