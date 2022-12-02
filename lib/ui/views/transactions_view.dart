import 'package:flutter/material.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/enums/viewstate.dart';
import 'package:moneymanager/core/viewmodels/transactions_model.dart';

import 'package:moneymanager/ui/views/base_view.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/app_bar_title_widget.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/empty_transaction_widget.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/month_year_picker_widget.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/transactions_listview_widget.dart';

class TransactionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TransactionModel>(
      onModelReady: (model) async => await model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: buildAppBar(model.appBarTitle, model),
        body: model.state == ViewState.Busy
            ? Center(child: CircularProgressIndicator())
            : Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                buildList(model.transactions, model),
              ],
            ),
            model.isCollabsed
                ? PickMonthOverlay(
                model: model,
                showOrHide: model.isCollabsed,
                context: context)
                : Container(),
          ],
        ),
      ),
    );
  }

  buildAppBar(String title, TransactionModel model) {
    return AppBar(
      title: AppBarTitle(
        title: title,
        model: model,
      ),
    );
  }

  buildList(List<Transaction> transactions, TransactionModel model) {
    return transactions.length == 0
        ? EmptyTransactionsWidget()
        : TransactionsListView(transactions, model);
  }
}
