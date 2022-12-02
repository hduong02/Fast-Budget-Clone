import 'package:flutter/material.dart';
import 'package:moneymanager/ui/shared/text_styles.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';

class BalanceWidget extends StatelessWidget {
  final int income;
  final int expense;
  static const colorList = <Color>[
    Colors.green,
    Colors.red
  ];
  const BalanceWidget({this.income, this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Total balance', style: headerStyle2),
              UIHelper.verticalSpaceMedium(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Income:             ', style: summaryTextStyle),
                  UIHelper.verticalSpaceSmall(),
                  Text(income.toString(), style: incomeTextStyle)
                ],
              ),

              UIHelper.verticalSpaceMedium(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Expense:             ',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text((-expense).toString(), style: expenseTextStyle)
                ],
              ),

              UIHelper.verticalSpaceMedium(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Balance:            ',
                    style: summaryTextStyle,
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Text((income - expense).toString(),
                      style: (income - expense) >= 0 ? incomeTextStyle : expenseTextStyle )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
