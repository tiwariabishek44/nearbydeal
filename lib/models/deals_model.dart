
import 'dart:convert';

class Deals {
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final double discount;
  final double limit;
  final String? id;
  // final List<Rating>? rating;
  Deals({
    required this.name,
    required this.description,
    required this.images,
    required this.discount,
    required this.limit,
    required this.price,
    this.id,
    // this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
      'discount':discount,
      'limit':limit,
      'price': price,
      'id': id,
      // 'rating': rating,
    };
  }

  factory Deals.fromMap(Map<String, dynamic> map) {
    return Deals(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      discount: map['discount']?.toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      limit: map['limit']?.toDouble() ?? 0.0,
      price: map['price']?.toDouble() ?? 0.0,
      id: map['_id'],
      // rating: map['ratings'] != null
      //     ? List<Rating>.from(
      //   map['ratings']?.map(
      //         (x) => Rating.fromMap(x),
      //   ),
      // )
      //     : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Deals.fromJson(String source) =>
      Deals.fromMap(json.decode(source));
}