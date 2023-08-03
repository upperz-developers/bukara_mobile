import 'package:flutter/material.dart' show Color;

import '../../../../providers/recouvrenement/modele.dart';

String dayLeft({required String start, required String end}) {
  DateTime startAt = DateTime.parse(start);
  DateTime endAt = DateTime.parse(end);

  int dayLeft = endAt.difference(startAt).inDays;
  return "$dayLeft jours";
}

double restToPay({required double? amount, required List<Payment>? paiements}) {
  double amountPaied = .0;
  for (Payment p in paiements!) {
    amountPaied += p.amount!;
  }
  return double.parse((amount! - amountPaied).toStringAsFixed(3));
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to true (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
