import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

final _transaction = [
  Transaction('1', 'Ice cream', 10.0, DateTime.now()),
  Transaction('2', 'Bakery', 5.25, DateTime.now()),
  Transaction('3', 'Grocery', 100.84, DateTime.now()),
  Transaction('4', 'Thearer', 40.0, DateTime.now()),
];

class _TransactionUserState extends State<TransactionUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Card(
          color: Colors.blue,
          child: Text('Graph'),
          elevation: 5,
        ),
        TransactionList(_transaction),
        TransactionForm(),
      ],
    );
  }
}
