import 'package:expenses_tracker/models/transaction.dart';
import 'package:expenses_tracker/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // calculate and return the label of the day ['S','M' etc] and it's total amount of expenses
  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      // determine the day of the current transaction through the index
      DateTime weekDay = DateTime.now().subtract(Duration(days: index));
      double expenseSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].dateTime.day == weekDay.day &&
            recentTransactions[i].dateTime.month == weekDay.month &&
            recentTransactions[i].dateTime.year == weekDay.year) {
          expenseSum += recentTransactions[i].amountOfMoney;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': expenseSum,
      };
    });
  }

  // calculate the total spending per week
  double get totalSpendingPerWeek {
    return groupedTransactionsValues.fold(0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSpendingPerWeek == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpendingPerWeek),
            );
          }).toList(),
        ),
      ),
    );
  }
}
