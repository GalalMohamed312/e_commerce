
class ProductModel {
  String? name,id,battery,color,processor,screen,storage,camera;
  int? price;
  List<dynamic>? images;

  ProductModel(
      {this.name,
        this.images,
        this.id,
        this.color,
        this.screen,
        this.battery,
        this.processor,
        this.storage,
        this.price,
        this.camera,
      });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map.isEmpty) {
      return;
    }

    name = map['name'];
    images = map['image'];
    storage = map['storageAndRam'];
    screen = map['screen'];
    id = map['id'];
    processor = map['processor'];
    battery = map['battery'];
    price = map['price'];
    color = map['color'];
    camera = map['camera'];
  }

  toJson() {
    return {
      'name': name,
      'image': images,
      'description': battery,
      'id': id,
      'sized': battery,
      'price': price,
    };
  }
}
