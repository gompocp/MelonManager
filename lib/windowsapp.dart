import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/screens/btd6mods.dart';
import 'package:melonmanager/screens/home.dart';
import 'package:melonmanager/screens/tldmods.dart';
import 'package:melonmanager/screens/vrchatmods.dart';
import 'package:melonmanager/themes.dart';
import 'package:melonmanager/widgets/drawerbanner.dart';
import 'package:melonmanager/widgets/melontext.dart';
import 'package:melonmanager/widgets/windowbuttons.dart';

import 'constants.dart';

class WindowsApp extends StatefulWidget {
  final Drawer drawer;
  const WindowsApp({Key key, this.drawer}) : super(key: key);

  @override
  _WindowsAppState createState() => _WindowsAppState();
}

class _WindowsAppState extends State<WindowsApp> {
  GlobalKey key = GlobalKey<ScaffoldState>();
  Widget currentScreen = Home();
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
          builder: (context) {
            return Scaffold(
                key: key,
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerBanner(),
                      ListTile(
                        title: Text('Home'),
                        onTap: ()  {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = Home();
                          });
                        },
                      ),
                      ListTile(
                        title: Text('VRChat'),
                        onTap: ()  {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = VRChatMods();
                          });
                        },
                      ),
                      ListTile(
                        title: Text('BloonsTD6'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = BTD6Mods();
                          });
                        },
                      ),
                      ListTile(
                        title: Text('The Long Dark'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            currentScreen = TLDMods();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                body: Builder(
                  builder: (context) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              backgroundBlendMode: BlendMode.srcOver,
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
                                IconButton(
                                    splashRadius: 1,
                                    icon: Icon(Icons.info_rounded),
                                    onPressed: () {
                                      showAboutDialog(
                                        applicationName: 'MelonManager',
                                        applicationVersion: '1.0.0',
                                        applicationLegalese: '\'Fan made\' mod browser by gompo for mods made with MelonLoader',
                                        applicationIcon: Image.asset("assets/images/Icon.png"), //Icon(Icons.favorite_outline),  //TODO: Switch to ML Icon (maybe ?)
                                        context: context,
                                        useRootNavigator: false,
                                      );
                                    }
                                ),
                                IconButton(
                                  splashRadius: 1,
                                  icon: Icon(Icons.brightness_4_rounded),
                                  onPressed: () {currentTheme.toggleTheme();},
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
                                    child: CloseWindowButton()
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height - windowsAppBarContainerHeight,
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

  updateScreen(screen) {
    setState(() {
      currentScreen = screen;
    });
  }
}
