

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {

  final CollectionReference _categoryCollectionRef = FirebaseFirestore.instance
      .collection("services");

  final CollectionReference _productCollectionRef = FirebaseFirestore.instance
      .collection("hotels");

  final CollectionReference _carsoulCollectionRef = FirebaseFirestore.instance
      .collection("carsoul");

  Future <List<QueryDocumentSnapshot>> getCategory() async {
    var value=  await _categoryCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getBestSelling() async {
    var value=  await _productCollectionRef.get();
    return value.docs;
  }

  Future <List<QueryDocumentSnapshot>> getCarsoul() async {
    var value=  await _carsoulCollectionRef.get();
    return value.docs;
  }



}

