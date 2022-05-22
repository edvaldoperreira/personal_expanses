import 'dart:io';

import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeAppBar extends StatelessWidget {
  AdaptativeAppBar({Key? key, required this.onClickAction}) : super(key: key);

  static const title = 'Personal Expenses';
  bool _showChart = false;
  final Function(dynamic) onClickAction;
  final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;
  final iconChart = Platform.isIOS ? CupertinoIcons.chart_bar : Icons.bar_chart;
  final iconAdd = Platform.isIOS ? CupertinoIcons.add : Icons.add;

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

    final actions = <Widget>[
      if (isLandscape)
        _getIconButton(_showChart ? iconChart : iconList, () => onClickAction),
      _getIconButton(
        iconAdd,
        onClickAction(context),
      ),
    ];

    final appBarAndroid = AppBar(
      title: const Text(title),
      actions: actions,
    );

    final appBarIos = CupertinoNavigationBar(
      middle: const Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      ),
    );

    // double? _availableHeight() {
    //   mediaQuery.size.height -
    //       (Platform.isAndroid ? appBarAndroid.preferredSize.height : 0) -
    //       mediaQuery.padding.top;
    // }

    return Platform.isIOS ? appBarIos : appBarAndroid;
  }
}
