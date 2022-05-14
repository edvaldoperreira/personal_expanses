import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final _currencySymbol = '€';
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'There is no transactions',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/wait.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final item = transactions[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FittedBox(
                          child: Text(
                              '$_currencySymbol ${item.value.toStringAsFixed(2)}'),
                        ),
                      ),
                    ),
                    title: Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(item.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
