import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfor {
  String name;
  String phone;
  String address;
  String description;
  String email;
  String image;
  String birth;
  UserInfor({
    required this.name,
    required this.phone,
    required this.address,
    required this.description,
    required this.email,
    required this.image,
    required this.birth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'address': address,
      'description': description,
      'email': email,
      'image': image,
      'birth': birth,
    };
  }

  factory UserInfor.fromMap(Map<String, dynamic> map) {
    return UserInfor(
      name: map['name'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      email: map['email'] as String,
      image: map['image'] as String,
      birth: map['birth'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfor.fromJson(String source) =>
      UserInfor.fromMap(json.decode(source) as Map<String, dynamic>);
}
