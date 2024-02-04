// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foodapp/models/dish.dart';

class Ordered {
  Dish dish;
  int quantity;
  Ordered({
    required this.dish,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dish': dish.toMap(),
      'quantity': quantity,
    };
  }

  factory Ordered.fromMap(Map<String, dynamic> map) {
    return Ordered(
      dish: Dish.fromMap(map['dish'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Ordered.fromJson(String source) =>
      Ordered.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Ordered(dish: $dish, quantity: $quantity)';
}
