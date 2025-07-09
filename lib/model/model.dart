import 'dart:convert';

class Product {
  String title;
  double price;
  String image;

  Product({required this.title, required this.price, required this.image});

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"],
    price: (json['price'] as num).toDouble(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "image": image,
  };
}
