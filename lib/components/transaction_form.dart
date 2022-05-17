import 'package:flutter/material.dart';
import 'package:personal_expenses/components/adaptative_button.dart';
import 'package:personal_expenses/components/adaptative_datepicker.dart';
import 'package:personal_expenses/components/adaptative_textfield.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double value, DateTime date) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _currencyName = 'EUR';
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;
    if (title.isEmpty || value <= 0 || _selectedDate == null) return;
    widget.onSubmit(title, value, _selectedDate as DateTime);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTextField(_titleController, (_) => {}, 'Title'),
              AdaptativeTextField(
                  _valueController,
                  (_) => _submitForm,
                  'Value ($_currencyName)',
                  const TextInputType.numberWithOptions(decimal: true)),
              AdaptativeDatePicker(_selectedDate, onDateChanged: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton('New transaction', _submitForm),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
