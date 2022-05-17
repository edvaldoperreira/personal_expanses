import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final Function(DateTime) onDateChanged;
  final DateTime? selectedDate;

  const AdaptativeDatePicker(this.selectedDate,
      {required this.onDateChanged, Key? key})
      : super(key: key);

  _showDatePicket(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) return;
      onDateChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChanged,
            ),
          )
        : Row(
            children: [
              Text(
                selectedDate == null
                    ? "There is no date selected"
                    : "Selected date ${DateFormat('d/MM/y').format(selectedDate as DateTime)}",
              ),
              TextButton(
                  onPressed: () => _showDatePicket(context),
                  child: const Text(
                    'Transaction date',
                  )),
            ],
          );
  }
}
