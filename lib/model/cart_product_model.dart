import 'package:ecommerce/constants/const.dart';
import 'package:ecommerce/helper/extinstion.dart';
import 'package:sqflite/sqflite.dart';

class CartProductModel {
  String name, image, price, productId,brand;
  int quantity;


  CartProductModel(
      {this.name, this.image, this.quantity, this.price,this.productId,this.brand});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId = map['productid'];
    brand=map['brand'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'productid': productId,
      'brand':brand
    };
  }
}
