import 'package:flutter/material.dart';
import 'package:melonmanager/screens/home.dart';
import 'package:melonmanager/themes.dart';
import 'package:melonmanager/widgets/aboutbutton.dart';
import 'package:melonmanager/widgets/melontext.dart';
import 'package:melonmanager/widgets/navdrawer.dart';
import 'package:melonmanager/widgets/togglethemebutton.dart';

class DefaultApp extends StatefulWidget {
  @override
  _DefaultAppState createState() => _DefaultAppState();
}

class _DefaultAppState extends State<DefaultApp> {
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
                appBar: AppBar(
                  title: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: MelonText(
                        fontSize: 35,
                      )
                  ),
                  actions: [
                    AboutButton(),
                    ToggleThemeButton(),
                  ],
                ),
                body: currentScreen
            );
          }
      ),
      theme:  CustomThemes.lightTheme,
      darkTheme:  CustomThemes.darkTheme,
      themeMode: currentTheme.currentTheme,
    );
  }
}
