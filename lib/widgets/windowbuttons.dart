import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/themes.dart';
import 'package:melonmanager/widgets/melontext.dart';

import '../constants.dart';

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.srcOver,
        color: currentTheme.currentTheme == ThemeMode.dark ? appBarDarkBackgroundColor : appBarLightBackgroundColor
      ),
      height: windowsAppBarContainerHeight,
      child: WindowTitleBarBox(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                  icon: Icon(Icons.menu_rounded),
                  //splashRadius: 1,
                  enableFeedback: false,
                  onPressed: () {
                  }
              ),
            ),
            Expanded(
                child: MoveWindow(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: MelonText(
                        fontSize: 30
                    ),
                  ),
                )
            ),
            SizedBox(
                width: windowsAppBarContainerHeight,
                height: windowsAppBarContainerHeight,
                child: MinimizeWindowButton()
            ),
            SizedBox(
                width: windowsAppBarContainerHeight,
                height: windowsAppBarContainerHeight,
                child: MaximizeWindowButton()
            ),
            SizedBox(
                width: windowsAppBarContainerHeight,
                height: windowsAppBarContainerHeight,
                child: CloseWindowButton(
                  /*onPressed: () {
                    if(!kIsWeb && Platform.isWindows) {
                      exit(0);
                    }
                  },*/
                )
            ),
          ],
        ),
      ),
    );
  }
}