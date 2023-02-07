// import 'package:flutter/material.dart';

class AccountList {
  final String domain;
  final String key;

  AccountList({required this.domain, required this.key});

  AccountList.fromJson(Map<String, dynamic> json)
    : domain = json['domain'],
      key = json['key'];

  Map<String, dynamic> toJson() {
    return {
      'domain': domain,
      'key': key,
    };
  }

  static void update(String s, String Function(dynamic value) param1) {}
}

// class AccountList {
//   final String domain;
//   final String key;

//   AccountList({required this.domain, required this.key});

//   factory AccountList.fromJson(Map<dynamic, dynamic> json) {
//     return new AccountList(
//             domain: json['domain'] ?? "",
//             key: json['key'] ?? "");
//   }

//   Map<dynamic, dynamic> toJson() {
//     return {
//       'domain': this.domain,
//       'key': this.key,
//     };
//   }
// }