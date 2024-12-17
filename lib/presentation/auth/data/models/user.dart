import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String uuid;
  @HiveField(1)
  String name;
  @HiveField(2)
  String photoUrl;
  @HiveField(3)
  String email;
  @HiveField(4)
  String password;
  @HiveField(5)
  int mobileNumber;
  @HiveField(6)
  double targetWeight;
  @HiveField(7)
  double currentWeight;
  @HiveField(8)
  double height;
  @HiveField(9)
  String gender;
  @HiveField(10)
  DateTime age;
  @HiveField(11)
  DateTime createdAt;
  User({
    required this.uuid,
    required this.name,
    required this.photoUrl,
    required this.email,
    required this.password,
    required this.mobileNumber,
    required this.targetWeight,
    required this.currentWeight,
    required this.height,
    required this.gender,
    required this.age,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'User(uuid: $uuid, name: $name, createdAt: $createdAt, photoUrl: $photoUrl, email: $email, password: $password, mobileNumber: $mobileNumber, targetWeight: $targetWeight, currentWeight: $currentWeight, height: $height, gender: $gender, age: $age)';
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      email: json['email'],
      password: json['password'],
      mobileNumber: json['mobileNumber'],
      targetWeight: json['targetWeight'] * 1.0,
      currentWeight: json['currentWeight'] * 1.0,
      height: json['height'] * 1.0,
      gender: json['gender'],
      age: DateTime.parse(json['age']),
      createdAt: (json['createdAt'] ?? DateTime.now()),
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'name': name,
        'photoUrl': photoUrl,
        'email': email,
        'password': password,
        'mobileNumber': mobileNumber,
        'targetWeight': targetWeight,
        'currentWeight': currentWeight,
        'height': height,
        'gender': gender,
        'age': age.toString(),
        'createdAt': createdAt.toString(),
      };

  String toJson() => json.encode(toMap());

  factory User.fromMap(dynamic mapV) {
    Map<String, dynamic> map = json.decode(mapV);
    return User(
      uuid: map['uuid'] ?? '',
      name: map['name'] ?? '',
      photoUrl: map['photoUrl'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      mobileNumber: map['mobileNumber'] ?? 0,
      targetWeight: map['targetWeight'] ?? 0.0,
      currentWeight: map['currentWeight'] ?? 0.0,
      height: map['height'] ?? 0.0,
      gender: map['gender'] ?? '',
      age: DateTime.parse(map['age']),
      createdAt: (map['createdAt'] ?? DateTime.now()),
    );
  }
  // Create User from JSON string
  factory User.fromJsonString(dynamic source) =>
      User.fromMap(json.decode(source));

  User copyWith({
    String? email,
    String? password,
    int? mobileNumber,
    double? targetWeight,
    double? currentWeight,
    double? height,
    String? gender,
    DateTime? age,
    DateTime? createdAt,
  }) {
    return User(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      email: email ?? this.email,
      password: password ?? this.password,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      targetWeight: targetWeight ?? this.targetWeight,
      currentWeight: currentWeight ?? this.currentWeight,
      height: height ?? this.height,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      createdAt: (createdAt ?? this.createdAt),
    );
  }
}
