import 'dart:math';

import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required String currencySymbol,
    required this.item,
    required this.onRemove,
  })  : _currencySymbol = currencySymbol,
        super(key: key);

  final String _currencySymbol;
  final Transaction item;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.black,
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: FittedBox(
              child: Text(
                  '${widget._currencySymbol} ${widget.item.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.item.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.item.date),
        ),
        trailing: MediaQuery.of(context).size.width < 480
            ? IconButton(
                onPressed: () => widget.onRemove(widget.item.id),
                icon: const Icon(Icons.delete_forever),
                color: Colors.red[400],
              )
            : TextButton.icon(
                onPressed: () => widget.onRemove(widget.item.id),
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
  }
}
