import 'dart:convert';

UserProfileModel userProfileFromJson(Map<String, dynamic>? data) =>
    UserProfileModel.fromJson(data);

String userProfileToJson(UserProfileModel data) => json.encode(data.toJson);

class UserProfileModel {
  UserProfileModel({
    required this.name,
    required this.id,
    required this.email,
  });

  final String? name;
  final String? id;
  final String? email;

  factory UserProfileModel.fromJson(Map<String, dynamic>? json) =>
      UserProfileModel(
        name: json!["name"],
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "email": email,
      };
}
