import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:melonmanager/constants.dart';
import 'package:melonmanager/screens/btd6mods.dart';
import 'package:melonmanager/screens/home.dart';
import 'package:melonmanager/screens/tldmods.dart';
import 'package:melonmanager/screens/vrchatmods.dart';
import 'package:melonmanager/themes.dart';
import 'package:melonmanager/widgets/drawerbanner.dart';
import 'package:melonmanager/widgets/melontext.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
            appBar: AppBar(
              title: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: MelonText(
                    fontSize: 35,
                  )
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.info_rounded),
                    onPressed: () {
                      showAboutDialog(
                        applicationName: 'MelonManager',
                        applicationVersion: '1.0.0',
                        applicationLegalese: '\'Fan made\' mod browser by gompo for mods made with MelonLoader',
                        applicationIcon: Icon(Icons.favorite_outline), //TODO: Switch to ML Icon (maybe ?)
                        context: context,
                        useRootNavigator: false,
                      );
                    }
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_rounded),
                  onPressed: () {currentTheme.toggleTheme();},
                )
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

  updateScreen(screen) {
    setState(() {
      currentScreen = screen;
    });
  }
}
