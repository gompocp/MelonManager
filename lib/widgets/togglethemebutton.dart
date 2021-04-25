import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: "Toggle Theme",
      splashRadius: 1,
      icon: Icon(Icons.brightness_4_rounded),
      onPressed: () {currentTheme.toggleTheme();},
    );
  }
}
