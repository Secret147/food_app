import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String email;
  String password;
  Set<String> roles;
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.roles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'roles': roles.toList(),
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['roles'] = roles.toList();
    return data;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'] as String,
        email: map['email'] as String,
        password: map['password'] as String,
        roles: Set<String>.from(
          (map['roles'] as Set<String>),
        ));
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
