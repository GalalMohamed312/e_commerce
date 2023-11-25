import 'package:flutter/cupertino.dart';

import '../helper/extenstion.dart';

class ProductModel {
  String? name, image, description, sized, price,id;
  // Color? color;

  ProductModel(
      {this.name,
      this.image,
      this.description,
        this.id,
      // this.color,
      this.sized,
      this.price});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    image = map['image'];
    description = map['description'];
    // color = HexColor.fromHex(map['color']);
    sized = map['sized'];
    price = map['price'];
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'id': id,
      'sized': sized,
      'price': price,
    };
  }
}
