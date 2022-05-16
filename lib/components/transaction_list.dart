import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final _currencySymbol = '€';
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (ctx, index) {
        final item = transactions[index];
        return Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                  child:
                      Text('$_currencySymbol ${item.value.toStringAsFixed(2)}'),
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
            trailing: MediaQuery.of(context).size.width < 480
                ? IconButton(
                    onPressed: () => onRemove(item.id),
                    icon: const Icon(Icons.delete_forever),
                    color: Colors.red[400],
                  )
                : TextButton.icon(
                    onPressed: () => onRemove(item.id),
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    )),
          ),
        );
      },
    );
  }
}
