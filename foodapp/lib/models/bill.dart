// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:foodapp/models/responseordered.dart';

class Bill {
  String description;
  dynamic totalprice;
  String paymentmethod;
  dynamic discout;
  dynamic delivery;
  String location;
  String create_at;
  List<ResponseOrdered> carts;
  Bill({
    required this.description,
    required this.totalprice,
    required this.paymentmethod,
    required this.discout,
    required this.delivery,
    required this.location,
    required this.create_at,
    required this.carts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'totalprice': totalprice,
      'paymentmethod': paymentmethod,
      'discout': discout,
      'delivery': delivery,
      'location': location,
      'create_at': create_at,
      'carts': carts.map((x) => x.toMap()).toList(),
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      description: map['description'] as String,
      totalprice: map['totalprice'] as dynamic,
      paymentmethod: map['paymentmethod'] as String,
      discout: map['discout'] as dynamic,
      delivery: map['delivery'] as dynamic,
      location: map['location'] as String,
      create_at: map['create_at'] as String,
      carts: List<ResponseOrdered>.from(
        (map['carts'] as List).map<ResponseOrdered>(
          (x) => ResponseOrdered.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Bill.fromJson(String source) =>
      Bill.fromMap(json.decode(source) as Map<String, dynamic>);
}
