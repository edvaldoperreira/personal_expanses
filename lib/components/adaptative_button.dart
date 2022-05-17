import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/Material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const AdaptativeButton(this.label, this.onPressed, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Platform.isIOS
        ? CupertinoButton(
            color: theme.primaryColor, child: Text(label), onPressed: onPressed)
        : ElevatedButton(
            child: Text(label),
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(primary: theme.primaryColor),
          );
  }
}
