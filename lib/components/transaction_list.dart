import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final _currencySymbol = '€';
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: transactions.map((e) {
        return TransactionItem(
          key: ValueKey(e.id),
          currencySymbol: _currencySymbol,
          item: e,
          onRemove: onRemove,
        );
      }).toList(),
    );
    // return ListView.builder(
    //   itemCount: transactions.length,
    //   itemBuilder: (ctx, index) {
    //     final item = transactions[index];
    //     return TransactionItem(
    //       currencySymbol: _currencySymbol,
    //       item: item,
    //       onRemove: onRemove,
    //     );
    //   },
    // );
  }
}
