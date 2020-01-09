// To parse this JSON data, do
//
//     final loggedInUser = loggedInUserFromJson(jsonString);

import 'dart:convert';

LoggedInUser loggedInUserFromJson(String str) =>
    LoggedInUser.fromJson(json.decode(str));

String loggedInUserToJson(LoggedInUser data) => json.encode(data.toJson());

class LoggedInUser {
  String token;
  String message;
  Data data;

  LoggedInUser({
    this.token,
    this.message,
    this.data,
  });

  factory LoggedInUser.fromJson(Map<String, dynamic> json) => LoggedInUser(
        token: json["token"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String name;
  dynamic gender;
  dynamic dateOfBirth;
  String phone;
  int status;
  Group group;
  AtedAt createdAt;
  AtedAt updatedAt;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.name,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.status,
    this.group,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        status: json["status"],
        group: Group.fromJson(json["group"]),
        createdAt: AtedAt.fromJson(json["created_at"]),
        updatedAt: AtedAt.fromJson(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "status": status,
        "group": group.toJson(),
        "created_at": createdAt.toJson(),
        "updated_at": updatedAt.toJson(),
      };
}

class AtedAt {
  DateTime date;
  int timezoneType;
  String timezone;

  AtedAt({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: DateTime.parse(json["date"]),
        timezoneType: json["timezone_type"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "timezone_type": timezoneType,
        "timezone": timezone,
      };
}

class Group {
  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  Group({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
