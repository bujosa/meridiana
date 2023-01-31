import 'dart:convert';

class Subscription {
  final String name;
  final double price;
  final String image;
  final int category;

  Subscription({
    required this.name,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      name: json['name'],
      price: json['price'],
      category: json['category'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price.toString(),
      'category': category,
      'image': image,
    };
  }

  static String encode(List<Subscription> subscriptions) => json.encode(
        subscriptions.map<Map<String, dynamic>>((sub) => sub.toJson()).toList(),
      );

  static List<Subscription> decode(String subscriptions) =>
      (json.decode(subscriptions) as List<dynamic>)
          .map<Subscription>((sub) => Subscription.fromJson(sub))
          .toList();
}
