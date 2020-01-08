// To parse this JSON data, do
//
//     final orangeToken = orangeTokenFromJson(jsonString);

import 'dart:convert';

OrangeToken orangeTokenFromJson(String str) =>
    OrangeToken.fromJson(json.decode(str));
String orangeTokenToJson(OrangeToken data) => json.encode(data.toJson());

class OrangeToken {
  String tokenType;
  String accessToken;
  String expiresIn;

  OrangeToken({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
  });

  factory OrangeToken.fromJson(Map<String, dynamic> json) => OrangeToken(
        tokenType: json["token_type"],
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "token_type": tokenType,
        "access_token": accessToken,
        "expires_in": expiresIn,
      };
}
