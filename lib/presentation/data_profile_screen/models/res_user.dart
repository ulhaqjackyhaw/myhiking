// To parse this JSON data, do
//
//     final resUser = resUserFromJson(jsonString);

import 'dart:convert';

ResUser resUserFromJson(String str) => ResUser.fromJson(json.decode(str));

String resUserToJson(ResUser data) => json.encode(data.toJson());

class ResUser {
  bool success;
  String message;
  Data data;

  ResUser({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String level;
  String address;
  String nik;
  String phone;
  String emergencyPhone;
  String profilePicture;
  DateTime dateOfBirth;
  DateTime createdAt;
  DateTime updatedAt;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.level,
    required this.address,
    required this.nik,
    required this.phone,
    required this.emergencyPhone,
    required this.profilePicture,
    required this.dateOfBirth,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        level: json["level"],
        address: json["address"],
        nik: json["nik"],
        phone: json["phone"],
        emergencyPhone: json["emergency_phone"],
        profilePicture: json["profile_picture"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "level": level,
        "address": address,
        "nik": nik,
        "phone": phone,
        "emergency_phone": emergencyPhone,
        "profile_picture": profilePicture,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
