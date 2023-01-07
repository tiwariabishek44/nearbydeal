import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  final String phone;
  final String token;
  final String type;
  final List<dynamic> cart;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.phone,
    required this.token,
    required this.type,

    required this.cart,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
      'phone': phone,
      'token': token,
      'type':type,

      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      token: map['token'] ?? '',
      type: map['type'] ?? '',
      cart: List<Map<String, dynamic>>.from(
        map['cart']?.map(
              (x) => Map<String, dynamic>.from(x),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? id,
    String? name,
    String? password,
    String? type,
    String? token,
    String? phone,
    List<dynamic>? cart,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      token: token ?? this.token,
      type: type ?? this.type,
      cart:cart?? this.cart,

    );
  }
}