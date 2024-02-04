// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/user.dart';

class ResponseOrdered {
  dynamic id;
  dynamic quantity;
  dynamic timedelivery;
  dynamic pricedelivery;
  Dish dish;
  ResponseOrdered({
    required this.id,
    required this.quantity,
    required this.timedelivery,
    required this.pricedelivery,
    required this.dish,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'quantity': quantity,
      'timedelivery': timedelivery,
      'pricedelivery': pricedelivery,
      'dish': dish.toMap(),
    };
  }

  factory ResponseOrdered.fromMap(Map<String, dynamic> map) {
    return ResponseOrdered(
      id: map['id'] as dynamic,
      quantity: map['quantity'] as dynamic,
      timedelivery: map['timedelivery'] as dynamic,
      pricedelivery: map['pricedelivery'] as dynamic,
      dish: Dish.fromMap(map['dish'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseOrdered.fromJson(String source) =>
      ResponseOrdered.fromMap(json.decode(source) as Map<String, dynamic>);
}
