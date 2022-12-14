import 'package:flutter/material.dart';
import 'package:moneymanager/ui/shared/text_styles.dart';
import 'package:moneymanager/ui/shared/ui_helpers.dart';
import 'package:pie_chart/pie_chart.dart';
class SummaryWidget extends StatelessWidget {
  final int income;
  final int expense;
  static const colorList = <Color>[
    Colors.green,
    Colors.red
  ];
  const SummaryWidget({this.income, this.expense});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  PieChart(dataMap: <String, double> {
                  "Income": income.toDouble(),
                  "Expenses": expense.toDouble(),
                  },
                    chartRadius: 100,
                    chartType: ChartType.ring,
                    ringStrokeWidth: 32,
                    colorList: colorList,
                    legendOptions: LegendOptions(
                      showLegends: false,
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValuesInPercentage: true,
                      showChartValuesOutside: true,
                    )
                  )
                ]
              ),
              SizedBox(width: 32),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Income:             ', style: summaryTextStyle),
                  UIHelper.verticalSpaceSmall(),
                  Text(income.toString(), style: incomeTextStyle)
                ],
              ),

              UIHelper.verticalSpaceMedium(),

              Row(
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
          ],
          ),
        ),
      ),
    );
  }
}
