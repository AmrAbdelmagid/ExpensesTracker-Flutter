import 'package:flutter/foundation.dart';

class Transaction {
  final String id, title;
  final double amountOfMoney;
  final DateTime dateTime;

  Transaction({
      @required this.id,
      @required this.title,
      @required this.amountOfMoney,
      @required this.dateTime
  });
}
