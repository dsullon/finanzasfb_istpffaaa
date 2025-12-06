import 'dart:convert';

class User {
  String id;
  String email;
  String name;
  String password;
  String phone;

  User({
    this.id = "",
    required this.email,
    required this.name,
    required this.password,
    required this.phone,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    password: json["password"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "password": password,
    "phone": phone,
  };
}
