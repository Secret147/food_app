// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProviderModel {
  int id;
  String name;
  String address;

  String rate;
  ProviderModel({
    required this.id,
    required this.name,
    required this.address,
    required this.rate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'address': address,
      'rate': rate,
    };
  }

  factory ProviderModel.fromMap(Map<String, dynamic> map) {
    return ProviderModel(
      id: map['id'] as int,
      name: map['name'] as String,
      address: map['address'] as String,
      rate: map['rate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProviderModel.fromJson(String source) =>
      ProviderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Dish {
  int id;
  String name;
  int price;
  String image;
  String position;
  String description;
  String type;
  int purchases;
  double rate;

  ProviderModel provider;
  Dish({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.position,
    required this.description,
    required this.type,
    required this.purchases,
    required this.rate,
    required this.provider,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'position': position,
      'description': description,
      'type': type,
      'purchases': purchases,
      'rate': rate,
      'provider': provider.toMap(),
    };
  }

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      position: map['position'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
      purchases: map['purchases'] as int,
      rate: map['rate'] as double,
      provider: ProviderModel.fromMap(map['provider'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dish.fromJson(String source) =>
      Dish.fromMap(json.decode(source) as Map<String, dynamic>);
}
