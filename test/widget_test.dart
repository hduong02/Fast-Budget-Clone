// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moneymanager/core/database/moor_database.dart';
import 'package:moneymanager/core/models/category.dart';
import 'package:moneymanager/core/viewmodels/insert_transaction_model.dart';
import 'package:moneymanager/core/viewmodels/new_transcation_model.dart';
import 'package:moneymanager/locator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/main.dart';
import 'package:moneymanager/ui/views/details_view.dart';
import 'package:moneymanager/ui/views/edit_view.dart';
import 'package:moneymanager/ui/views/home_view.dart';
import 'package:moneymanager/ui/views/insert_transaction_view.dart';
import 'package:moneymanager/ui/views/new_transaction_view.dart';
import 'package:moneymanager/ui/views/piechart_view.dart';
import 'package:moneymanager/ui/views/reminder_view.dart';
import 'package:moneymanager/ui/views/spash_view.dart';
import 'package:moneymanager/ui/views/transactions_view.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/app_drawer.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/empty_transaction_widget.dart';
import 'package:moneymanager/ui/widgets/all_transactions_view_widget/month_year_picker_widget.dart';
import 'package:moneymanager/ui/widgets/home_view_widgets/balance_widget.dart';
import 'package:overlay_container/overlay_container.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {

  setupLocator();

  testWidgets('Find floating action button in home view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: HomeView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });

    testWidgets('Find cards in new transaction view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: NewTransactionView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.byType(Card), findsWidgets);
  });

    testWidgets('Find add button in insert transaction view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: InsertTranscationView(
              new Category(5, "Shopping", FontAwesomeIcons.shoppingBag, Colors.deepOrange), 5),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.text('ADD'), findsOneWidget);
  });

    testWidgets('Find text in detail view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: DetailsView(
              new Transaction(type: 'expense', day: '2', month: 'Nov', memo: 'abc', amount: 2000, categoryindex: 5)),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.text('2000'), findsOneWidget);
  });

    testWidgets('Find text in edit view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: EditView(new Transaction(type: 'expense', day: '2', month: 'Nov', memo: 'abc', amount: 2000, categoryindex: 5)),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.text('2000'), findsOneWidget);
  });
  
    testWidgets('Find options in pie chart view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: PieChartView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.text('Chart'), findsOneWidget);
  });

    testWidgets('Find text in reminder view', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: ReminderView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.text('Reminder'), findsOneWidget);
  });

    testWidgets('Find text in spash screen', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: SpashView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    await tester.pumpAndSettle();
    expect(find.byType(Text), findsWidgets);
  });

    testWidgets('Find cards in transactions screen', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: TransactionView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.byType(Stack), findsWidgets);
  });

    testWidgets('Find text in empty transaction widget', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: EmptyTransactionsWidget(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    expect(find.byType(Text), findsOneWidget);
  });

  //   testWidgets('Find cards in transactions screen', (WidgetTester tester) async {
  //   Widget testWidget = MediaQuery(
  //       data: MediaQueryData(),
  //       child: MaterialApp(
  //         home: BalanceWidget(),
  //       ));
  //   await tester.pumpWidget(MaterialApp(home: testWidget));
  //   expect(find.byType(Card), findsOneWidget);
  // });

    testWidgets('Find cards in transactions screen', (WidgetTester tester) async {
    Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: HomeView(),
        ));
    await tester.pumpWidget(MaterialApp(home: testWidget));
    await tester.tap(find.byType(IconButton).first);
    expect(find.byType(Text), findsWidgets);
  });


  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
