class ItemModel {
  final String name;
  final double price;

  final String image;

  ItemModel({required this.name, required this.price, required this.image});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      price: json['price'].toDouble(),

      image: json['image'],
    );
  }
}
