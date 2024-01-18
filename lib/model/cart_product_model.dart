class CartProductModel {
  String? name, image,id;
  int? quantity,price;
  // Color? color;

  CartProductModel(
      {this.name,
      this.image,
        this.quantity,
        this.id,
      this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    image = map['image'];
    // quantity = map['quantity'];
    // price = map['price'];
    quantity = map['quantity']as int?;
    price = map['price']as int?;
    id = map['id'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'quantity': quantity,
      'price': price,
      'id': id,
    };
  }
}
