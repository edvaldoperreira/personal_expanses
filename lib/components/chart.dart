import 'package:flutter/material.dart';
import 'package:personal_expenses/components/chart_bar.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0;
      for (var element in recentTransactions) {
        if (DateFormat('d/MM/y').format(weekDay) ==
            DateFormat('d/MM/y').format(element.date)) {
          totalSum += element.value;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3).toUpperCase(),
        'value': totalSum
      };
    }).reversed.toList();
  }

  double get totalRecentTransaction {
    return groupTransaction.fold(0.0, (sum, tr) {
      return sum + (tr['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTransaction.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(totalRecentTransaction, e['value'] as double,
                  e['day'] as String),
            );
          }).toList(),
        ),
      ),
    );
  }
}
