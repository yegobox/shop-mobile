// To parse this JSON data, do
//
//     final wePaymentSession = wePaymentSessionFromJson(jsonString);

import 'dart:convert';

WePaymentSession wePaymentSessionFromJson(String str) =>
    WePaymentSession.fromJson(json.decode(str));

String wePaymentSessionToJson(WePaymentSession data) =>
    json.encode(data.toJson());

class WePaymentSession {
  int status;
  String message;
  String payToken;
  String paymentUrl;
  String notifToken;

  WePaymentSession({
    this.status,
    this.message,
    this.payToken,
    this.paymentUrl,
    this.notifToken,
  });

  factory WePaymentSession.fromJson(Map<String, dynamic> json) =>
      WePaymentSession(
        status: json["status"],
        message: json["message"],
        payToken: json["pay_token"],
        paymentUrl: json["payment_url"],
        notifToken: json["notif_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "pay_token": payToken,
        "payment_url": paymentUrl,
        "notif_token": notifToken,
      };
}
