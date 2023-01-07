
import 'dart:convert';

import 'deals_model.dart';

class Order {
  final String id;
  final List<Deals> products;


  Order({
    required this.id,
    required this.products,

  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),

    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? '',
      products: List<Deals>.from(
          map['products']?.map((x) => Deals.fromMap(x['product']))),

    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}