import 'package:ecommerce/helper/extinstion.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String productId, name, image, des, sized,brand;
  num price;
  num quant;
  String color;

  ProductModel(
      {this.productId,
      this.name,
      this.image,
      this.des,
      this.color,
      this.sized,
      this.brand,
      this.price,
      this.quant});
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    des = map['des'];
    color = map['color'];
    sized = map['sized'];
    price = map['price'];
    quant = map['quant'];
    brand = map['brand'];
    productId = map['productid'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'des': des,
      'color': color,
      'sized': sized,
      'price': price,
      'productid': productId,
      'brand':brand
    };
  }
}
