// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foodapp/models/dish.dart';
import 'package:foodapp/models/userInfor.dart';

class RateList {
  double rate;
  String evalute;
  UserInfor user;
  Dish dish;
  String created_at;

  RateList({
    required this.rate,
    required this.evalute,
    required this.user,
    required this.dish,
    required this.created_at,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'evalute': evalute,
      'user': user.toMap(),
      'dish': dish.toMap(),
      'created_at': created_at,
    };
  }

  factory RateList.fromMap(Map<String, dynamic> map) {
    return RateList(
      rate: map['rate'] as double,
      evalute: map['evalute'] as String,
      user: UserInfor.fromMap(map['user'] as Map<String, dynamic>),
      dish: Dish.fromMap(map['dish'] as Map<String, dynamic>),
      created_at: map['created_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RateList.fromJson(String source) =>
      RateList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RateList(rate: $rate, evalute: $evalute, user: $user, dish: $dish, created_at: $created_at)';
  }
}
