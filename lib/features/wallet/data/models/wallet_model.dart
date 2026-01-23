import 'package:cloud_firestore/cloud_firestore.dart';

class WalletModel {
  final num balance;
  final Timestamp? updatedAt;

  WalletModel({
    required this.balance,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "balance": balance,
      "updatedAt": updatedAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      balance: json["balance"] ?? 0,
      updatedAt: json["updatedAt"],
    );
  }
}
