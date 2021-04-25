import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  const AboutButton({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "About",
        icon: Icon(Icons.info_rounded),
        splashRadius: 1,
        onPressed: () {
          showAboutDialog(
            applicationName: 'MelonManager',
            applicationVersion: '1.0.0',
            applicationLegalese: '\'Fan made\' mod browser by gompo for mods made with MelonLoader',
            applicationIcon: Image.asset("assets/images/Icon.png"),
            context: context,
            useRootNavigator: false,
          );
        }
    );
  }
}
