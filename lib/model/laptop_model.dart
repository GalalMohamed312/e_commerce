
class LaptopModel {
  String? name,id,battery,color,processor,screen,storage,graphicsCard;
  int? price;
  List<dynamic>? images;

  LaptopModel(
      {this.name,
        this.images,
        this.id,
        this.color,
        this.screen,
        this.battery,
        this.processor,
        this.storage,
        this.price,
        this.graphicsCard,
      });

  LaptopModel.fromJson(Map<dynamic, dynamic> map) {
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
    graphicsCard = map['graphicsCard'];
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
