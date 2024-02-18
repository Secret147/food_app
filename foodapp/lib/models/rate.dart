// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foodapp/models/dish.dart';

class Rate {
  double rate;
  String evalute;
  Dish dish;
  Rate({
    required this.rate,
    required this.evalute,
    required this.dish,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'evalute': evalute,
      'dish': dish.toMap(),
    };
  }

  factory Rate.fromMap(Map<String, dynamic> map) {
    return Rate(
      rate: map['rate'] as dynamic,
      evalute: map['evalute'] as String,
      dish: Dish.fromMap(map['dish'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Rate.fromJson(String source) =>
      Rate.fromMap(json.decode(source) as Map<String, dynamic>);
}
