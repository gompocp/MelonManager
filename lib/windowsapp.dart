import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/screens/home.dart';
import 'package:melonmanager/themes.dart';
import 'package:melonmanager/widgets/aboutbutton.dart';
import 'package:melonmanager/widgets/melontext.dart';
import 'package:melonmanager/widgets/navdrawer.dart';
import 'package:melonmanager/widgets/togglethemebutton.dart';

import 'constants.dart';

class WindowsApp extends StatefulWidget {
  @override
  _WindowsAppState createState() => _WindowsAppState();
}

class _WindowsAppState extends State<WindowsApp> {
  Widget currentScreen = Home();
  NavDrawer navDrawer = NavDrawer();
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
    navDrawer.addListener(() {
      setState(() {
        currentScreen = NavDrawer.currentScreen;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (context) {
            return Scaffold(
                drawer: navDrawer,
                body: Builder(
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: currentTheme.currentTheme == ThemeMode.dark
                                  ? appBarDarkBackgroundColor
                                  : appBarLightBackgroundColor
                          ),
                          height: windowsAppBarContainerHeight,
                          child: WindowTitleBarBox(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: IconButton(
                                      tooltip: "Open Navigation Menu",
                                      icon: Icon(Icons.menu_rounded),
                                      splashRadius: 1,
                                      enableFeedback: false,
                                      onPressed: () {
                                        Scaffold.of(context).openDrawer();
                                      }
                                  ),
                                ),
                                Expanded(
                                    child: MoveWindow(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0, top: 2),
                                        child: MelonText(
                                            fontSize: 30
                                        ),
                                      ),
                                    )
                                ),
                                AboutButton(),
                                ToggleThemeButton(),
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
                                    child: CloseWindowButton()
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height - windowsAppBarContainerHeight,
                            child: currentScreen
                        ),
                      ],
                    );
                  }
                ),
            );
          }
      ),
      theme:  CustomThemes.lightTheme,
      darkTheme:  CustomThemes.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
