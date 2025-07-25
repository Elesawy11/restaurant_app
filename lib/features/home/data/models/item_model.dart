class ItemModel {
  final String name;
  final double price;
  final String id;
  final String image;

  ItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      price: json['price'].toDouble(),
      id: json['id'],
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'name': name, 'price': price, 'image': image, 'id': id};
  }
}
