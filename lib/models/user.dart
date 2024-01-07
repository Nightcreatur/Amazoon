import 'dart:convert';

class Users {
  final String id;
  final String name;
  final String password;
  final String address;
  final String type;
  final String token;
  final String email;

  Users(
      {required this.id,
      required this.name,
      required this.password,
      required this.address,
      required this.type,
      required this.token,
      required this.email});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'_id': id});
    result.addAll({'name': name});
    result.addAll({'password': password});
    result.addAll({'address': address});
    result.addAll({'type': type});
    result.addAll({'token': token});
    result.addAll({'email': email});

    return result;
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));
}
