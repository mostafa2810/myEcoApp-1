import 'package:ecommerce/helper/extinstion.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class ProductModel {
  String productId, name, image, des, sized,brand,brand_email,x;
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
        this.x,
    this.brand_email,
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
    x=map["x"];

    final box = GetStorage();
    final box_country=box.read('country')??'x';


    if(box_country=='امارات'){
      price =map['priceAmar'];
    }
    if(box_country=='البحرين'){
      price =map['priceBh'];
    }
    if(box_country=='قطر'){
      price =map['priceQ'];
    }
    if(box_country=='سلطنة عمان'){
      price =map['priceAm'];
    }

    if(box_country=='كويت'){
      price =map['priceQw'];
    }
    if(box_country=='السعودية'){
      price =map['price'];
    }
    if(box_country=='x'){
      price =map['price'];
    }
    quant = map['quant'];
    brand = map['brand'];
    brand_email=map['brandemail'];
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
      'brand':brand,
      'x':x,
      'brandemail':brand_email
    };
  }
}
