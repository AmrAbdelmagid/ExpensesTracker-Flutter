import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label; //  refers to the day
  final double amountOfSpending, spendingPercent;

  ChartBar(this.label, this.amountOfSpending, this.spendingPercent);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Column(
          children: <Widget>[
            Container(
                height: constrains.maxHeight * .15,
                child: FittedBox(
                    child: Text('\$${amountOfSpending.toStringAsFixed(0)}'))),
            SizedBox(
              height: constrains.maxHeight * .05,
            ),
            Container(
              height: constrains.maxHeight * .6,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: Color.fromRGBO(220, 220, 200, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPercent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:  constrains.maxHeight * .05,
            ),
            Container(
                height: constrains.maxHeight * .15,
                child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
